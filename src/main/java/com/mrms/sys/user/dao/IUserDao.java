package com.mrms.sys.user.dao;


import com.mrms.common.dao.IGenericDao;
import com.mrms.sys.user.domain.User;

public interface IUserDao extends IGenericDao<User, String> {
    User findByAccount(String account);

    User findByEmail(String email);
}
