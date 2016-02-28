package com.project.ttxvn.service.soap;

import com.project.ttxvn.model.News;
import iptc.newsml.g2.model.NewsItem;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import java.util.List;


@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface ISoapProvider {

    boolean sendNewsRequest(String email, String message);

    List<NewsItem> findNewsItem();

    List<NewsItem> findNewsItemByCategory(long categoryId);

    List<News> findNews();

    List<News> findNewsByCategory(long  categoryId);
}
