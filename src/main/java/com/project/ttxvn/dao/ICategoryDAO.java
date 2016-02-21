package com.project.ttxvn.dao;

import com.project.ttxvn.model.Category;

import javax.ejb.Remote;

/**
 * Created by longdnguyen on 2/21/16.
 */
@Remote
public interface ICategoryDAO extends IDAO<Category, Integer>{

}
