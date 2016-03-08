package com.project.ttxvn.service.soap;

import com.project.ttxvn.model.ImageNews;
import iptc.newsml.g2.model.NewsItem;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * Created by Thinh on 06-Mar-16.
 */

@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface INewsImageProvider {
    boolean sendNewsRequest(String email, String message);

    List<NewsItem> findNewsItem();

    List<NewsItem> findNewsItemByCategory(long categoryId);

    List<ImageNews> findNews();

    List<ImageNews> findNewsByCategory(long  categoryId);
}
