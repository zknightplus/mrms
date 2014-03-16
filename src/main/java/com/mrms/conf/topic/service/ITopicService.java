package com.mrms.conf.topic.service;


import com.mrms.conf.topic.domain.Topic;

import java.util.List;

public interface ITopicService {

    public void create(Topic topic);

    public void delete(String id);

    public void update(Topic topic);

    public Topic get(String id);

    public List<Topic> list();
}
