package com.project.ttxvn.dao;

import com.project.ttxvn.model.News;

import javax.ejb.Remote;
import java.util.List;

/**
 * Created by longdnguyen on 2/21/16.
 */
@Remote
public interface INewsDAO extends IBaseDAO<News>{

    List<News> findByCategoryId(long id);

    int countByCategoryId(long id);

    News findByUUID(String uuid);
}
