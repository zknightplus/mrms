package com.mrms.base.param.service.impl;


import com.mrms.base.param.dao.IParamCategoryDao;
import com.mrms.base.param.dao.IParamDao;
import com.mrms.base.param.domain.ParamCategory;
import com.mrms.base.param.domain.ParamItem;
import com.mrms.base.param.service.IParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

@Service
public class ParamServiceImpl implements IParamService{

    @Autowired
    private IParamDao paramDao;

    @Autowired
    private IParamCategoryDao paramCategoryDao;


    @Override
    public List<ParamCategory> findAllCategory() {
        List<ParamCategory> categories =  paramCategoryDao.findAll();
        if(categories != null){
            Set<ParamCategory> categorySet = new TreeSet<ParamCategory>();
            for (ParamCategory category : categories){
                if(!categorySet.contains(category)){
                    categorySet.add(category);
                }
            }

            categories = new ArrayList<ParamCategory>(categorySet);
        }

        return categories;


    }

    @Override
    public void deleteParamItem(String id) {
        paramDao.delete(id);
    }

    @Override
    public List<ParamItem> findCategoryItems(String categoryId) {
        return paramDao.findByCategory(categoryId);
    }

    @Override
    public void createItem(ParamItem item) {
        paramDao.create(item);
    }

    @Override
    public void updateItem(ParamItem item) {
        paramDao.update(item);
    }
}
