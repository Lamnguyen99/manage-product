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
@Table(name = "role")
public class RoleEntity implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;
    
    @Column(name = "name", length = 30, nullable = false)
    private String name;
    
    @OneToMany(mappedBy = "roleEntity", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
    private Set<RoleUserEntity> roleUsers = new HashSet<RoleUserEntity>();

    public RoleEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<RoleUserEntity> getRoleUsers() {
        return roleUsers;
    }

    public void setRoleUsers(Set<RoleUserEntity> roleUsers) {
        this.roleUsers = roleUsers;
    }
    
}
