<%-- 
    Document   : 7_add_student
    Created on : Sep 29, 2018, 4:31:49 PM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="NavBarCss.css" />
        <link rel="stylesheet" href="formCss.css" />
        <title>Add Student</title>
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
            
        <form method="post" action="7_add_student_1.jsp">
            <center><h2 style="color:white">Add Student</h2></center><br>
            <label> Name: </label> <br>
            <input type="text" name="name" autofocus required /> <br>
            <label> Password: </label> </br>
            <input type="text" name="password" required /><br>
            <label> Email: </label> </br>
            <input type="text" name="email" required /><br>
            <label> Mobile No: </label> <br>
            <input type="text" name="mobile" required /><br>
            <label> City: </label> <br>
            <input type="text" name="city" required />
            <br>
            <button type="submit" >Add</button>
        </form>
    </body>
</html>