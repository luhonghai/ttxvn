package com.project.ttxvn.dao.daoImpl;

import com.project.ttxvn.dao.BaseDAO;
import com.project.ttxvn.dao.INewsImageDAO;
import com.project.ttxvn.model.ImageNews;

import javax.ejb.Stateless;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by Thinh on 05-Mar-16.
 */
@Stateless(name = "ImageNewsEJB")
public class ImageNewsDAOImpl extends BaseDAO<ImageNews> implements INewsImageDAO {
    public ImageNewsDAOImpl() {
        super(ImageNews.class);
    }

    public List<ImageNews> findByCategoryId(long id) {
        return getEntityManager()
                .createQuery("SELECT n from " + ImageNews.class.getName() + " n "
                        + "WHERE n.catId=:cId", ImageNews.class)
                .setParameter("cId", id)
                .getResultList();
    }

    @Override
    public List<ImageNews> findByCategoryId(long id, int status) {
        Query query = getEntityManager()
                .createQuery("SELECT n from " + ImageNews.class.getName() + " n "
                        + "WHERE " + (id == 0 ? "" : "n.catId=:cId and") + " n.status = :s", ImageNews.class);
        if (id != 0 ) {
            query.setParameter("cId", id);
        }
        query.setParameter("s", status);
        return query.getResultList();
    }

    @Override
    public List<ImageNews> findByStatus(ImageNews.Status status) {
        return getEntityManager()
                .createQuery("SELECT n from " + ImageNews.class.getName() + " n "
                        + "WHERE n.status=:s", ImageNews.class)
                .setParameter("s", status.getId())
                .getResultList();
    }

    public int countByCategoryId(long id) {
        return Integer.parseInt(getEntityManager()
                .createQuery("SELECT COUNT(n) from " + ImageNews.class.getName() + " n "
                        + "WHERE n.catId=:cId")
                .setParameter("cId", id)
                .getSingleResult().toString());
    }

}

