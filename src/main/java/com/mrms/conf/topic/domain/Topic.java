package com.mrms.conf.topic.domain;


import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="T_CONF_TOPIC")
public class Topic {

    @Id
    @Column
    @GeneratedValue
    private String id;

    @Column(name = "CONF_TYPE_ID")
    private String confTypeId;

    private String name;

    private String confNo;

//    private Date date;

//    private String org;

//    private String huibaoren;

//    private String topic;

//    private String summary;


    public String getConfTypeId() {
        return confTypeId;
    }

    public void setConfTypeId(String confTypeId) {
        this.confTypeId = confTypeId;
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

    public String getConfNo() {
        return confNo;
    }

    public void setConfNo(String confNo) {
        this.confNo = confNo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Topic topic = (Topic) o;

        if (id != null ? !id.equals(topic.id) : topic.id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
