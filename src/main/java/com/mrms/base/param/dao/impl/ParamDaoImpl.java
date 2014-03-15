package com.mrms.base.param.dao.impl;


import com.mrms.base.param.dao.IParamDao;
import com.mrms.base.param.domain.ParamItem;
import com.mrms.common.dao.impl.BaseHibernateDao;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ParamDaoImpl  extends BaseHibernateDao<ParamItem,String> implements IParamDao{

    @Override
    public List<ParamItem> findByCategory(String categoryId) {
        DetachedCriteria c = super.createDetachedCriteria();

        c.add(Restrictions.eq("categoryId", categoryId));

        return super.query(c);
    }
}
