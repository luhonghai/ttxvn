package com.project.ttxvn.service;

import com.project.ttxvn.dao.INewsImageDAO;
import com.project.ttxvn.dao.daoImpl.ImageNewsDAOImpl;
import com.project.ttxvn.model.ImageNews;
import com.project.ttxvn.model.User;
import iptc.newsml.g2.builder.ContentMetaBuilder;
import iptc.newsml.g2.builder.ItemMetaBuilder;
import iptc.newsml.g2.builder.NewsItemBuilder;
import iptc.newsml.g2.model.Name;
import iptc.newsml.g2.model.NewsItem;
import iptc.newsml.g2.model.Subject;

import javax.ws.rs.*;
import java.util.*;

import static iptc.common.builder.CalendarBuilder.calendar;
import static iptc.newsml.g2.builder.AuthorBuilder.creator;
import static iptc.newsml.g2.builder.CatalogRefBuilder.catalogRef;
import static iptc.newsml.g2.builder.ContentMetaBuilder.contentMetadata;
import static iptc.newsml.g2.builder.HeadlineBuilder.headline;
import static iptc.newsml.g2.builder.ItemMetaBuilder.itemMeta;
import static iptc.newsml.g2.builder.NameBuilder.name;
import static iptc.newsml.g2.builder.NewsItemBuilder.newsItem;
import static iptc.newsml.g2.builder.QcodeBuilder.qcode;
import static iptc.newsml.g2.builder.RelationBuilder.broader;
import static iptc.newsml.g2.builder.SubjectBuilder.subject;

/**
 * Created by Thinh on 05-Mar-16.
 */
@Path("imageNews")
public class ImageNewsService extends BaseService<ImageNews, INewsImageDAO, ImageNewsDAOImpl> {
    public ImageNewsService() {
    }

    public ImageNewsService(Class<INewsImageDAO> remoteClass, Class<ImageNewsDAOImpl> statelessClass) {
        super(remoteClass, statelessClass);
    }

