package com.project.ttxvn.service;

import com.project.ttxvn.dao.ICategoryDAO;
import com.project.ttxvn.model.Category;
import com.project.ttxvn.utils.JNDILookUpClass;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.NamingException;
import java.util.List;

/**
 * Created by longdnguyen on 2/21/16.
 */
public class CategoryService {
    @EJB
    ICategoryDAO categoryDAO;

    public CategoryService(){
        Context context = null;
        try {
            context = JNDILookUpClass.getInitialContext();
            String name = JNDILookUpClass.lookUpName(ICategoryDAO.class.getName(), "CategoryEJB");
            categoryDAO = (ICategoryDAO)context.lookup(name);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public List<Category> getAllCategory(){
        return (List<Category>)categoryDAO.findAll();
    }


}
