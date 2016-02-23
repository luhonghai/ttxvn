package com.project.ttxvn.service;

import com.project.ttxvn.dao.INewsDAO;
import com.project.ttxvn.dao.daoImpl.NewsDAOImpl;
import com.project.ttxvn.model.News;
import iptc.newsml.g2.builder.ContentMetaBuilder;
import iptc.newsml.g2.builder.ItemMetaBuilder;
import iptc.newsml.g2.builder.NewsItemBuilder;
import iptc.newsml.g2.model.NewsItem;

import javax.ws.rs.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static iptc.common.builder.CalendarBuilder.calendar;
import static iptc.newsml.g2.builder.AuthorBuilder.contributor;
import static iptc.newsml.g2.builder.AuthorBuilder.creator;
import static iptc.newsml.g2.builder.CatalogRefBuilder.catalogRef;
import static iptc.newsml.g2.builder.ContentMetaBuilder.contentMetadata;
import static iptc.newsml.g2.builder.ItemMetaBuilder.itemMeta;
import static iptc.newsml.g2.builder.NameBuilder.name;
import static iptc.newsml.g2.builder.NewsItemBuilder.newsItem;
import static iptc.newsml.g2.builder.QcodeBuilder.qcode;
import static iptc.newsml.g2.builder.RelationBuilder.broader;
import static iptc.newsml.g2.builder.SluglineBuilder.slugline;
import static iptc.newsml.g2.builder.SubjectBuilder.subject;

/**
 * Created by longdnguyen on 2/21/16.
 */
@Path("news")
public class NewsService extends BaseService<News, INewsDAO, NewsDAOImpl> {

    public NewsService() {
        super(INewsDAO.class, NewsDAOImpl.class);
    }

    public List<News> getAllNews(){
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
    public News save(News obj) {
        if (obj.getId() > 0) {
            News tmp = getBean().find(obj.getId());
            tmp.setContent(obj.getContent());
            tmp.setCatId(obj.getCatId());
            tmp.setDateTime(new Date(System.currentTimeMillis()));
            tmp.setTitle(obj.getTitle());
            tmp.setImage(obj.getImage());
            return getBean().edit(tmp);
        } else {
            obj.setDateTime(new Date(System.currentTimeMillis()));
            return super.save(obj);
        }
    }

    @Override
    @GET
    @Path("/find")
    @Produces("application/json")
    public News find(@QueryParam("id") long id) {
        return super.find(id);
    }


    @Override
    @GET
    @Path("/list")
    @Produces("application/json")
    public List<News> findAll() {
        CategoryService categoryService = new CategoryService();
        List<News> list =  super.findAll();
        if (list != null && !list.isEmpty()) {
            for (final News item : list) {
                item.setCategory(categoryService.find(item.getCatId()));
            }
        }
        return list;
    }

    @GET
    @Path("/findByCategory")
    @Produces("application/json")
    public List<News> findByCategory(@QueryParam("id") long id) {
        if (id > 0) {
            CategoryService categoryService = new CategoryService();
            List<News> list = getIBean().findByCategoryId(id);
            if (list != null && !list.isEmpty()) {
                for (final News item : list) {
                    item.setCategory(categoryService.find(item.getCatId()));
                }
            }
            return list;
        } else {
            return findAll();
        }
    }

    @GET
    @Path("/newsmlg2/category/{id}")
    @Produces("application/xml")
    public List<NewsItem> findNewsmlG2ByCategoryId(@PathParam("id") long id) {
        List<News> newsList = findByCategory(id);
        List<NewsItem> newsItemList = new ArrayList<>();
        if (newsList != null && newsList.size() > 0) {
            for (News news : newsList) {
                newsItemList.add(convertNewsToNewsMLG2(news));
            }
        }
        return newsItemList;
    }

    @GET
    @Path("/newsmlg2/{id}")
    @Produces("application/xml")
    public NewsItem findNewsmlG2ById(@PathParam("id") long id) {
        return convertNewsToNewsMLG2(find(id));
    }

    private NewsItem convertNewsToNewsMLG2(News news) {
        //TODO create newsItem from news object
        NewsItemBuilder newsItem = newsItem();
        newsItem.guid("urn:newsml:acmenews.com:20141121:US-FINANCE-FED").version(1);
        newsItem.standardversion("2.19").standard("NewsML-G2").conformance("Power");
        newsItem.addCatalogRef(catalogRef().href("http://www.iptc.org/std/catalog/catalog.IPTC-G2-Standards_25.xml"));
        newsItem.addCatalogRef(catalogRef().href("http://www.example.com/newsml-g2/catalog.enews_2.xml"));
        newsItem.lang("en");
        ItemMetaBuilder itemMeta = itemMeta();
        itemMeta.itemClass(qcode().qcode("ninat:text"));
        itemMeta.versionCreated(calendar().date("2015-01-14"));
        itemMeta.contentModified(calendar().date("2015-01-15"));

        itemMeta.embargoed(calendar().date("2015-01-15"));
        itemMeta.pubStatus(qcode().pubStatusUsable());
        itemMeta.service(qcode().qcode("srv:finance"));
        // TODO add support edNote
        // TODO add support signal
        // TODO add support link
        newsItem.itemMeta(itemMeta);

        ContentMetaBuilder contentMetadata = contentMetadata();
        contentMetadata.contentCreated(calendar().date("2015-01-15"));
        contentMetadata.contentModified(calendar().date("2015-01-15"));
        contentMetadata.urgency(2);
        contentMetadata.creator(creator().uri("http://www.example.com/staff/mjameson"));
        contentMetadata.contributor(contributor().uri("http://www.example.com/staff/mjameson"));
        // <infoSource uri="http://www.example.com" />
        contentMetadata.addSubject(subject().type("cpnat:abstract").qcode("medtop:04000000")
                .addName(name().lang("de").role("nrol:full").value("Arbeitsmarkt")).addBroader(broader().qcode("medtop:04000000")));

        // TODO add support <genre qcode="genre:interview">
        contentMetadata.slugline(slugline().value("US-Finance"));

        // FIXME blocked by: @XmlValue is not allowed on a class that derives
        // another class. See Headline.java
        // contentMetadata.headline(headline().value("Must be well"));

        newsItem.contentMeta(contentMetadata);

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
