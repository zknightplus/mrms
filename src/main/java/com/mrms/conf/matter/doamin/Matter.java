package com.mrms.conf.matter.doamin;


import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

@Entity
@Table(name="T_CONF_MATTER")
public class Matter {

    @Id
    @Column
    @GeneratedValue
    private String id;

    @Column(name="MATTER_CONTENT")
    private String content;

    @Column(name="MATTER_CONTENT")
    private Date finishDate;

    @Column(name="NOTIFY_TIME")
    private Timestamp notifyTime;

    @Column(name="FINISH_STATUS")
    private String finishStatus;

    @Column(name = "FINISH_COMMET")
    private String finishComment;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    public Timestamp getNotifyTime() {
        return notifyTime;
    }

    public void setNotifyTime(Timestamp notifyTime) {
        this.notifyTime = notifyTime;
    }

    public String getFinishStatus() {
        return finishStatus;
    }

    public void setFinishStatus(String finishStatus) {
        this.finishStatus = finishStatus;
    }

    public String getFinishComment() {
        return finishComment;
    }

    public void setFinishComment(String finishComment) {
        this.finishComment = finishComment;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Matter matter = (Matter) o;

        if (id != null ? !id.equals(matter.id) : matter.id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