    public List<ImageNews> getAllImageNews(){
        return findAll();
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
    public ImageNews save(ImageNews obj) {
        //if (Common.IS_SERVICE) {
            if (obj.getId() > 0) {
                ImageNews tmp = getBean().find(obj.getId());
                tmp.setCaption(obj.getCaption());
                tmp.setCatId(obj.getCatId());
                tmp.setDateTime(new Date(System.currentTimeMillis()));
                tmp.setTitle(obj.getTitle());
                tmp.setImageLink(obj.getImageLink());
                tmp.setLocation(obj.getLocation());
                tmp.setInfoSource(obj.getInfoSource());
                tmp.setAuthor(obj.getAuthor());
                tmp.setStatus(ImageNews.Status.PREVIEW.getId());
                return getBean().edit(tmp);
            } else {
                obj.setDateTime(new Date(System.currentTimeMillis()));
                return super.save(obj);
            }
//        } else {
//            return null;
//        }
    }

    @Override
    @GET
    @Path("/find")
    @Produces("application/json")
    public ImageNews find(@QueryParam("id") long id) {
        return super.find(id);
    }


    @GET
    @Path("/list")
    @Produces("application/json")
    public List<ImageNews> findAll(@QueryParam("role") int role) {
        CategoryService categoryService = new CategoryService();
        List<ImageNews> list = super.findAll();
        if (list != null && !list.isEmpty()) {
            for (final ImageNews item : list) {
                item.setCategory(categoryService.find(item.getCatId()));
            }
        }
        return list;
    }

    @GET
    @Path("/findByCategory")
    @Produces("application/json")
    public List<ImageNews> findByCategory(@QueryParam("id") long id, @QueryParam("role") int role) {
        if (id > 0) {
            CategoryService categoryService = new CategoryService();
            List<ImageNews> list = getIBean().findByCategoryId(id);
            if (list != null && !list.isEmpty()) {
                for (final ImageNews item : list) {
                    item.setCategory(categoryService.find(item.getCatId()));
                }
            }
            return list;
        } else {
            return findAll();
        }
    }

    public List<ImageNews> findByCategoryAndStatus(long id, int status) {
        CategoryService categoryService = new CategoryService();
        List<ImageNews> list = getIBean().findByCategoryId(id, status);
        if (list != null && !list.isEmpty()) {
            for (final ImageNews item : list) {
                item.setCategory(categoryService.find(item.getCatId()));
            }
        }
        return list;
    }

    @GET
    @Path("/update/status")
    @Produces("application/json")
    public boolean updateImageNewsStatus(@QueryParam("nid") long nid, @QueryParam("status") int status) {
        ImageNews news = find(nid);
        news.setStatus(status);
        return super.save(news) != null;
    }

    @GET
    @Path("/inewsmlg2/category/{id}")
    @Produces("application/xml")
    public List<NewsItem> findNewsmlG2ByCategoryId(@PathParam("id") long id) {
        List<ImageNews> newsList = findByCategory(id, User.Role.ADMINISTRATOR.getId());
        List<NewsItem> newsItemList = new ArrayList<>();
        if (newsList != null && newsList.size() > 0) {
            for (ImageNews news : newsList) {
                newsItemList.add(convertNewsToNewsMLG2(news));
            }
        }
        return newsItemList;
    }

    @GET
    @Path("/inewsmlg2/list")
    @Produces("application/xml")
    public List<NewsItem> findNewsmlG2() {
        List<ImageNews> newsList = findAll();
        List<NewsItem> newsItemList = new ArrayList<>();
        if (newsList != null && newsList.size() > 0) {
            for (ImageNews news : newsList) {
                newsItemList.add(convertNewsToNewsMLG2(news));
            }
        }
        return newsItemList;
    }

    @GET
    @Path("/inewsmlg2/{id}")
    @Produces("application/xml")
    public NewsItem findNewsmlG2ById(@PathParam("id") long id) {
        return convertNewsToNewsMLG2(find(id));
    }

    private NewsItem convertNewsToNewsMLG2(ImageNews news) {
        //TODO create newsItem from news object
        NewsItemBuilder newsItem = newsItem();
        newsItem.guid("urn:newsml:acmenews.com:20141121:US-FINANCE-FED").version(1);
        newsItem.standardversion("2.19").standard("NewsML-G2").conformance("Power");
        newsItem.addCatalogRef(catalogRef().href("http://www.iptc.org/std/catalog/catalog.IPTC-G2-Standards_25.xml"));
        newsItem.addCatalogRef(catalogRef().href("http://www.example.com/newsml-g2/catalog.enews_2.xml"));
        newsItem.lang("en");
        ItemMetaBuilder itemMeta = itemMeta();
        itemMeta.itemClass(qcode().qcode("ninat:text"));
        itemMeta.versionCreated(calendar().rawDate(news.getDateTime()));
        itemMeta.contentModified(calendar().rawDate(news.getDateTime()));

        itemMeta.embargoed(calendar().rawDate(news.getDateTime()));
        itemMeta.pubStatus(qcode().pubStatusUsable());
        //itemMeta.service(qcode().qcode("srv:finance"));

        newsItem.itemMeta(itemMeta);

        ContentMetaBuilder contentMetadata = contentMetadata();
        contentMetadata.contentCreated(calendar().rawDate(news.getDateTime()));
        contentMetadata.contentModified(calendar().rawDate(news.getDateTime()));
        if (news.getLocation() != null && news.getLocation().length() > 0) {
            Subject subject = new Subject();
            Set<Name> setName = new HashSet<>();
            Name name = new Name();
            name.setValue(news.getLocation());
            setName.add(name);
            subject.setName(setName);
            contentMetadata.located(subject);
        }
        if (news.getInfoSource() != null && news.getInfoSource().length() > 0) {
            Subject subject = new Subject();
            Set<Name> setName = new HashSet<>();
            Name name = new Name();
            name.setValue(news.getInfoSource());
            setName.add(name);
            subject.setName(setName);
            contentMetadata.infoSource(subject);
        }
        contentMetadata.urgency(2);
        contentMetadata.creator(creator().name(news.getAuthor()).uri("http://www.ttxvn.com/staff/" + news.getAuthor()));
        //contentMetadata.contributor(contributor().name(news.getAuthor()).uri("http://www.ttxvn.com/staff/" + news.getAuthor()));
        // <infoSource uri="http://www.example.com" />
        contentMetadata.addSubject(subject().type("cpnat:abstract").qcode("medtop:04000000")
                .addName(name().lang("vi").role("nrol:full").value(news.getTitle())).addBroader(broader().qcode("medtop:04000000")));

        contentMetadata.headline(headline().value(news.getTitle()));

        newsItem.contentMeta(contentMetadata);

        NewsItem.ContentSet contentSet = new NewsItem.ContentSet();
        final NewsItem.ContentSetBody body = contentSet.getInlineXML().getNitf().getBody();
        body.setContent(news.getCaption());
        body.getHead().getHeadline().setHl1(news.getTitle());
        newsItem.contentSet(contentSet);
        try {
            return newsItem.build();
        } catch (Exception e) {
            return new NewsItem();
        }
    }

    public int countByCategory(long id) {
        return getIBean().countByCategoryId(id);
    }
}
