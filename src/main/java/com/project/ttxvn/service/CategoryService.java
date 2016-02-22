package com.project.ttxvn.service;

import com.project.ttxvn.dao.ICategoryDAO;
import com.project.ttxvn.dao.daoImpl.CategoryDAOImpl;
import com.project.ttxvn.model.Category;

import java.util.List;

/**
 * Created by longdnguyen on 2/21/16.
 */
public class CategoryService extends BaseService<Category, ICategoryDAO, CategoryDAOImpl> {

    public CategoryService() {
        super(ICategoryDAO.class, CategoryDAOImpl.class);
    }

    public List<Category> getAllCategory(){
        return findAll();
    }


}
