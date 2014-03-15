package com.mrms.base.param.service;


import com.mrms.base.param.domain.ParamCategory;
import com.mrms.base.param.domain.ParamItem;

import java.util.List;

public interface IParamService {

    public List<ParamCategory> findAllCategory();

    void deleteParamItem(String id);

    List<ParamItem> findCategoryItems(String categoryId);

    void createItem(ParamItem item);

    void updateItem(ParamItem item);
}
