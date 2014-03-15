package com.mrms.sys.user.service.impl;


import com.mrms.sys.user.dao.IUserDao;
import com.mrms.sys.user.domain.User;
import com.mrms.sys.user.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService{

    @Autowired
    private IUserDao userDao;

    @Override
    public void create(User user) {
        userDao.create(user);
    }

    @Override
    public void delete(String id) {
        userDao.delete(id);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public void deleteBatch(String ids) {
        if(StringUtils.isBlank(ids)){
            return;
        }
        String[] idArray = ids.split(",");
        if(idArray == null || idArray.length == 0){
            return ;
        }
        for(String id : idArray){
            userDao.delete(id);
        }

    }
}
