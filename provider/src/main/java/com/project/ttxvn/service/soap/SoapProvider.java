package com.project.ttxvn.service.soap;

import com.project.ttxvn.model.News;
import com.project.ttxvn.model.NewsRequest;
import com.project.ttxvn.service.NewsRequestService;
import com.project.ttxvn.service.NewsService;
import iptc.newsml.g2.model.NewsItem;

import javax.jws.WebService;
import java.util.List;


@WebService()
public class SoapProvider implements ISoapProvider {

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
        NewsService newsService = new NewsService();
        return newsService.findNewsmlG2();
    }

    @Override
    public List<NewsItem> findNewsItemByCategory(long categoryId) {
        NewsService newsService = new NewsService();
        return newsService.findNewsmlG2ByCategoryId(categoryId);
    }

    @Override
    public List<News> findNews() {
        NewsService newsService = new NewsService();
        return newsService.findByCategoryAndStatus(0, News.Status.APPROVED.getId());
    }

    @Override
    public List<News> findNewsByCategory(long categoryId) {
        NewsService newsService = new NewsService();
        return newsService.findByCategoryAndStatus(categoryId, News.Status.APPROVED.getId());
    }
}
