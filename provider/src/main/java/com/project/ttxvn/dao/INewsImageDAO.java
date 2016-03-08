package com.project.ttxvn.dao;

import com.project.ttxvn.model.ImageNews;

import javax.ejb.Remote;
import java.util.List;

/**
 * Created by Thinh on 05-Mar-16.
 */
@Remote
public interface INewsImageDAO extends IBaseDAO<ImageNews> {

    List<ImageNews> findByCategoryId(long id);

    List<ImageNews> findByCategoryId(long id, int status);

    List<ImageNews> findByStatus(ImageNews.Status status);

    int countByCategoryId(long id);
}
