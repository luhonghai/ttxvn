package com.project.ttxvn.dao.daoImpl;

import com.project.ttxvn.dao.BaseDAO;
import com.project.ttxvn.dao.INewsDAO;
import com.project.ttxvn.model.News;
import com.project.ttxvn.model.User;

import javax.ejb.Stateless;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;


@Stateless(name = "NewsEJB")
public class NewsDAOImpl extends BaseDAO<News> implements INewsDAO {

    public NewsDAOImpl() {
        super(News.class);
    }

    public List<News> findByCategoryId(long id) {
        return getEntityManager()
                .createQuery("SELECT n from " + News.class.getName() + " n "
                        + "WHERE n.catId=:cId", News.class)
                .setParameter("cId", id)
                .getResultList();
    }

    @Override
    public List<News> findByCategoryId(long id, int pageType) {
        Query query = getEntityManager()
                .createQuery("SELECT n from " + News.class.getName() + " n "
                        + "WHERE " + (id == 0 ? "" : "n.catId=:cId and") + " n.status " + ((pageType == 0) ? "=" : "!=") + " 0", News.class);
        if (id != 0 ) {
            query.setParameter("cId", id);
        }
        return query.getResultList();
    }

    @Override
    public List<News> findByStatus(News.Status status) {
        return getEntityManager()
                .createQuery("SELECT n from " + News.class.getName() + " n "
                        + "WHERE n.status=:s", News.class)
                .setParameter("s", status.getId())
                .getResultList();
    }

    public int countByCategoryId(long id) {
        return Integer.parseInt(getEntityManager()
                .createQuery("SELECT COUNT(n) from " + News.class.getName() + " n "
                        + "WHERE n.catId=:cId")
                .setParameter("cId", id)
                .getSingleResult().toString());
    }

    public List<News> getTop4Newest() {
        return getEntityManager()
                .createQuery("SELECT n from " + News.class.getName() + " n "
                        + "ORDER BY n.dateTime DESC", News.class)
                .setMaxResults(4)
                .getResultList();
    }

    @Override
    public News findByUUID(String uuid) {
        try {
            return getEntityManager()
                    .createQuery("SELECT u from " + News.class.getName() + " u "
                            + "WHERE u.uuid=:ud", News.class)
                    .setParameter("ud", uuid)
                    .setFirstResult(0)
                    .setMaxResults(1)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
