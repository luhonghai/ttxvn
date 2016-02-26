package com.project.ttxvn.service.soap;

import com.project.ttxvn.constant.Common;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by cmg on 26/02/2016.
 */
public class SoapProviderFactory {

    public static ISoapProvider createInstance() throws MalformedURLException {
        URL url = new URL(Common.REMOTE_SOAP);
        QName qname = new QName(Common.REMOTE_SOAP_SERVICE_URI, Common.REMOTE_SOAP_SERVICE_NAME);
        Service service = Service.create(url, qname);
        return service.getPort(ISoapProvider.class);
    }
}
