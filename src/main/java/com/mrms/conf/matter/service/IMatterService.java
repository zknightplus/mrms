package com.mrms.conf.matter.service;


import com.mrms.conf.matter.doamin.Matter;

import java.util.List;

public interface IMatterService {

    public void create(Matter matter);

    public void update(Matter matter);

    public void delete(String id);

    public Matter get(String id);

    public List<Matter> list();
}
