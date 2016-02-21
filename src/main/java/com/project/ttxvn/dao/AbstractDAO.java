package com.project.ttxvn.dao;


import com.project.ttxvn.constant.Common;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collection;

/**
 * Created by longnguyen on 2/3/15.
 */
public abstract class AbstractDAO<T, V> implements IDAO<T, V> {
    //@PersistenceUnit(unitName = Common.PERSISTENCE_UNIT)
    //private EntityManagerFactory factory;

    @PersistenceContext(name = Common.PERSISTENCE_UNIT)
    private EntityManager em;

    private Class<T> targetClass;

    protected AbstractDAO(Class<T> targetClass) {
        if (targetClass == null) {
            throw new IllegalArgumentException("<Null>");
        }

        this.targetClass = targetClass;
    }

    protected synchronized EntityManager getEm(){
        //this.em = factory.createEntityManager();
        return this.em;
    }

    @Override
    public Collection<T> findAll() {
        return getEm().createQuery("select e from " + targetClass.getSimpleName() + " e").getResultList();
    }

    @Override
    public T findOne(V keyValue) {
        return getEm().find(targetClass, keyValue);
    }

    @Override
    public T save(T object) {
        getEm().persist(object);
        getEm().flush();
        return object;
    }

    @Override
    public T update(T object){
        getEm().merge(object);
        return object;
    }

    @Override
    public void delete(T object){
        getEm().remove(object);
    }

    @Override
    public void deleteById(V objectId){
        T object = getEm().find(targetClass, objectId);
        getEm().remove(object);
    }
}
