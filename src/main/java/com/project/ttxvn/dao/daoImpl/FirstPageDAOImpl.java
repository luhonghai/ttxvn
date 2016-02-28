package com.project.ttxvn.dao.daoImpl;

import com.project.ttxvn.dao.BaseDAO;
import com.project.ttxvn.dao.IFirstPageDAO;
import com.project.ttxvn.model.FirstPage;

import javax.ejb.Stateless;
import java.util.List;

/**
 * Created by Thinh on 28-Feb-16.
 */
@Stateless(name = "FirstPageEJB")
public class FirstPageDAOImpl extends BaseDAO<FirstPage> implements IFirstPageDAO {
    public FirstPageDAOImpl() {
        super(FirstPage.class);
    }

    public List<FirstPage> getCurrent() {
        return getEntityManager()
                .createQuery("SELECT n from " + FirstPage.class.getName() + " n "
                        + "ORDER BY n.updateTime DESC", FirstPage.class)
                .setMaxResults(3)
                .getResultList();
    }
}
