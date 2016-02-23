package com.project.ttxvn.service;

import com.project.ttxvn.dao.INewsDAO;
import com.project.ttxvn.dao.IUserDAO;
import com.project.ttxvn.dao.daoImpl.NewsDAOImpl;
import com.project.ttxvn.model.News;
import com.project.ttxvn.model.User;
import com.project.ttxvn.utils.MD5Helper;

import javax.ws.rs.*;
import java.util.Date;
import java.util.List;

/**
 * Created by longdnguyen on 2/21/16.
 */
@Path("news")
public class NewsService extends BaseService<News, INewsDAO, NewsDAOImpl> {

    public NewsService() {
        super(INewsDAO.class, NewsDAOImpl.class);
    }

    public List<News> getAllNews(){
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
    public News save(News obj) {
        if (obj.getId() > 0) {
            News tmp = getBean().find(obj.getId());
            tmp.setContent(obj.getContent());
            tmp.setCatId(obj.getCatId());
            tmp.setDateTime(new Date(System.currentTimeMillis()));
            tmp.setTitle(obj.getTitle());
            tmp.setImage(obj.getImage());
            return getBean().edit(tmp);
        } else {
            obj.setDateTime(new Date(System.currentTimeMillis()));
            return super.save(obj);
        }
    }

    @Override
    @GET
    @Path("/find")
    @Produces("application/json")
    public News find(@QueryParam("id") long id) {
        return super.find(id);
    }


    @Override
    @GET
    @Path("/list")
    @Produces("application/json")
    public List<News> findAll() {
        CategoryService categoryService = new CategoryService();
        List<News> list =  super.findAll();
        if (list != null && !list.isEmpty()) {
            for (final News item : list) {
                item.setCategory(categoryService.find(item.getCatId()));
            }
        }
        return list;
    }

    @GET
    @Path("/findByCategory")
    @Produces("application/json")
    public List<News> findByCategory(@QueryParam("id") long id) {
        if (id > 0) {
            CategoryService categoryService = new CategoryService();
            List<News> list = getIBean().findByCategoryId(id);
            if (list != null && !list.isEmpty()) {
                for (final News item : list) {
                    item.setCategory(categoryService.find(item.getCatId()));
                }
            }
            return list;
        } else {
            return findAll();
        }
    }
}
