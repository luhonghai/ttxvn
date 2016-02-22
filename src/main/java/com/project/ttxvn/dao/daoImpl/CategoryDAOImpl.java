package com.project.ttxvn.dao.daoImpl;

import com.project.ttxvn.dao.BaseDAO;
import com.project.ttxvn.dao.ICategoryDAO;
import com.project.ttxvn.model.Category;

import javax.ejb.Stateless;

/**
 * Created by longdnguyen on 2/21/16.
 */
@Stateless(name = "CategoryEJB")
public class CategoryDAOImpl extends BaseDAO<Category> implements ICategoryDAO {

    public CategoryDAOImpl() {
        super(Category.class);
    }
}
