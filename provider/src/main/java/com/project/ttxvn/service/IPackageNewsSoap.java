package com.project.ttxvn.service;

import com.project.ttxvn.model.News;
import com.project.ttxvn.model.PackageNews;
import iptc.newsml.g2.model.NewsItem;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * Created by Thinh on 07-Mar-16.
 */
@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface IPackageNewsSoap {
    boolean delete(long id);

    PackageNews save(PackageNews obj);

    PackageNews find(long id);

    List<PackageNews> findAll(int role);

    List<PackageNews> findByCategory(long id, int role);

    List<PackageNews> findByCategoryAndStatus(long id, int status);

    boolean updateNewsStatus(long nid, int status);

    List<NewsItem> findNewsmlG2();

    List<NewsItem> findNewsmlG2ByCategoryId(long id);

    NewsItem findNewsmlG2ById(long id);

    int countByCategory(long id);
}
