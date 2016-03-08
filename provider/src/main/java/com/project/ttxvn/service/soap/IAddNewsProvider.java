package com.project.ttxvn.service.soap;

import com.project.ttxvn.model.ImageNews;
import com.project.ttxvn.model.News;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

/**
 * Created by Thinh on 07-Mar-16.
 */
@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface IAddNewsProvider {
    News save(News obj);
    ImageNews save(ImageNews obj);
}
