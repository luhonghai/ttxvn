package com.project.ttxvn.service;

import com.project.ttxvn.model.Category;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * Created by Thinh on 06-Mar-16.
 */
@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface ICategorySoap {

    List<Category> getAllCategory();

    boolean delete(long id);

    Category save(Category obj);

    Category find(long id);

    List<Category> findAll();
}
