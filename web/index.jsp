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
        <style>
            a:hover{
                text-decoration:none;
            }
        </style>
    </head>
    <body style="background-image: url('images/bg-01.jpg');">
        <%@include file="navbar.jsp"%>
        <div class="container-fluid" style="margin-top:0.5%;opacity:0.9;">
            <div class="jumbotron text-white" style="background-color:#ff367c;">
                <div class="container">
                    <h1>
                        Welcome to the book resource portal
                    </h1>
                </div>
            </div>
        </div>
        <div id="recent">
            <%@include file="recent.jsp"%>
        </div>
    </body>
    <script>
        function add(bookname,author,link)
        {
            $.ajax({
                url: "AddServlet",
                data: {name:bookname,author:author,link:link},
                success: function (data)
                {
                    var reply = data.replace(/\s+/, "");
                    if (reply == '1')
                        swal("PLease Login First")
                    if(reply=='2')
                        swal("Book added successfully")
                    if(reply=='3')
                        swal("Book already exists in your collection")
                },
                error: function ()
                {
                    swal("Oops..Some error has occured");
                }
            });
        }
    </script>
</html>