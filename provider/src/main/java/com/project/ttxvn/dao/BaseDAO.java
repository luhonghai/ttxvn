package com.project.ttxvn.dao;

import com.project.ttxvn.constant.Common;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public abstract class BaseDAO<T> implements IBaseDAO<T> {

	private Class<T> entityClass;
	
	@PersistenceContext(unitName = Common.PERSISTENCE_UNIT)
	private EntityManager entityManager;
	
	public BaseDAO(Class<T> entityClass) {
        this.entityClass = entityClass;
    }
	
	protected EntityManager getEntityManager() {
		return entityManager;
	}
	
	public T persist(T entity) {
        getEntityManager().persist(entity);
        getEntityManager().flush();
        return entity;
    }

    public T edit(T entity) {
        getEntityManager().merge(entity);
        getEntityManager().flush();
        return entity;
    }
    
    public T remove(long id) {
    	T t = find(id);
    	getEntityManager().remove(t);
    	return t;
    }

    public T remove(T entity) {
        getEntityManager().remove(entity);
        return entity;
    }

    @SuppressWarnings("unchecked")
	public List<T> findAll() {
        return getEntityManager()
        		.createQuery("SELECT e FROM " + entityClass.getName()
                + " e").getResultList();
    }

    public T find(Long id) {
        return getEntityManager().find(entityClass, id);
    }

    public int count() {
        return Integer.parseInt(getEntityManager()
                .createQuery("SELECT COUNT(e) FROM " + entityClass.getName()
                        + " e").getSingleResult().toString());
    }
}
