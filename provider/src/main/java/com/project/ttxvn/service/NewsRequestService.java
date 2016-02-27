package com.project.ttxvn.service;

import com.project.ttxvn.dao.INewsRequestDAO;
import com.project.ttxvn.dao.daoImpl.NewsRequestDAOImpl;
import com.project.ttxvn.model.NewsRequest;
import iptc.common.xml.NewsMLG2;
import iptc.newsml.g2.model.NewsItem;
import org.apache.commons.io.FileUtils;

import javax.ws.rs.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.Date;
import java.util.List;
import java.util.UUID;


@Path("news_request")
public class NewsRequestService extends BaseService<NewsRequest, INewsRequestDAO, NewsRequestDAOImpl> {

    public NewsRequestService() {
        super(INewsRequestDAO.class, NewsRequestDAOImpl.class);
    }

    @Override
    @GET
    @Path("/delete")
    @Produces("application/json")
    public boolean delete(@QueryParam("id") long id) {
        return super.delete(id);
    }

    @Override
    @POST
    @Path("/save")
    @Produces("application/json")
    public NewsRequest save(NewsRequest obj) {
        if (obj.getId() <= 0) {
            obj.setRequestDate(new Date(System.currentTimeMillis()));
        }
        return super.save(obj);
    }

    @Override
    @GET
    @Path("/find")
    @Produces("application/json")
    public NewsRequest find(@QueryParam("id") long id) {
        return super.find(id);
    }


    @Override
    @GET
    @Path("/list")
    @Produces("application/json")
    public List<NewsRequest> findAll() {
        return super.findAll();
    }


    @POST
    @Path("/send")
    public boolean sendResponseEmail(@FormParam("rid") long requestId,
                                     @FormParam("pid") long postId,
                                     @FormParam("subject") String subject,
                                     @FormParam("message") String message) {

        logger.info("Send response email to request id " + requestId + ". Post id: " + postId
                    + ". Subject: " + subject + ". Message: " + message);
        NewsService newsService = new NewsService();
        NewsRequest newsRequest = find(requestId);
        NewsItem news = newsService.findNewsmlG2ById(postId);
        MailService mailService = new MailService();
        try {
            File tmpFolder = new File(FileUtils.getTempDirectory(), UUID.randomUUID().toString());
            tmpFolder.mkdirs();
            File tmpFile = new File(tmpFolder, "newsml-g2.xml");
            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(tmpFile), Charset.forName("UTF-8").newEncoder() );
            logger.info("Write file to " + tmpFile);
            NewsMLG2.aProcessor().toXml(news, writer);
            mailService.setMessageListener(new MailService.MessageListener() {
                @Override
                public void onMessage(String message) {
                    logger.info(message);
                }

                @Override
                public void onError(String error) {
                    logger.severe(error);
                }
            });
            mailService.sendEmail(new String[] {newsRequest.getEmail()}, subject, message, new String[] {tmpFile.getAbsolutePath()});
            FileUtils.forceDelete(tmpFolder);
            newsRequest.setStatusEnum(NewsRequest.Status.DONE);
            save(newsRequest);
            return true;
        } catch (Exception e) {

        }
        return false;
    }
}
