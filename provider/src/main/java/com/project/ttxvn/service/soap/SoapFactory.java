package com.project.ttxvn.service.soap;

import com.project.ttxvn.service.IUserProvider;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by Thinh on 06-Mar-16.
 */
public class SoapFactory {

    public static final String REMOTE_SOAP = "http://localhost:8180/ttxvn/";

    public static final String REMOTE_SOAP_SERVICE_URI = "http://service.ttxvn.project.com/";

    public static <T> T createInstance(Class<T> clazz, String name){
        try {
            URL url = new URL(REMOTE_SOAP + name + "?wsdl");
            QName qname = new QName(REMOTE_SOAP_SERVICE_URI, name + "Service");
            Service service = Service.create(url, qname);
            return service.getPort(clazz);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static IUserProvider createInstance() throws MalformedURLException {
        URL url = new URL("http://localhost:8180/ttxvn/UserProvider?wsdl");
        QName qname = new QName(REMOTE_SOAP_SERVICE_URI,  "UserProviderService");
        Service service = Service.create(url, qname);
        return service.getPort(IUserProvider.class);
    }

}
