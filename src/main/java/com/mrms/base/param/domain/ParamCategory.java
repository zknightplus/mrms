package com.mrms.base.param.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="T_BASE_PARAM_CATEGORY")
public class ParamCategory implements Comparable<ParamCategory>{

    @Id
    @GeneratedValue
    private String id;

    private String name;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name="CATEGORY_ID")
    @OrderBy("id")
    private Set<ParamItem> items;

    public Set<ParamItem> getItems() {
        return items;
    }

    public void setItems(Set<ParamItem> items) {
        this.items = items;
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

    @Override
    public boolean equals(Object o) {

        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ParamCategory that = (ParamCategory) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    @Override
    public int compareTo(ParamCategory o) {
        return this.getId().compareTo(o.getId());
    }
}
