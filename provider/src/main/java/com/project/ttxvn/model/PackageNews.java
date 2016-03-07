package com.project.ttxvn.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * Created by Thinh on 07-Mar-16.
 */
@Entity
public class PackageNews implements IBaseEntity{

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public enum Status {
        PENDING(0, "Pending"),
        PREVIEW(1, "Preview"),
        APPROVED(2, "Approved")
        ;
        int id;
        String name;
        Status(int id, String name) {
            this.id = id;
            this.name = name;
        }

        public static Status fromId(int id) {
            for (Status status: values()) {
                if (status.id == id) return status;
            }
            return PENDING;
        }

        public int getId() {
            return id;
        }

        @Override
        public String toString() {
            return name;
        }
    }

    @Id
    @Column(name = "id")
    private long id;

    @Column(name = "title")
    private String title;

    @Column(name = "date_created")
    private Date dateTime;

    @Column(name = "editor")
    private String editor;

    @Column(name = "news_id")
    private long newsid;

    @Column(name = "image_id")
    private String imageid;

    @Column(name = "cat_id")
    private long catId;

    @Column(name = "status")
    private int status;

    @Transient
    private Category category;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public String getEditor() {
        return editor;
    }

    public void setEditor(String editor) {
        this.editor = editor;
    }

    public long getNewsid() {
        return newsid;
    }

    public void setNewsid(long newsid) {
        this.newsid = newsid;
    }

    public String getImageid() {
        return imageid;
    }

    public void setImageid(String imageid) {
        this.imageid = imageid;
    }

    public long getCatId() {
        return catId;
    }

    public void setCatId(long catId) {
        this.catId = catId;
    }



    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
