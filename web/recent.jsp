<%@page import="com.entities.user"%>
<%@page import="com.dao.bookdao"%>
<%@page import="com.entities.book"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.connectionprovider"%>
<div class="container-fluid" style="margin-top:0.5%;opacity:0.9;">
    <div class="jumbotron text-white" style="background-color:#79bfe8;">
        <div class="container ml-auto mr-auto text-center">
            <h3>
                Recently added books
            </h3>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
    <%
        bookdao X=new bookdao(connectionprovider.getconnection());
        List<book> books=X.getrecentbook();
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