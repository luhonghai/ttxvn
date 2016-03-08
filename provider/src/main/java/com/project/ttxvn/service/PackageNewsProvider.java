package com.project.ttxvn.service;

import com.project.ttxvn.constant.Common;
import com.project.ttxvn.dao.INewsDAO;
import com.project.ttxvn.dao.IPackageNewsDAO;
import com.project.ttxvn.dao.daoImpl.NewsDAOImpl;
import com.project.ttxvn.dao.daoImpl.PackageNewsDAOImpl;
import com.project.ttxvn.model.News;
import com.project.ttxvn.model.PackageNews;
import com.project.ttxvn.model.User;
import com.project.ttxvn.service.soap.SoapFactory;
import iptc.newsml.g2.builder.ContentMetaBuilder;
import iptc.newsml.g2.builder.ItemMetaBuilder;
import iptc.newsml.g2.builder.NewsItemBuilder;
import iptc.newsml.g2.model.Name;
import iptc.newsml.g2.model.NewsItem;
import iptc.newsml.g2.model.Subject;

import javax.jws.WebService;
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
 * Created by Thinh on 07-Mar-16.
 */
@Path("PackageNews")
@WebService
public class PackageNewsProvider extends BaseService<PackageNews, IPackageNewsDAO, PackageNewsDAOImpl> implements IPackageNewsSoap{

    public PackageNewsProvider() {
        super(IPackageNewsDAO.class, PackageNewsDAOImpl.class);
    }

    public List<PackageNews> getAllNews(){
        return findAll();
    }

    @Override
    @GET
    @Path("/delete")
    @Produces("application/json")
    public boolean delete(@QueryParam("id") long id) {
        if (Common.IS_SERVICE) {
            return super.delete(id);
        } else {
            return SoapFactory.createInstance(INewsSoap.class, this.getClass().getSimpleName()).delete(id);
        }
    }

    @Override
    @POST
    @Path("/save")
    @Produces("application/json")
    public PackageNews save(PackageNews obj) {
        if (Common.IS_SERVICE) {
            if (obj.getId() > 0) {
                PackageNews tmp = getBean().find(obj.getId());
                //tmp.setContent(obj.getContent());
                tmp.setCatId(obj.getCatId());
                tmp.setDateTime(new Date(System.currentTimeMillis()));
                tmp.setTitle(obj.getTitle());
                tmp.setNewsid(obj.getNewsid());
                tmp.setImageid(obj.getImageid());
                tmp.setEditor(obj.getEditor());
                //tmp.set(obj.getAuthor());
                tmp.setStatus(News.Status.PREVIEW.getId());
                return getBean().edit(tmp);
            } else {
                obj.setDateTime(new Date(System.currentTimeMillis()));
                return super.save(obj);
            }
        } else {
            return SoapFactory.createInstance(IPackageNewsSoap.class, this.getClass().getSimpleName()).save(obj);
        }
    }

    @Override
    @GET
    @Path("/find")
    @Produces("application/json")
    public PackageNews find(@QueryParam("id") long id) {
        if (Common.IS_SERVICE) {
            return super.find(id);
        } else {
            return SoapFactory.createInstance(IPackageNewsSoap.class, this.getClass().getSimpleName()).find(id);
        }
    }


    @GET
    @Path("/list")
    @Produces("application/json")
    public List<PackageNews> findAll(@QueryParam("role") int role) {
        if (Common.IS_SERVICE) {
            CategoryService categoryService = new CategoryService();
            List<PackageNews> list = super.findAll();
            if (list != null && !list.isEmpty()) {
                for (final PackageNews item : list) {
                    item.setCategory(categoryService.find(item.getCatId()));
                }
            }
            return list;
        } else {
            return SoapFactory.createInstance(IPackageNewsSoap.class, this.getClass().getSimpleName()).findAll(role);
        }
    }

    @GET
    @Path("/findByCategory")
    @Produces("application/json")
    public List<PackageNews> findByCategory(@QueryParam("id") long id, @QueryParam("role") int role) {
        if (Common.IS_SERVICE) {
            if (id > 0) {
                CategoryService categoryService = new CategoryService();
                List<PackageNews> list = getIBean().findByCategoryId(id);
                if (list != null && !list.isEmpty()) {
                    for (final PackageNews item : list) {
                        item.setCategory(categoryService.find(item.getCatId()));
                    }
                }
                return list;
            } else {
                return findAll();
            }
        } else {
            return SoapFactory.createInstance(IPackageNewsSoap.class, this.getClass().getSimpleName()).findByCategory(id, role);
        }
    }

