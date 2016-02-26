package com.project.ttxvn.service.soap;

import iptc.newsml.g2.model.NewsItem;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * Created by cmg on 26/02/2016.
 */

@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface ISoapProvider {

    boolean sendNewsRequest(String email, String message);

    List<NewsItem> findNewsItem();

    List<NewsItem> findNewsItemByCategory(long categoryId);
}
