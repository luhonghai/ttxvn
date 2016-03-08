package com.project.ttxvn.dao;

import com.project.ttxvn.model.PackageNews;

import java.util.List;

/**
 * Created by Thinh on 07-Mar-16.
 */
public interface IPackageNewsDAO extends IBaseDAO<PackageNews>{
    List<PackageNews> findByCategoryId(long id);

    List<PackageNews> findByCategoryId(long id, int status);

    List<PackageNews> findByStatus(PackageNews.Status status);

    int countByCategoryId(long id);
}
