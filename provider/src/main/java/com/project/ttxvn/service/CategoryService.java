package com.project.ttxvn.service;

import com.project.ttxvn.dao.ICategoryDAO;
import com.project.ttxvn.dao.daoImpl.CategoryDAOImpl;
import com.project.ttxvn.model.Category;

import javax.ws.rs.*;
import java.util.List;


@Path("category")
public class CategoryService extends BaseService<Category, ICategoryDAO, CategoryDAOImpl> {

    public CategoryService() {
        super(ICategoryDAO.class, CategoryDAOImpl.class);
    }

    public List<Category> getAllCategory(){
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
    public Category save(Category obj) {
        if (obj.getId() > 0) {
            Category tmp = getBean().find(obj.getId());
            tmp.setDescription(obj.getDescription());
            tmp.setTitle(obj.getTitle());
            return getBean().edit(tmp);
        } else {
            return super.save(obj);
        }
    }

    @Override
    @GET
    @Path("/find")
    @Produces("application/json")
    public Category find(@QueryParam("id") long id) {
        return super.find(id);
    }


    @Override
    @GET
    @Path("/list")
    @Produces("application/json")
    public List<Category> findAll() {
        List<Category> list =  super.findAll();
        NewsService newsService = new NewsService();
        if (list != null && !list.isEmpty()) {
            for (final Category category : list) {
                category.setNewsCount(newsService.countByCategory(category.getId()));
            }
        }
        return list;
    }
}
