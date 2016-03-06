package com.project.ttxvn.service;

import com.project.ttxvn.model.News;
import iptc.newsml.g2.model.NewsItem;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * Created by Thinh on 06-Mar-16.
 */
@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface INewsSoap {

    boolean delete(long id);

    News save(News obj);

    News find(long id);

    List<News> findAll(int role);

    List<News> findByCategory(long id, int role);

    List<News> findByCategoryAndStatus(long id, int status);

    boolean updateNewsStatus(long nid, int status);

    List<NewsItem> findNewsmlG2();

    List<NewsItem> findNewsmlG2ByCategoryId(long id);

    NewsItem findNewsmlG2ById(long id);

    int countByCategory(long id);
}
