package com.project.ttxvn.dao;

import java.util.List;

public interface IBaseDAO<T> {
    T persist(T entity);

    T edit(T entity);

    T remove(long id);

    T remove(T entity);

    List<T> findAll();

    T find(Long id);

    int count();
}
