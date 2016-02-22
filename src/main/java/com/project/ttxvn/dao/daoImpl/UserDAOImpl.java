package com.project.ttxvn.dao.daoImpl;

import com.project.ttxvn.dao.BaseDAO;
import com.project.ttxvn.dao.IUserDAO;
import com.project.ttxvn.model.User;

import javax.ejb.Stateless;
import javax.persistence.NoResultException;
import java.util.List;

/**
 * Created by cmg on 22/02/2016.
 */
@Stateless(name = "UserEJB")
public class UserDAOImpl extends BaseDAO<User> implements IUserDAO {

    public UserDAOImpl() {
        super(User.class);
    }

    @Override
    public User login(String username, String password, int role) {
        try {
            return getEntityManager()
                    .createQuery("SELECT u from " + User.class.getName() + " u "
                            +"WHERE u.email=:e and u.password=:p and u.role=:r", User.class)
                    .setParameter("e", username)
                    .setParameter("p", password)
                    .setParameter("r", role)
                    .setFirstResult(0)
                    .setMaxResults(1)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    public User login(String username, String password) {
        try {
            return getEntityManager()
                    .createQuery("SELECT u from " + User.class.getName() + " u "
                            +"WHERE u.email=:e and u.password=:p", User.class)
                    .setParameter("e", username)
                    .setParameter("p", password)
                    .setFirstResult(0)
                    .setMaxResults(1)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    public List<User> findByRole(int role) {
        return getEntityManager()
                .createQuery("SELECT u from " + User.class.getName() + " u "
                        + "WHERE u.role=:r", User.class)
                .setParameter("r", role)
                .getResultList();
    }
}
