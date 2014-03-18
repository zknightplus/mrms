package com.mrms.conf.matter.service.impl;

import com.mrms.conf.matter.dao.IMatterDao;
import com.mrms.conf.matter.doamin.Matter;
import com.mrms.conf.matter.service.IMatterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MatterServiceImpl implements IMatterService {

    @Autowired
    private IMatterDao matterDao;

    @Override
    public void create(Matter matter) {
        matterDao.create(matter);
    }

    @Override
    public void update(Matter matter) {
        matterDao.update(matter);
    }

    @Override
    public void delete(String id) {
        matterDao.delete(id);
    }

    @Override
    public Matter get(String id) {
        return matterDao.find(id);
    }

    @Override
    public List<Matter> list() {
        return matterDao.findAll();
    }
}
