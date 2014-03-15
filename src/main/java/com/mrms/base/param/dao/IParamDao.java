package com.mrms.base.param.dao;

import com.mrms.base.param.domain.ParamItem;
import com.mrms.common.dao.IGenericDao;

import java.util.List;

public interface IParamDao extends IGenericDao<ParamItem,String>{

    public List<ParamItem> findByCategory(String category);
}
