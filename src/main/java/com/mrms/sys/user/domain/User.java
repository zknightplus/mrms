package com.mrms.sys.user.domain;

import com.mrms.base.param.domain.ParamItem;

import javax.persistence.*;

@Entity
@Table(name="T_SYS_USER")
public class User {

    @Id
    @Column(name="ID")
    @GeneratedValue
    private String id;

    /**登陆账号**/
    private String account;

    private String pwd;

    private String type;

    private String name;

    private String telNo;

    private String email;

    private Boolean admin;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="duty_id")
    private ParamItem duty;

    public ParamItem getDuty() {
        return duty;
    }

    public void setDuty(ParamItem duty) {
        this.duty = duty;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelNo() {
        return telNo;
    }

    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (id != null ? !id.equals(user.id) : user.id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
