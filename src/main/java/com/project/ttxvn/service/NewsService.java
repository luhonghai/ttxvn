package com.project.ttxvn.service;

import com.google.gson.GsonBuilder;
import com.project.ttxvn.dao.INewsDAO;
import com.project.ttxvn.dao.daoImpl.NewsDAOImpl;
import com.project.ttxvn.model.News;
import com.project.ttxvn.service.soap.ISoapProvider;
import com.project.ttxvn.service.soap.SoapProviderFactory;
import com.project.ttxvn.utils.MD5Helper;
import iptc.common.xml.NewsMLG2;
import iptc.newsml.g2.builder.ContentMetaBuilder;
import iptc.newsml.g2.builder.ItemMetaBuilder;
import iptc.newsml.g2.builder.NewsItemBuilder;
import iptc.newsml.g2.model.Name;
import iptc.newsml.g2.model.NewsItem;
import iptc.newsml.g2.model.Subject;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import java.io.InputStream;
import java.io.StringReader;
import java.net.MalformedURLException;
import java.net.URL;
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
            tmp.setLocation(obj.getLocation());
            tmp.setSource(obj.getSource());
            tmp.setAuthor(obj.getAuthor());
            tmp.setStatus(News.Status.PREVIEW.getId());
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
    @Path("/getTop4Newest")
    @Produces("application/json")
    public List<News> getTop4Newest() {
        CategoryService categoryService = new CategoryService();
        List<News> list = getIBean().getTop4Newest();
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
    public List<News> findByCategory(@QueryParam("id") long id, @QueryParam("pageType") int p) {
            CategoryService categoryService = new CategoryService();
            List<News> list = getIBean().findByCategoryId(id, p);
            if (list != null && !list.isEmpty()) {
                for (final News item : list) {
                    item.setCategory(categoryService.find(item.getCatId()));
                }
            }
            return list;
    }

    public List<News> findByCategory(long id) {
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
    @Path("/newsmlg2/list")
    @Produces("application/xml")
    public List<NewsItem> findNewsmlG2() {
        List<News> newsList = findAll();
        List<NewsItem> newsItemList = new ArrayList<>();
        if (newsList != null && newsList.size() > 0) {
            for (News news : newsList) {
                newsItemList.add(convertNewsToNewsMLG2(news));
            }
        }
        return newsItemList;
    }

    @GET
    @Path("/newsmlg2/category/{id}")
    @Produces("application/xml")
    public List<NewsItem> findNewsmlG2ByCategoryId(@PathParam("id") long id) {
        List<News> newsList = findByCategory(id, 1);
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

    @GET
    @Path("/send/request")
    @Produces("application/json")
    public boolean sendNewsRequest(@QueryParam("email") String email, @QueryParam("message") String message) {
        try {
            ISoapProvider soapProvider = SoapProviderFactory.createInstance();
            soapProvider.sendNewsRequest(email, message);
            return true;
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @GET
    @Path("/update/status")
    @Produces("application/json")
    public boolean updateNewsStatus(@QueryParam("nid") long nid, @QueryParam("status") int status) {
        News news = find(nid);
        news.setStatus(status);
        return super.save(news) != null;
    }

    @GET
    @Path("/import/newsmlg2")
    @Produces("application/json")
    public boolean importNewsMLG2(@QueryParam("dataUrl") String url) {
        try {
            String source = IOUtils.toString(new URL(url), "UTF-8");
            return saveNewsMLG2(source);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @POST
    @Path("/upload/newsmlg2")
    public boolean uploadNewsMLG2(@Context HttpServletRequest request) {
        try {
            ServletFileUpload upload = new ServletFileUpload();
            FileItemIterator fileIterator = upload.getItemIterator(request);
            String source = "";
            while (fileIterator.hasNext()) {
                FileItemStream item = fileIterator.next();
                if ("xml".equals(item.getFieldName())) {
                    InputStream is = null;
                    try {
                        is = item.openStream();
                        source = IOUtils.toString(is, "UTF-8");
                    } finally {
                        IOUtils.closeQuietly(is);
                    }
                }
            }
            return saveNewsMLG2(source);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean saveNewsMLG2(String source) throws Exception {
        logger.info("Source: " + source);
        NewsItem newsItem = NewsMLG2.aProcessor().toModel(NewsItem.class, new StringReader(source));
        Document doc = Jsoup.parse(source);
        //logger.info("NewsItem: " + new GsonBuilder().setPrettyPrinting().create().toJson(newsItem));
        News news = new News();
        news.setTitle(newsItem.getContentMeta().getHeadline().getValue());
        news.setAuthor(newsItem.getContentMeta().getCreator().getName());
        news.setImage("");
        try {
            news.setLocation(newsItem.getContentMeta().getLocated().getName().iterator().next().getValue());
        } catch (Exception e) {}
        try {
            news.setSource(newsItem.getContentMeta().getInfoSource().getName().iterator().next().getValue());
        } catch (Exception e) {}
        news.setDateTime(new Date(System.currentTimeMillis()));
        try {
            news.setContent(doc.getElementsByTag("body.content").first().text());
        } catch (Exception e) {
            e.printStackTrace();
            news.setContent("");
        }
        return save(news) != null;
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
        if (news.getSource() != null && news.getSource().length() > 0) {
            Subject subject = new Subject();
            Set<Name> setName = new HashSet<>();
            Name name = new Name();
            name.setValue(news.getSource());
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
        body.setContent(news.getContent());
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

    /**
     *
     */
    public void fetchNewsFromProvider() {
        try {
            CategoryService categoryService = new CategoryService();
            long catId = 0;
            try {
                catId = categoryService.findAll().get(0).getId();
            } catch (Exception e) {}
            ISoapProvider iSoapProvider = SoapProviderFactory.createInstance();
            List<News> newsItemList = iSoapProvider.findNews();
            for (News newsItem : newsItemList) {
                String title = newsItem.getTitle();
                String md5Title = MD5Helper.md5(title);
                if (getIBean().findByUUID(md5Title) == null) {
                    News news = new News();
                    news.setUuid(md5Title);
                    news.setTitle(title);
                    news.setAuthor(newsItem.getAuthor());
                    news.setImage("");
                    try {
                        news.setLocation(newsItem.getLocation());
                    } catch (Exception e) {}
                    try {
                        news.setSource(newsItem.getSource());
                    } catch (Exception e) {}
                    news.setDateTime(newsItem.getDateTime());
                    news.setContent(newsItem.getContent());
                    save(news);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
