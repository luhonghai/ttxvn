package com.project.ttxvn.model;

import java.io.Serializable;

public interface IBaseEntity extends Serializable {
	public void setId(long id);
	
	public long getId();
}
