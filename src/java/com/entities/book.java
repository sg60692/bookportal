package com.entities;

import java.sql.Timestamp;
import java.sql.*;
public class book {
    private int id;
    private String bookname;
    private String author;
    private String link;
    private Timestamp rdate;

    public book(String bookname, String author, String link) {
        this.bookname = bookname;
        this.author = author;
        this.link = link;
    }

    public book() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBookName() {
        return bookname;
    }

    public void setBookName(String bookname) {
        this.bookname = bookname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Timestamp getRdate() {
        return rdate;
    }

    public void setRdate(Timestamp rdate) {
        this.rdate = rdate;
    }   
    
} 