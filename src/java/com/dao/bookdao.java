package com.dao;

import com.entities.book;
import com.entities.user;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
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
    public boolean delbook(String username,String name) {
        try {
            String query = "delete from bookusers where username=? and name=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, name);
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean saveub(book B, user U) {
        try {
            String query = "select * from bookusers where name=? and username=?";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setString(1, B.getBookName());
            pstmt.setString(2, U.getUsername());
            ResultSet set=pstmt.executeQuery();
            int x=0;
            while(set.next())
                ++x;
            if(x==1)
                return false;
            query = "insert into bookusers(name,author,link,username) values(?,?,?,?)";
            pstmt = this.con.prepareStatement(query);
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
    public String getsearchString(String search)
    {
        int l=1,r=search.length(),f=1,s=0;
        String result="";
        if(r==0)
            return result;
        while(l<=r)
        {
            int mid=(l+r)>>1;
            try{
                String query="select COUNT(*) from books where name>=? and name<=";
                PreparedStatement pstmt=con.prepareStatement(query);
                pstmt.setString(1, search.substring(0,mid));
                String temp="";
                if(mid>1)
                    temp=search.substring(0,mid-1);
                temp+=(char)(search.charAt(mid-1)+1);
                ResultSet set=pstmt.executeQuery();
                s=set.getInt("COUNT(*)");
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            if(s<3)
            {
                r=mid-1;
            }
            else
            {
                f=mid;
                l=mid+1;
            }
        }
        result=search.substring(0, f);
        return result;
    }
    public List<book> getrecentbook()
    {
        List<book> list=new ArrayList<>();
        try
        {
            String query="SELECT * FROM books ORDER BY rdate DESC LIMIT 6;";
            PreparedStatement pstmt=con.prepareStatement(query);
            ResultSet set=pstmt.executeQuery();
            while(set.next())
            {
                String name=set.getString("name");
                String author=set.getString("author");
                String link=set.getString("link");
                book B=new book(name,author,link);
                list.add(B);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    public List<book> getsearchbook(String search)
    {
        List<book> list=new ArrayList<>();
        try
        {
            String query;
            if(search=="")
            {
                query="SELECT * FROM books ORDER BY name LIMIT 3";
            }
            else{
                query="SELECT * FROM books where name>=? and name<=?";    
            }                
            PreparedStatement pstmt=con.prepareStatement(query);
            if(search!="")
            {
                pstmt.setString(1,search);
                int x=search.length();
                String temp="";
                if(x>1)
                    temp=search.substring(0,x-1);
                temp+=(char)(search.charAt(x-1)+1);
                pstmt.setString(2,temp);
            }
            ResultSet set=pstmt.executeQuery();
            while(set.next())
            {
                String name=set.getString("name");
                String author=set.getString("author");
                String link=set.getString("link");
                book B=new book(name,author,link);
                list.add(B);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    public List<book> getuserbook(String username)
    {
        List<book> list=new ArrayList<>();
        try
        {
            String query="Select * from bookusers where username=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,username);
            ResultSet set=pstmt.executeQuery();
            while(set.next())
            {
                String name=set.getString("name");
                String author=set.getString("author");
                String link=set.getString("link");
                book B=new book(name,author,link);
                list.add(B);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
}