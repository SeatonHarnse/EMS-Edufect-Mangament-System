<%-- 
    Document   : 3_HomePage_admin
    Created on : Sep 26, 2018, 5:26:44 PM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="NavBarCss.css"/>
        <title>HomePageAdmin</title>
        <style>
        body{
            background: -webkit-linear-gradient(left, #25c481, #25b7c4);
            background: linear-gradient(to right, #25c481, #25b7c4);
          }
        </style>
    </head>
    <body>
        <div id="nav1">
            <ul>
                <li class="active"><a href="index.jsp"><b>Home</b></a></li>
                <li class="dropdown"><a href="#"><b>Courses</b></a>
                    <div class="dropdown-content">
                        <a href="4_add_course.jsp">Add New Course</a>
                        <a href="5_modify_course.jsp">Modify Course</a>
                        <a href="6_delete_course.jsp">Delete Course</a>
                        <a href="display_course.jsp">Show Courses</a>
                    </div>
                </li>
                <li class="dropdown"><a href="#"><b>Students</b></a>
                    <div class="dropdown-content">
                    <a href="7_add_student.jsp">Add New Student</a>
                    <a href="8_modify_student.jsp">Modify Student</a>
                    <a href="9_delete_student.jsp">Delete Student</a>     
                    <a href="display_student.jsp">Show Students</a>
                    </div>
                </li>
                <li class="dropdown"><a href="#"><b>Enroll</b></a>
                    <div class="dropdown-content">
                    <a href="10_enroll_student.jsp">Enroll Student</a>
                    <a href="11_remove_enroll.jsp">Remove Enrollment</a>
                    <a href="display_enroll.jsp">Show Enrollments</a>
                    </div>
                </li>
                <li><a href="12_fees.jsp"><b>Fees</b></a></li>
                <li style="float:right"><a href="logout.jsp"><b>Logout</b></a></li>
            </ul>
        </div>
        <center><h1>WELCOME TO EDUFECT</h1></center>
        <center><p style="font-family: Tahoma, Geneva, sans-serif;">
                <i>ADMIN DASHBOARD<i></p></center>
        <center><img src="image/edufect-img-tr.png" alt="Smiley face" height="400" width="800">></center>
    </body>
</html>
