package com.project.ttxvn.service.soap;

import com.project.ttxvn.model.ImageNews;
import com.project.ttxvn.model.NewsRequest;
import com.project.ttxvn.service.ImageNewsService;
import com.project.ttxvn.service.NewsRequestService;
import iptc.newsml.g2.model.NewsItem;

import javax.jws.WebService;
import java.util.List;

/**
 * Created by Thinh on 06-Mar-16.
 */
@WebService()
public class NewsImageProvider implements INewsImageProvider{
    @Override
    public boolean sendNewsRequest(String email, String message) {
        NewsRequestService newsRequestService = new NewsRequestService();
        NewsRequest newsRequest = new NewsRequest();
        newsRequest.setEmail(email);
        newsRequest.setMessage(message);
        return newsRequestService.save(newsRequest) != null;
    }

    @Override
    public List<NewsItem> findNewsItem() {
        ImageNewsService newsService = new ImageNewsService();
        return newsService.findNewsmlG2();
    }

    @Override
    public List<NewsItem> findNewsItemByCategory(long categoryId) {
        ImageNewsService newsService = new ImageNewsService();
        return newsService.findNewsmlG2ByCategoryId(categoryId);
    }

    @Override
    public List<ImageNews> findNews() {
        ImageNewsService newsService = new ImageNewsService();
        return newsService.findByCategoryAndStatus(0, ImageNews.Status.APPROVED.getId());
    }

    @Override
    public List<ImageNews> findNewsByCategory(long categoryId) {
        ImageNewsService newsService = new ImageNewsService();
        return newsService.findByCategoryAndStatus(categoryId, ImageNews.Status.APPROVED.getId());
    }
}
