package com.helper;
import java.sql.*;
public class connectionprovider 
{
    private static Connection con;
    public static Connection getconnection()
    {
        try
        {
            if(con==null)
            {
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookportal","sarthak","gu@v@1234");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}