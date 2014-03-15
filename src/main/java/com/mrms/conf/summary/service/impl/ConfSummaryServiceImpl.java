package com.mrms.conf.summary.service.impl;

import com.mrms.conf.summary.dao.IConfSummaryDao;
import com.mrms.conf.summary.domain.ConfSummary;
import com.mrms.conf.summary.service.IConfSummaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConfSummaryServiceImpl implements IConfSummaryService{

    @Autowired
    private IConfSummaryDao summaryDao;

    @Override
    public void create(ConfSummary summary) {
        summaryDao.create(summary);
    }

    @Override
    public void delete(String id) {
        summaryDao.delete(id);
    }

    @Override
    public void update(ConfSummary summary) {
        summaryDao.update(summary);
    }

    @Override
    public ConfSummary get(String id) {
        return summaryDao.find(id);
    }

    @Override
    public List<ConfSummary> list() {
        return summaryDao.findAll();
    }
}
