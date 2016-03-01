package com.project.ttxvn.dao.daoImpl;

import com.project.ttxvn.dao.BaseDAO;
import com.project.ttxvn.dao.INewsDAO;
import com.project.ttxvn.model.News;

import javax.ejb.Stateless;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by longdnguyen on 2/21/16.
 */
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
    public List<News> findByCategoryId(long id, int status) {
        Query query = getEntityManager()
                .createQuery("SELECT n from " + News.class.getName() + " n "
                        + "WHERE " + (id == 0 ? "" : "n.catId=:cId and") + " n.status = :s", News.class);
        if (id != 0 ) {
            query.setParameter("cId", id);
        }
        query.setParameter("s", status);
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

}
