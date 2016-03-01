package com.project.ttxvn.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * Created by longdnguyen on 2/21/16.
 */
@Entity
public class News implements IBaseEntity {


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

    @Column
    private String uuid;

    @Column(name = "title")
    private String title;

    @Column(name = "date_time")
    private Date dateTime;

    @Column(name = "content")
    private String content;

    @Column(name = "description")
    private String description;

    @Column(name = "image")
    private String image;

    @Column(name = "author")
    private String author;

    @Column(name = "source")
    private String source;

    @Column(name = "location")
    private String location;

    @Column(name = "cat_id")
    private long catId;

    @Column()
    private int status = 0;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public long getCatId() {
        return catId;
    }

    public void setCatId(long catId) {
        this.catId = catId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        News news = (News) o;

        if (id != news.id) return false;
        if (catId != news.catId) return false;
        if (title != null ? !title.equals(news.title) : news.title != null) return false;
        if (dateTime != null ? !dateTime.equals(news.dateTime) : news.dateTime != null) return false;
        if (content != null ? !content.equals(news.content) : news.content != null) return false;
        if (description != null ? !description.equals(news.description) : news.description != null) return false;
        if (image != null ? !image.equals(news.image) : news.image != null) return false;
        if (author != null ? !author.equals(news.author) : news.author != null) return false;
        if (source != null ? !source.equals(news.source) : news.source != null) return false;
        if (location != null ? !location.equals(news.location) : news.location != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        long result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (dateTime != null ? dateTime.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (image != null ? image.hashCode() : 0);
        result = 31 * result + (author != null ? author.hashCode() : 0);
        result = 31 * result + (source != null ? source.hashCode() : 0);
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + catId;
        return (int) result;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setStatusEnum(Status status) {
        this.status = status.id;
    }

    public Status getStatusEnum() {
        return Status.fromId(status);
    }


    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
