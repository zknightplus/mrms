package com.mrms.sys.user.dao.impl;

import com.mrms.common.dao.impl.BaseHibernateDao;
import com.mrms.sys.user.dao.IUserDao;
import com.mrms.sys.user.domain.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl extends BaseHibernateDao<User, String> implements IUserDao{
}
