package com.project.ttxvn.dao.daoImpl;

import com.project.ttxvn.dao.BaseDAO;
import com.project.ttxvn.dao.INewsDAO;
import com.project.ttxvn.model.News;
import com.project.ttxvn.model.User;

import javax.ejb.Stateless;
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
}
