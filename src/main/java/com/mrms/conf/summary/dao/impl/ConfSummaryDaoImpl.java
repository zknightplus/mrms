package com.mrms.conf.summary.dao.impl;


import com.mrms.common.dao.impl.BaseHibernateDao;
import com.mrms.conf.summary.dao.IConfSummaryDao;
import com.mrms.conf.summary.domain.ConfSummary;
import org.springframework.stereotype.Repository;

@Repository
public class ConfSummaryDaoImpl extends BaseHibernateDao<ConfSummary,String>
    implements IConfSummaryDao{
}
