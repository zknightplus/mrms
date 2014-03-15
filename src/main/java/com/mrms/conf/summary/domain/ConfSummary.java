package com.mrms.conf.summary.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="T_CONF_SUMMARY")
public class ConfSummary implements Serializable{

    @Id
    @Column
    @GeneratedValue
	private String id;

    @Column(name="CONFERENCE_START")
    private Date startDate;

    @Column(name="CONFERENCE_END")
    private Date endDate;

    @Column(name="CONFERENCE_NO")
    private String no;

    @Column(name="ATTACH_FILE_NAME")
    private String attachFileName;

    @Column(name = "ATTACH_FILE_PATH")
    private String getAttachFilePath;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getAttachFileName() {
        return attachFileName;
    }

    public void setAttachFileName(String attachFileName) {
        this.attachFileName = attachFileName;
    }

    public String getGetAttachFilePath() {
        return getAttachFilePath;
    }

    public void setGetAttachFilePath(String getAttachFilePath) {
        this.getAttachFilePath = getAttachFilePath;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ConfSummary that = (ConfSummary) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
