package com.project.ttxvn.service;

import com.project.ttxvn.dao.INewsDAO;
import com.project.ttxvn.model.News;
import com.project.ttxvn.utils.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

/**
 * Created by longdnguyen on 2/21/16.
 */
public class NewsService {
    @EJB
    INewsDAO newsDAO;

    public NewsService(){
        Context context = null;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(INewsDAO.class.getName(), "NewsEJB");
            newsDAO = (INewsDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<News> getAllNews(){
        return (List<News>)newsDAO.findAll();
    }
}
