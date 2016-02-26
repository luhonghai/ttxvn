package com.project.ttxvn.utils;

import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.NamingException;

public class EJBConnector<T,K> {

	private static Context context;
	private Class<T> remoteClass;
	private Class<K> statelessClass;
	
	public EJBConnector(Class<T> rc, Class<K> sc) {
		this.remoteClass = rc;
		this.statelessClass = sc;
	}
	
	private Context getContext() throws NamingException {
		if (context == null) {
			context = JNDILookUpClass.getInitialContext();
		}
		return context;
	}
	
	@SuppressWarnings("unchecked")
	public T newInstance() {
		try {
			Stateless stateless = statelessClass.getAnnotation(Stateless.class);
			String name = JNDILookUpClass.lookUpName(remoteClass.getName(), stateless.name());
			return (T) getContext().lookup(name);
		} catch (NamingException e) {
			e.printStackTrace();
			return null;
		}
	}
}
