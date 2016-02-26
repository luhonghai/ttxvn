package com.project.ttxvn.dao.daoImpl;

import com.project.ttxvn.dao.BaseDAO;
import com.project.ttxvn.dao.INewsRequestDAO;
import com.project.ttxvn.model.NewsRequest;

import javax.ejb.Stateless;

/**
 * Created by cmg on 26/02/2016.
 */
@Stateless(name = "NewsRequestEJB")
public class NewsRequestDAOImpl extends BaseDAO<NewsRequest> implements INewsRequestDAO {

    public NewsRequestDAOImpl() {
        super(NewsRequest.class);
    }
}
