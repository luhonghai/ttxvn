package com.project.ttxvn.dao;

import com.project.ttxvn.model.User;

import javax.ejb.Remote;
import java.util.List;

@Remote
public interface IUserDAO extends IBaseDAO<User> {

    User login(String username, String password, int role);

    User login(String username, String password);

    List<User> findByRole(int role);
}
