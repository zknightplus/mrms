package com.mrms.sys.user.service;

import com.mrms.sys.user.domain.User;

import java.util.List;

public interface IUserService {

    public String create(User user);

    public void delete(String id);

    public void update(User user);

    public List<User> findAll();

    void deleteBatch(String ids);

    User findByAccount(String account);
}
