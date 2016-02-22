package com.project.ttxvn.service;

import com.project.ttxvn.dao.INewsDAO;
import com.project.ttxvn.dao.daoImpl.NewsDAOImpl;
import com.project.ttxvn.model.News;

import java.util.List;

/**
 * Created by longdnguyen on 2/21/16.
 */
public class NewsService extends BaseService<News, INewsDAO, NewsDAOImpl> {

    public NewsService() {
        super(INewsDAO.class, NewsDAOImpl.class);
    }

    public List<News> getAllNews(){
        return findAll();
    }
}
