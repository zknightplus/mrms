package com.mrms.conf.matter.dao.impl;


import com.mrms.common.dao.impl.BaseHibernateDao;
import com.mrms.conf.matter.dao.IMatterDao;
import com.mrms.conf.matter.doamin.Matter;
import org.springframework.stereotype.Repository;

@Repository
public class MatterDaoImpl extends BaseHibernateDao<Matter,String>
    implements IMatterDao{
}
