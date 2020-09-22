<%-- 
    Document   : index
    Created on : 11 Aug, 2020, 3:32:49 PM
    Author     : sarthak
--%>

<%@page import="com.helper.connectionprovider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="link.jsp"%>
        <title>JSP Page</title>
        <%
            Connection con=connectionprovider.getconnection();
        %>
    </head>
    <body style="background-image: url('images/bg-01.jpg');">
        <%@include file="navbar.jsp"%>
        <div class="container-fluid" style="margin-top:0.5%;opacity:0.9;">
            <div class="jumbotron text-white" style="background-color:#79bfe8;">
                <div class="container">
                    <h1>
                        Welcome to the book resource portal
                    </h1>
                </div>
            </div>
        </div>
    </body>
</html>