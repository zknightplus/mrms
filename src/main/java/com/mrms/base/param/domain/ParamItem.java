package com.mrms.base.param.domain;

import javax.persistence.*;

/**
 * 基础参数类
 *
 */
@Entity
@Table(name="T_BASE_PARAM_ITEM")
public class ParamItem {

    @Id
    @Column(name="ID")
    @GeneratedValue
    private String id;

    @Column(name="NAME")
    private String name;

    @Column(name="CATEGORY_ID")
    private String categoryId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ParamItem param = (ParamItem) o;

        if (id != null ? !id.equals(param.id) : param.id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    public String getId() {

        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
}
