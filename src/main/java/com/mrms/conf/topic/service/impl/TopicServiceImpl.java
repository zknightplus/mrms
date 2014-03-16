package com.mrms.conf.topic.service.impl;

import com.mrms.conf.topic.dao.ITopicDao;
import com.mrms.conf.topic.domain.Topic;
import com.mrms.conf.topic.service.ITopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TopicServiceImpl implements ITopicService {

    @Autowired
    private ITopicDao topicDao;

    @Override
    public void create(Topic topic) {
        topicDao.create(topic);
    }

    @Override
    public void delete(String id) {
        topicDao.delete(id);
    }

    @Override
    public void update(Topic topic) {
        topicDao.update(topic);
    }

    @Override
    public Topic get(String id) {
        return topicDao.find(id);
    }

    @Override
    public List<Topic> list() {
        return topicDao.findAll();
    }
}
