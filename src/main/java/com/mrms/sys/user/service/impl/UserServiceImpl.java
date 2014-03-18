package com.mrms.sys.user.service.impl;


import com.mrms.common.util.MD5Util;
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
    public String create(User user) {
        User aUser = findByAccount(user.getAccount());
        if(aUser != null){
            return "1";
        }
        aUser = findByEmail(user.getEmail());
        if(aUser != null){
            return "2";
        }
        user.setPwd(MD5Util.toMD5("123456"));
        userDao.create(user);
        return "0";
    }

    public String changePwd(String account, String oldPwd, String newPwd){
        User user = findByAccount(account);
        String oldMd5 = MD5Util.toMD5(oldPwd);
        if(oldPwd.equals(user.getPwd())){
            String newMd5 = MD5Util.toMD5(newPwd);
            user.setPwd(newMd5);
            update(user);
            return "0";
        }else{
            return "1";
        }
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

    @Override
    public User findByAccount(String account) {
        return userDao.findByAccount(account);
    }

    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }
}
