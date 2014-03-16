package com.mrms.conf.topic.dao.impl;

import com.mrms.common.dao.impl.BaseHibernateDao;
import com.mrms.conf.topic.dao.ITopicDao;
import com.mrms.conf.topic.domain.Topic;
import org.springframework.stereotype.Repository;

@Repository
public class TopicDaoImpl extends BaseHibernateDao<Topic, String> implements ITopicDao{
}
