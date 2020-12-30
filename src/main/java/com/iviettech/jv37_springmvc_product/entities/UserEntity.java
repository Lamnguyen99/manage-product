/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.entities;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author lamde
 */
@Entity
@Table(name = "user")
public class UserEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Column(name = "user_name", length = 30, nullable = false)
    private String username;

    @Column(name = "password", length = 60, nullable = false)
    private String password;

    private boolean status;

    @OneToMany(mappedBy = "userEntity", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL)
    private Set<RoleUserEntity> roleUsers = new HashSet<RoleUserEntity>();

    public UserEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Set<RoleUserEntity> getRoleUsers() {
        return roleUsers;
    }

    public void setRoleUsers(Set<RoleUserEntity> roleUsers) {
        this.roleUsers = roleUsers;
    }

}
