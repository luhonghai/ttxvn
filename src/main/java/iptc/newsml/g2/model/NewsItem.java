package iptc.newsml.g2.model;

/*
 * #%L
 * IPTC NewsML G2 Model
 * %%
 * Copyright (C) 2015 Ben Asmussen <opensource@ben-asmussen.com>
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * #L%
 */

import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * NewsItem Model Object
 * 
 * @see <a
 *      href="http://www.iptc.org/std/NewsML-G2/2.19/specification/XML-Schema-Doc-Power/NewsItem.html">NewsItem</a>
 */

@XmlRootElement(name = "newsItem")
public class NewsItem extends AnyItem
{
    private static final long serialVersionUID = 1L;
    @NotNull
    private ContentMeta contentMeta;


    private ContentSet contentSet;

    public NewsItem()
    {
    }

    @XmlElement()
    public ContentMeta getContentMeta()
    {
        return contentMeta;
    }

    public void setContentMeta(ContentMeta contentMeta)
    {
        this.contentMeta = contentMeta;
    }

    @XmlElement(nillable = true)
    public ContentSet getContentSet() {
        return contentSet;
    }

    public void setContentSet(ContentSet contentSet) {
        this.contentSet = contentSet;
    }

    @XmlType()
    public static class ContentSet {

        private InlineXML inlineXML = new InlineXML();

        @XmlElement
        public InlineXML getInlineXML() {
            return inlineXML;
        }

        public void setInlineXML(InlineXML inlineXML) {
            this.inlineXML = inlineXML;
        }
    }

    @XmlType()
    public static class InlineXML {

        private String contenttype = "application/nitf+xml";


        private Nitf nitf = new Nitf();

        @XmlAttribute
        public String getContenttype() {
            return contenttype;
        }

        public void setContenttype(String contenttype) {
            this.contenttype = contenttype;
        }

        @XmlElement
        public Nitf getNitf() {
            return nitf;
        }

        public void setNitf(Nitf nitf) {
            this.nitf = nitf;
        }
    }

    @XmlType()
    public static class Nitf {

        private String xmlns = "http://iptc.org/std/NITF/2006-10-18/";


        private ContentSetBody body = new ContentSetBody();

        @XmlAttribute
        public String getXmlns() {
            return xmlns;
        }

        public void setXmlns(String xmlns) {
            this.xmlns = xmlns;
        }

        @XmlElement
        public ContentSetBody getBody() {
            return body;
        }

        public void setBody(ContentSetBody body) {
            this.body = body;
        }
    }

    @XmlType()
    public static class ContentSetBody {

        private ContentSetHead head = new ContentSetHead();

        private String content = "";


        @XmlElement(name = "body.content")
        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }

        @XmlElement(name = "body.head")
        public ContentSetHead getHead() {
            return head;
        }

        public void setHead(ContentSetHead head) {
            this.head = head;
        }
    }

    @XmlType()
    public static class ContentSetHead {

        private ContentSetHeadLine headline = new ContentSetHeadLine();

        @XmlElement
        public ContentSetHeadLine getHeadline() {
            return headline;
        }

        public void setHeadline(ContentSetHeadLine headline) {
            this.headline = headline;
        }
    }

    @XmlType()
    public static class ContentSetHeadLine {

        private String hl1 = "";

        @XmlElement
        public String getHl1() {
            return hl1;
        }

        public void setHl1(String hl1) {
            this.hl1 = hl1;
        }
    }
}
