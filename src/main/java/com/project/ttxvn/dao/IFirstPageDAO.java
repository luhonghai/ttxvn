package com.project.ttxvn.dao;


import com.project.ttxvn.model.FirstPage;

import javax.ejb.Remote;
import java.util.List;

/**
 * Created by Thinh on 28-Feb-16.
 */
@Remote
public interface IFirstPageDAO extends IBaseDAO<FirstPage>{

    List<FirstPage> getCurrent();
}
