package com.mrms.base.param.dao.impl;


import com.mrms.base.param.dao.IParamCategoryDao;
import com.mrms.base.param.domain.ParamCategory;
import com.mrms.common.dao.impl.BaseHibernateDao;
import org.springframework.stereotype.Repository;

@Repository
public class ParamCategoryDaoImpl extends BaseHibernateDao<ParamCategory,String> implements IParamCategoryDao {

}
