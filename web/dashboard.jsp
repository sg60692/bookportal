<%@page import="com.entities.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("currentuser") == null) {

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
    <% int x = 0; %>
    <body style="background-image: url('images/bg-01.jpg');">
        <input type="checkbox" id="check">
        <label for="check">
            <i class="fas fa-bars" id="btn"></i>
            <i class="fas fa-times" id="cancel"></i>
        </label>
        <div class="sidebar">
            <h1 class="mt-0 hdashboard"><a href="index.jsp" style="color:white;font-size:25px;margin-left:40px; ">Home</a></h1>
            <ul>
                <li><a href="#"><i class="fas fa-calendar-week" style="margin-right: 8px;"></i>Upload books</a></li>
                <li><a href="logout.java">Log Out</span></a></li>
            </ul>  
        </div>
        <section>
            <div style="margin-top:0%;opacity:0.9;position:absolute;right:0;height:70px;width:100%;">
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
            <br><br><br>
            <div class="limiter" id="display">
                
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
                $(document).ready(function () {
                    
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
                                console.log(data)
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