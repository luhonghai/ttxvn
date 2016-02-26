package com.project.ttxvn.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by cmg on 26/02/2016.
 */
@Entity(name = "news_request")
public class NewsRequest implements IBaseEntity {

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public enum Status {
        PENDING(0, "Pending"),
        DONE(1, "Done")
        ;
        int id;
        String name;
        Status(int id, String name) {
            this.id = id;
            this.name = name;
        }

        public static Status fromId(int id) {
            for (Status status : values()) {
                if (status.id == id) return status;
            }
            return PENDING;
        }

        @Override
        public String toString() {
            return name;
        }

        public int getId() {
            return id;
        }
    }

    @Id
    @Column(name = "id")
    private long id;

    @Column
    private String email;

    @Column
    private String message;

    @Column
    private int status;

    @Column(name = "request_date")
    private Date requestDate;

    @Override
    public void setId(long id) {
        this.id = id;
    }

    @Override
    public long getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Status getStatusEnum() {
        return Status.fromId(status);
    }

    public void setStatusEnum(Status status) {
        this.status = status.id;
    }
}
