package com.dao;

import com.entities.book;
import com.entities.user;
import java.sql.*;
import sun.security.pkcs11.wrapper.Functions;

public class bookdao {

    private Connection con;

    public bookdao(Connection con) {
        this.con = con;
    }

    public boolean savebook(book B) {
        try {
            String query = "insert into books(name,author,link) values(?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, B.getBookName());
            pstmt.setString(2, B.getAuthor());
            pstmt.setString(3, B.getLink());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean saveub(book B, user U) {
        try {
            String query = "insert into bookusers(name,author,link,username) values(?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, B.getBookName());
            pstmt.setString(2, B.getAuthor());
            pstmt.setString(3, B.getLink());
            pstmt.setString(4, U.getUsername());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
