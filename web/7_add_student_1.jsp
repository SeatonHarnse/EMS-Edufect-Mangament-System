<%-- 
    Document   : 7_add_student_1
    Created on : Sep 29, 2018, 4:48:33 PM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="NavBarCss.css" />
         <link rel="stylesheet" href="table.css"/>
        <title>add course_1</title>
    </head>
    <body>
        <script type="text/javascript" src="table.js"></script>
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
        <%
            Connection conn = null;
            String url = "jdbc:mysql://localhost:3306/";
            String dbName = "ems";
            String driver = "com.mysql.jdbc.Driver";
            String userName = "root";
            String password = "";
            try {
                    Class.forName(driver).newInstance();
                    conn = DriverManager.getConnection(url+dbName,userName,password);
                    
                    String s_name = request.getParameter("name");
                    String s_password = request.getParameter("password");
                    String s_email = request.getParameter("email");
                    String s_mobil = request.getParameter("mobile");
                    String s_city = request.getParameter("city");
        
                    String insQuery = "insert into studentMaster(name,password,email,mobile,city) "
                                    + "values(?,?,?,?,?)";
                    
                    PreparedStatement pstmt = conn.prepareStatement(insQuery);
                    
                    pstmt.setString(1, s_name);
                    pstmt.setString(2, s_password);
                    pstmt.setString(3, s_email);
                    pstmt.setString(4, s_mobil);
                    pstmt.setString(5, s_city);
                    
                    int count = pstmt.executeUpdate();
                    if( count != 0)
                    {
                        response.sendRedirect("display_student.jsp");
                    }
                    else
                    {
                        response.sendRedirect("zErrorPageSqlOperationFailure.html");
                    }
                        
                }
                catch(SQLException ex)
                {
                    out.println(ex);
                }
        %>
    </body>
</html>