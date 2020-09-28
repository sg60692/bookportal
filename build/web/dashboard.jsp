<%@page import="com.entities.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    user U=(user)session.getAttribute("currentuser");
    if(U==null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="css/dashboard.css">
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <script src=https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js></script>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body style="background-image: url('images/bg-01.jpg');">
        <input type="checkbox" id="check">
        <label for="check">
            <i class="fas fa-bars" id="btn"></i>
            <i class="fas fa-times" id="cancel"></i>
        </label>
        <div class="sidebar">
            <h1 class="mt-0 hdashboard"><a href="index.jsp" style="color:white;font-size:25px;margin-left:40px; ">Home</a></h1>
            <ul>
                <li onclick="v()"><a href="#"><i class="fas fa-calendar-week" style="margin-right: 8px;"></i>Your books</a></li>
                <li onclick="u()"><a href="#"><i class="fas fa-calendar-week" style="margin-right: 8px;"></i>Upload books</a></li>
                <li><a href="logout">Log Out</span></a></li>
            </ul>  
        </div>
        <section style="position:absolute;width:100%;">
            <div style="margin-top:5px;margin-bottom:15px;opacity:0.9;right:0;height:70px;width:100%;">
                <div class="text-white" style="background-color:#79bfe8; height:100%;padding-top:5px;">
                    <div class="text-right">
                        <h3 style="margin-bottom:0;margin-right:10px;">
                            <%
                                user u = (user) session.getAttribute("currentuser");
                                out.println(u.getName());
                            %>
                        </h3>
                        <h4 style="font-style:italic;margin-top:0;margin-right:5px;">
                            <%
                                out.println(u.getUsername());
                            %>
                        </h4>
                    </div>
                </div>
            </div>
            <div class="limiter" id="display" style="margin-top:5px;">
                <div class="container-login100" id="uploadform">
                    <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                        <form id="up-form" action="uploadServlet" method="post" class="login100-form validate-form">
                            <span class="login100-form-title p-b-49">
                                Upload Book
                            </span>

                            <div class="wrap-input100 validate-input m-b-23" data-validate = "Bookname is reauired">
                                <span class="label-input100" style="font-weight:bold;">Book name</span>
                                <input class="input100" type="text" name="bookname" placeholder="Type book name">
                            </div>

                            <div class="wrap-input100 validate-input m-b-23" data-validate="Author is required">
                                <span class="label-input100" style="font-weight:bold;">Author</span>
                                <input class="input100" type="text" name="author" placeholder="Type author">
                            </div>
                            <div class="wrap-input100 validate-input" data-validate="Link is required">
                                <span class="label-input100" style="font-weight:bold;">Link</span>
                                <input class="input100" type="text" name="link" placeholder="Please provide Link">
                            </div>

                            <div class="text-right p-t-8 p-b-31">
                            </div>
                            <div class="container-login100-form-btn">
                                <div class="wrap-login100-form-btn">
                                    <div class="login100-form-bgbtn"></div>
                                    <button id="sub-but" class="login100-form-btn">
                                        upload
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="userbooks">
                </div>
            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <!--===============================================================================================-->
            <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
            <!--===============================================================================================-->
            <script src="vendor/animsition/js/animsition.min.js"></script>
            <!--===============================================================================================-->
            <script src="vendor/bootstrap/js/popper.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
            <!--===============================================================================================-->
            <script src="vendor/select2/select2.min.js"></script>
            <!--===============================================================================================-->
            <script src="vendor/daterangepicker/moment.min.js"></script>
            <script src="vendor/daterangepicker/daterangepicker.js"></script>
            <!--===============================================================================================-->
            <script src="vendor/countdowntime/countdowntime.js"></script>
            <!--===============================================================================================-->
            <script src="js/main.js"></script>
            <script>
                function u()
                {
                    $("#uploadform").show();
                    $("#userbooks").hide();
                }
                function v()
                {
                    $("#uploadform").hide();
                    $.ajax({
                       url: "userbook.jsp",
                       success: function (data, textStatus, jqXHR) 
                       {
                           $("#userbooks").html(data);
                       }
                    });
                    $("#userbooks").show();
                }
                function rem(bookname)
                {
                    $.ajax({
                            url: "RemoveServlet",
                            data: {name:bookname},
                            success: function (data)
                            {
                                var reply = data.replace(/\s+/, "");
                                if (reply == '1')
                                    swal("Book removed successfully")
                                if(reply=='0')
                                    swal("Oops..Some error has occured")
                            },
                            error: function ()
                            {
                                swal("Oops..Some error has occured");
                            }
                    });
                    v();
                }
                $(document).ready(function () {
                    v();
                    $('#up-form').on('submit', function (event) {
                        event.preventDefault();
                        $("#sub-but").hide();
                        let form = new FormData(this);
                        $.ajax({
                            url: "uploadServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR)
                            {
                                $("#sub-but").show();
                                var reply = data.replace(/\s+/, "");
                                if (reply == '1')
                                    swal("All Fields must be filled")
                                if (reply == '2')
                                    swal("Book already exists")
                                if (reply == '3')
                                    swal("Book uploaded successfully")
                            },
                            error: function (jqXHR, textStatus, errorThrown)
                            {
                                $("#sub-but").show();
                                swal("Oops..Some error has occured");
                                console.log(jqXHR)
                            },
                            processData: false,
                            contentType: false
                        });
                    });
                });
            </script>
        </section>
    </body>
</html>