    public List<PackageNews> findByCategoryAndStatus(long id, int status) {
        if (Common.IS_SERVICE) {
            CategoryService categoryService = new CategoryService();
            List<PackageNews> list = getIBean().findByCategoryId(id, status);
            if (list != null && !list.isEmpty()) {
                for (final PackageNews item : list) {
                    item.setCategory(categoryService.find(item.getCatId()));
                }
            }
            return list;
        } else {
            return SoapFactory.createInstance(IPackageNewsSoap.class, this.getClass().getSimpleName()).findByCategoryAndStatus(id, status);
        }
    }

    @GET
    @Path("/update/status")
    @Produces("application/json")
    public boolean updateNewsStatus(@QueryParam("nid") long nid, @QueryParam("status") int status) {
        if (Common.IS_SERVICE) {
            PackageNews news = find(nid);
            news.setStatus(status);
            return super.save(news) != null;
        } else {
            return SoapFactory.createInstance(IPackageNewsSoap.class, this.getClass().getSimpleName()).updateNewsStatus(nid, status);
        }
    }

    @GET
    @Path("/newsmlg2/list")
    @Produces("application/xml")
    public List<NewsItem> findNewsmlG2() {
        if (Common.IS_SERVICE) {
            List<PackageNews> newsList = findAll();
            List<NewsItem> newsItemList = new ArrayList<>();
            if (newsList != null && newsList.size() > 0) {
                for (News news : newsList) {
                    newsItemList.add(convertNewsToNewsMLG2(news));
                }
            }
            return newsItemList;
        } else {
            return SoapFactory.createInstance(IPackageNewsSoap.class, this.getClass().getSimpleName()).findNewsmlG2();
        }
    }

    @GET
    @Path("/newsmlg2/category/{id}")
    @Produces("application/xml")
    public List<NewsItem> findNewsmlG2ByCategoryId(@PathParam("id") long id) {
        if (Common.IS_SERVICE) {
            List<PackageNews> newsList = findByCategory(id, User.Role.ADMINISTRATOR.getId());
            List<NewsItem> newsItemList = new ArrayList<>();
            if (newsList != null && newsList.size() > 0) {
                for (News news : newsList) {
                    newsItemList.add(convertNewsToNewsMLG2(news));
                }
            }
            return newsItemList;
        } else {
            return SoapFactory.createInstance(IPackageNewsSoap.class, this.getClass().getSimpleName()).findNewsmlG2ByCategoryId(id);
        }
    }

    @GET
    @Path("/newsmlg2/{id}")
    @Produces("application/xml")
    public NewsItem findNewsmlG2ById(@PathParam("id") long id) {
        if (Common.IS_SERVICE) {
            return convertNewsToNewsMLG2(find(id));
        } else {
            return SoapFactory.createInstance(IPackageNewsSoap.class, this.getClass().getSimpleName()).findNewsmlG2ById(id);
        }
    }

    private NewsItem convertNewsToNewsMLG2(PackageNews news) {
        //TODO create newsItem from news object
        NewsItemBuilder newsItem = newsItem();
        newsItem.guid("vnanet.org.vn/ttxvn/multimedia"+news.getId()).version(1);
        newsItem.standardversion("2.15").standard("NewsML-G2").conformance("Power");
        newsItem.addCatalogRef(catalogRef().href("http://www.iptc.org/std/catalog/catalog.IPTC-G2-Standards_25.xml"));
        newsItem.addCatalogRef(catalogRef().href("http://www.example.com/newsml-g2/catalog.enews_2.xml"));
        newsItem.lang("en");
        ItemMetaBuilder itemMeta = itemMeta();
        itemMeta.itemClass(qcode().qcode("ninat:composite"));
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
        if (Common.IS_SERVICE) {
            return getIBean().countByCategoryId(id);
        } else {
            return SoapFactory.createInstance(IPackageNewsSoap.class, this.getClass().getSimpleName()).countByCategory(id);
        }
    }
}
