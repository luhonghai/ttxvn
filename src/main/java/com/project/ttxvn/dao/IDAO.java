package com.project.ttxvn.dao;

import java.util.Collection;

/**
 * Created by longdnguyen on 2/21/16.
 */
public interface IDAO<T,V> {
    public T findOne(V key);

    public Collection<T> findAll();

    public T save(T object);

    public T update(T object);

    public void delete(T object);

    public void deleteById(V objectId);
}
