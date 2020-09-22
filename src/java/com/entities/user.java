package com.entities;

import java.sql.Timestamp;
import java.sql.*;
public class user {
    private int id;
    private String name;
    private String gender;
    private String email;
    private String password;
    private String username;
    private String phone;
    private Timestamp date;

    public user(String name, String gender, String email, String password, String username,String phone) {
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.password = password;
        this.username = username;
        this.phone=phone;
    }
    public user()
    {
        
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
} 