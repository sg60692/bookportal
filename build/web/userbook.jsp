<%@page import="com.entities.user"%>
<%@page import="com.dao.bookdao"%>
<%@page import="com.entities.book"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.connectionprovider"%>
<div class="container-fluid">
    <div class="row">
    <%
        bookdao X=new bookdao(connectionprovider.getconnection());
        user U=(user)session.getAttribute("currentuser");
        List<book> books=X.getuserbook(U.getUsername());
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
                        <button class="btn btn-dark ml-auto mr-auto" onclick="rem('<%=B.getBookName()%>')" type="button" style="height:40px;width:60%;"><h3>Remove</h3></button>
            </div>
    </div>
    <%
        }
    %>
    </div>
</div>