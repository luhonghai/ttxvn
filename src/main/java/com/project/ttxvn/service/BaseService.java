package com.project.ttxvn.service;

import com.project.ttxvn.dao.IBaseDAO;
import com.project.ttxvn.model.IBaseEntity;
import com.project.ttxvn.utils.EJBConnector;

import java.util.List;
import java.util.logging.Logger;

public abstract class BaseService<B, T, K> {

	protected Logger logger = Logger.getLogger(this.getClass().getName());

	private final IBaseDAO<B> bean;

	public BaseService() {
		this.bean = null;
	}
	
	@SuppressWarnings("unchecked")
	public BaseService(Class<T> remoteClass, Class<K> statelessClass) {
		this.bean = (IBaseDAO<B>) new EJBConnector<T,K>(remoteClass, statelessClass).newInstance();
	}
	
	protected IBaseDAO<B> getBean() {
		return bean;
	}

	protected T getIBean() {
		return (T) bean;
	}
	
	public List<B> findAll() {
		try {
			return bean.findAll();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public B find(long id) {
		try {
			return bean.find(id);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public B save(final B obj) {
		try {
			if (((IBaseEntity) obj).getId() > 0) {
				return bean.edit(obj);
			} else {
				((IBaseEntity) obj).setId(0L);
				return bean.persist(obj);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public boolean delete(long id) {
		try {
			bean.remove(id);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public int count() {
		return bean.count();
	}
}
