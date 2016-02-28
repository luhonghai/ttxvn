package com.project.ttxvn.service;

import com.project.ttxvn.dao.IFirstPageDAO;
import com.project.ttxvn.dao.daoImpl.FirstPageDAOImpl;
import com.project.ttxvn.model.FirstPage;

import javax.ws.rs.*;
import java.util.List;

/**
 * Created by Thinh on 28-Feb-16.
 */
@Path("firstPage")
public class FirstPageService extends BaseService<FirstPage, IFirstPageDAO, FirstPageDAOImpl> {
    public FirstPageService() {
        super(IFirstPageDAO.class, FirstPageDAOImpl.class);
    }

    public List<FirstPage> getAllFirstPage() {
        return findAll();
    }


    @Override
    @GET
    @Path("/delete")
    @Produces("application/json")
    public boolean delete(@QueryParam("id") long id) {
        return super.delete(id);
    }

    @Override
    @POST
    @Path("/save")
    @Produces("application/json")
    public FirstPage save(FirstPage obj) {
        return super.save(obj);
    }

    @GET
    @Path("/getCurrent")
    @Produces("application/json")
    public List<FirstPage> getCurrent() {
        return getIBean().getCurrent();
        //return list;
    }

    @Override
    @GET
    @Path("/find")
    @Produces("application/json")
    public FirstPage find(@QueryParam("id") long id) {
        return super.find(id);
    }


    @Override
    @GET
    @Path("/list")
    @Produces("application/json")
    public List<FirstPage> findAll() {
        return super.findAll();
    }
}
