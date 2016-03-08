package com.project.ttxvn.dao.daoImpl;

import com.project.ttxvn.dao.BaseDAO;
import com.project.ttxvn.dao.IPackageNewsDAO;
import com.project.ttxvn.model.PackageNews;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by Thinh on 07-Mar-16.
 */
public class PackageNewsDAOImpl extends BaseDAO<PackageNews> implements IPackageNewsDAO{
    public PackageNewsDAOImpl() {
        super(PackageNews.class);
    }

    public List<PackageNews> findByCategoryId(long id) {
        return getEntityManager()
                .createQuery("SELECT n from " + PackageNews.class.getName() + " n "
                        + "WHERE n.catId=:cId", PackageNews.class)
                .setParameter("cId", id)
                .getResultList();
    }

    @Override
    public List<PackageNews> findByCategoryId(long id, int status) {
        Query query = getEntityManager()
                .createQuery("SELECT n from " + PackageNews.class.getName() + " n "
                        + "WHERE " + (id == 0 ? "" : "n.catId=:cId and") + " n.status = :s", PackageNews.class);
        if (id != 0 ) {
            query.setParameter("cId", id);
        }
        query.setParameter("s", status);
        return query.getResultList();
    }

    @Override
    public List<PackageNews> findByStatus(PackageNews.Status status) {
        return getEntityManager()
                .createQuery("SELECT n from " + PackageNews.class.getName() + " n "
                        + "WHERE n.status=:s", PackageNews.class)
                .setParameter("s", status.getId())
                .getResultList();
    }

    public int countByCategoryId(long id) {
        return Integer.parseInt(getEntityManager()
                .createQuery("SELECT COUNT(n) from " + PackageNews.class.getName() + " n "
                        + "WHERE n.catId=:cId")
                .setParameter("cId", id)
                .getSingleResult().toString());
    }
}
