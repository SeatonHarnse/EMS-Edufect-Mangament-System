<%-- 
    Document   : 5_modify_course_1
    Created on : Sep 28, 2018, 8:21:49 PM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="NavBarCss.css" />
        <link rel="stylesheet" href="formCss.css" />
             
        <title>Modify Course Prefilled Form</title>
        
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
            
        <%
            Connection conn = null;
            String url = "jdbc:mysql://localhost:3306/";
            String dbName = "ems";
            String driver = "com.mysql.jdbc.Driver";
            String userName = "root";
            String password = "";
            Statement st;
            try {
                    Class.forName(driver).newInstance();
                    conn = DriverManager.getConnection(url+dbName,userName,password);
                    st = conn.createStatement();
                    
                    String course_id = request.getParameter("selectedQuery");
                    
                    String query = "select * from coursemaster where c_id=" + course_id;
                    
                    ResultSet rs = st.executeQuery(query);
        %>
                    <form method="post" action="5_modify_course_2.jsp">
        <%          
                    rs.next();
        %>
                        <center><h2 style="color:white">Modify Course</h2></center>
                        <label> Id: </label> <br>
                        <input type="text" value="<%= rs.getInt("c_id")%>" name="crs_id" readonly><br>
                        <label> Name: </label> <br>
                        <input type="text" value="<%= rs.getString("name") %>" name="crs_name"><br>
                        <label> Duration: </label> </br>
                        <input type="text" value="<%= rs.getString("duration") %>" name="crs_drs"><br>
                        <label> Technology: </label> </br>
                        <input type="text" value="<%= rs.getString("technology") %>" name="crs_tech">
                        <br>
                        <button type="submit" >Modify</button>
                    </form>
        <%
                }
                catch(SQLException ex)
                {
                    out.println(ex);
                }
                conn.close();
        %>
    </body>
</html>

