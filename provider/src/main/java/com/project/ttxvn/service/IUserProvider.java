package com.project.ttxvn.service;

import com.project.ttxvn.model.User;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * Created by Thinh on 06-Mar-16.
 */
@WebService()
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface IUserProvider {

    boolean delete(long id);

    User save(User obj);

    User find(long id);

    List<User> findByRole( int role);

    List<User> findAll();

    User login(String username, String password);
}
