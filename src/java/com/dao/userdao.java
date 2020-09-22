package com.dao;
import com.entities.user;
import java.sql.*;
public class userdao {
    private Connection con;

    public userdao(Connection con) {
        this.con = con;
    }
    public boolean saveuser(user U) 
    {
        try
        {
            String query = "insert into user(name,email,password,gender,username,phone) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1,U.getName());
            pstmt.setString(2,U.getEmail());
            pstmt.setString(3,U.getPassword());
            pstmt.setString(4,U.getGender());
            pstmt.setString(5,U.getUsername());            
            pstmt.setString(6,U.getPhone());            
            pstmt.executeUpdate();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public user getUserEmail(String username,String password)
    {
        user U=null;
        try
        {
            String query="Select * from user where username=? and password=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet s=pstmt.executeQuery();
            if(s.next())
            {
                U=new user();
                U.setName(s.getString("name"));
                U.setEmail(s.getString("email"));
                U.setPassword(s.getString("password"));
                U.setGender(s.getString("gender"));
                U.setUsername(s.getString("username"));
                U.setPhone(s.getString("phone"));
                U.setDate(s.getTimestamp("rdate"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return U;
    }
}
