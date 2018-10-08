<%-- 
    Document   : 8_modify_student_1
    Created on : Sep 29, 2018, 5:49:16 PM
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
        <title>Modify Student Prefilled Form</title>
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
                    <a href="deletestudent.jsp">Delete Student</a>     
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
                    
                    String student_id = request.getParameter("selectedQuery");
                    
                    String query = "select * from studentMaster where s_id=" + student_id;
                    
                    ResultSet rs = st.executeQuery(query);
        %>
                    <form method="post" action="8_modify_student_2.jsp">
        <%          
                    rs.next();  //moves cursuor to one and only record available
        %>
                        <center><h2 style="color:white">Modify Student</h2></center>
                        <label> Id: </label> <br>
                        <input type="text" value="<%= rs.getInt("s_id")%>" name="stu_id" readonly><br>
                        <label> Name: </label> <br>
                        <input type="text" value="<%= rs.getString("name") %>" name="stu_name"><br>
                        <label> Password: </label> </br>
                        <input type="text" value="<%= rs.getString("password") %>" name="stu_pass"><br>
                        <label> Email: </label> </br>
                        <input type="text" value="<%= rs.getString("email") %>" name="stu_email"><br>
                        <label> Mobile: </label> </br>
                        <input type="text" value="<%= rs.getString("mobile") %>" name="stu_mobile"><br>
                        <label> City: </label> </br>
                        <input type="text" value="<%= rs.getString("city") %>" name="stu_city">
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