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
            <div class="jumbotron text-white" style="background-color:#ff367c;">
                <div class="container">
                    <h1>
                        Welcome to the book resource portal
                    </h1>
                </div>
            </div>
        </div>
        <div class="container-fluid" style="margin-top:0.5%;opacity:0.9;">
    <div class="jumbotron text-white" style="background-color:#79bfe8;">
        <div class="container ml-auto mr-auto text-center">
            <h3>
                Search Results
            </h3>
        </div>
    </div>
</div>
<%@page import="com.entities.user"%>
<%@page import="com.dao.bookdao"%>
<%@page import="com.entities.book"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.connectionprovider"%>
<div class="container-fluid">
    <div class="row">
    <%
        bookdao X=new bookdao(connectionprovider.getconnection());
        String search=(String)session.getAttribute("search");
        List<book> books=X.getsearchbook(search);
        for(book B:books)
        {
    %>
    <div class="col-xs-8 col-md-5 col-lg-4 text-center mt-2" style="padding:30px;">
        <a href="<%out.print("http://");out.print(B.getLink());%>" class="abook">
            <div class="card bookdisplay" style="height:150px;padding:10px;">
                <div style="background-color: #d3f0eb;margin-bottom:2px;">
                    <h3 >
                        Name: 
                        <%
                            out.print(B.getBookName());
                        %>
                    </h3>
                </div>
                <div style="background-color: #d3e8f0;margin-bottom:4px;">
                    <h3>
                        Author:
                        <%
                            out.print(B.getAuthor());
                        %>
                    </h3>
                </div>
        </a>
                        <button class="btn btn-dark ml-auto mr-auto" onclick="add('<%=B.getBookName()%>','<%=B.getAuthor()%>','<%=B.getLink()%>')" type="button" style="height:40px;width:60%;"><h3>Add</h3></button>
            </div>
    </div>
    <%
        }
    %>
    </div>
</div>
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
                        swal("Book already exists in your collection"")
                },
                error: function ()
                {
                    swal("Oops..Some error has occured");
                }
            });
        }
    </script>
    </body>
</html>
