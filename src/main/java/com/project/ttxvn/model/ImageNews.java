package com.project.ttxvn.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;


@Entity
public class ImageNews implements IBaseEntity {

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
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

    @Column(name = "date_create")
    private Date dateTime;

    @Column(name = "caption")
    private String caption;

    @Column(name = "imageLink")
    private String imageLink;

    @Column(name = "author")
    private String author;

    @Column(name = "infoSource")
    private String infoSource;

    @Column(name = "location")
    private String location;

    @Column(name = "uuid")
    private String uuid;

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

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public String getInfoSource() {
        return infoSource;
    }

    public void setInfoSource(String infoSource) {
        this.infoSource = infoSource;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
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
        if (!(o instanceof ImageNews)) return false;

        ImageNews imageNews = (ImageNews) o;

        if (getId() != imageNews.getId()) return false;
        if (getCatId() != imageNews.getCatId()) return false;
        if (getStatus() != imageNews.getStatus()) return false;
        if (getTitle() != null ? !getTitle().equals(imageNews.getTitle()) : imageNews.getTitle() != null) return false;
        if (getDateTime() != null ? !getDateTime().equals(imageNews.getDateTime()) : imageNews.getDateTime() != null)
            return false;
        if (getCaption() != null ? !getCaption().equals(imageNews.getCaption()) : imageNews.getCaption() != null)
            return false;
        if (getImageLink() != null ? !getImageLink().equals(imageNews.getImageLink()) : imageNews.getImageLink() != null)
            return false;
        if (getAuthor() != null ? !getAuthor().equals(imageNews.getAuthor()) : imageNews.getAuthor() != null)
            return false;
        if (getInfoSource() != null ? !getInfoSource().equals(imageNews.getInfoSource()) : imageNews.getInfoSource() != null)
            return false;
        if (getLocation() != null ? !getLocation().equals(imageNews.getLocation()) : imageNews.getLocation() != null)
            return false;
        return !(getCategory() != null ? !getCategory().equals(imageNews.getCategory()) : imageNews.getCategory() != null);

    }

    @Override
    public int hashCode() {
        int result = (int) (getId() ^ (getId() >>> 32));
        result = 31 * result + (getTitle() != null ? getTitle().hashCode() : 0);
        result = 31 * result + (getDateTime() != null ? getDateTime().hashCode() : 0);
        result = 31 * result + (getCaption() != null ? getCaption().hashCode() : 0);
        result = 31 * result + (getImageLink() != null ? getImageLink().hashCode() : 0);
        result = 31 * result + (getAuthor() != null ? getAuthor().hashCode() : 0);
        result = 31 * result + (getInfoSource() != null ? getInfoSource().hashCode() : 0);
        result = 31 * result + (getLocation() != null ? getLocation().hashCode() : 0);
        result = 31 * result + (int) (getCatId() ^ (getCatId() >>> 32));
        result = 31 * result + getStatus();
        result = 31 * result + (getCategory() != null ? getCategory().hashCode() : 0);
        return result;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
