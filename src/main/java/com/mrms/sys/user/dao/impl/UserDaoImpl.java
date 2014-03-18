package com.mrms.sys.user.dao.impl;

import com.mrms.common.dao.impl.BaseHibernateDao;
import com.mrms.sys.user.dao.IUserDao;
import com.mrms.sys.user.domain.User;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl extends BaseHibernateDao<User, String> implements IUserDao{
    @Override
    public User findByAccount(String account) {
        Criteria c = createCriteria();
        c.add(Restrictions.eq("account", account));
        return (User)c.uniqueResult();
    }
}
