package com.project.ttxvn.dao.daoImpl;

import com.project.ttxvn.dao.AbstractDAO;
import com.project.ttxvn.dao.INewsDAO;
import com.project.ttxvn.model.News;

import javax.ejb.Stateless;

/**
 * Created by longdnguyen on 2/21/16.
 */
@Stateless(name = "NewsEJB")
public class NewsDAOImpl extends AbstractDAO<News, Integer> implements INewsDAO {

    public NewsDAOImpl() {
        super(News.class);
    }
}
