package com.mrms.common.dao;

import java.io.Serializable;
import java.util.List;

public interface IGenericDao<T, ID extends Serializable> {

	public T find(ID id);
	 
	public List<T> findAll();
 
    public void create(T domain);
    
    public void update(T domain);
    
    public void createOrUpdate(T domain);
    
    public void delete(ID id);

    
}
