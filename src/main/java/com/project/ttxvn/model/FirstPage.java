package com.project.ttxvn.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by Thinh on 28-Feb-16.
 */
@Entity
public class FirstPage implements IBaseEntity {

    @Id
    @Column
    private long id;

    @Column
    private long newsid;

    @Column
    private java.util.Date updateTime;

    @java.lang.Override
    public void setId(long id) {
        this.id = id;
    }

    @java.lang.Override
    public long getId() {
        return this.id;
    }

    public long getNewsid() {
        return newsid;
    }

    public void setNewsid(long newsid) {
        this.newsid = newsid;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
