<%-- 
    Document   : display_student
    Created on : Sep 29, 2018, 4:19:04 PM
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
        <title>Show Students</title>
        <script type="text/javascript" src="table.js"></script>
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
                    String selQuery = "select * from studentMaster";
                    ResultSet rs = st.executeQuery(selQuery);
                    
        %>
                     <section>
                        <div class="long-block">   
                            All STUDENTS DETAILS
                        </div>
                        <div class="tbl-header">
                          <table cellpadding="0" cellspacing="0" border="0">
                            <thead>
                              <tr>
                                <th>Student Id</th>
                                <th>Name</th>
                                <th>Password</th>
                                <th>Email</th>
                                <th>Mobile No.</th>
                                <th>City</th>
                              </tr>
                            </thead>
                          </table>
                        </div>
                         
                        <div  style="height:400px;" class="tbl-content">
        <%           
                        while(rs.next())
                        {
        %>
                            <table cellpadding="0" cellspacing="0" border="0">
                              <tbody>
                                <tr align="left">
                                  <td><%= rs.getInt("s_id") %></td>
                                  <td><%= rs.getString("name") %></td>
                                  <td><%= rs.getString("password") %></td>
                                  <td><%= rs.getString("email") %></td>
                                  <td><%= rs.getString("mobile") %></td>
                                  <td><%= rs.getString("city") %></td>
                                </tr>
                              </tbody>
                            </table>
        <%
                        }
        %>
                    </div>
                    </section>    
        <%
                }
                catch(SQLException ex)
                {
                    out.println(ex);
                }
        %>
    </body>
</html>
