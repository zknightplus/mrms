package com.mrms.conf.topic.domain;


import com.mrms.base.param.domain.ParamItem;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="T_CONF_TOPIC")
public class Topic {

    @Id
    @Column
    @GeneratedValue
    private String id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "CONF_TYPE_ID")
    private ParamItem confType;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "REPORT_UNIT_ID")
    private ParamItem reportUnit;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "SUBJECT_ID")
    private ParamItem subject;

    private String name;

    @Column(name="CONF_NO")
    private String confNo;

//    private Date date;

//    private String org;

//    private String huibaoren;

//    private String topic;

//    private String summary;


    public ParamItem getReportUnit() {
        return reportUnit;
    }

    public void setReportUnit(ParamItem reportUnit) {
        this.reportUnit = reportUnit;
    }

    public ParamItem getSubject() {
        return subject;
    }

    public void setSubject(ParamItem subject) {
        this.subject = subject;
    }

    public ParamItem getConfType() {
        return confType;
    }

    public void setConfType(ParamItem confType) {
        this.confType = confType;
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
