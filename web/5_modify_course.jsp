<%-- 
    Document   : 5_modify_course
    Created on : Sep 28, 2018, 5:05:15 AM
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
        <script type="text/javascript" src="table.js"></script>
     
        <title>Modify course</title>
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
            try {
                    Class.forName(driver).newInstance();
                    conn = DriverManager.getConnection(url+dbName,userName,password);
                    
                    String selQuery = "select * from CourseMaster";
                    
                    PreparedStatement pstmt = conn.prepareStatement(selQuery);
                    
                    ResultSet rs = pstmt.executeQuery(selQuery);
                    
        %>
                <form method="post" action="5_modify_course_1.jsp">
                    <section>
                        <div class="long-block">   
                            MODIFY COURSE DETAILS
                        </div>
                        <div class="tbl-header">
                          <table cellpadding="0" cellspacing="0" border="0">
                            <thead>
                              <tr>
                                <th>Course Id</th>
                                <th>Name</th>
                                <th>Duration</th>
                                <th>Technology</th>
                                <th>Select</th>
                              </tr>
                            </thead>
                          </table>
                        </div>
                        
                        <div class="tbl-content">
        <%           
                        while(rs.next())
                        {
        %>
                            <table cellpadding="0" cellspacing="0" border="0">
                              <tbody>
                                <tr>
                                  <td><%= rs.getInt("c_id") %></td>
                                  <td><%= rs.getString("name") %></td>
                                  <td><%= rs.getString("duration") %></td>
                                  <td><%= rs.getString("technology") %></td>
                                  <td><input class="selQuery" type="radio" 
                                             name="selectedQuery" 
                                             onclick="show2();"
                                             value="<%= rs.getInt("c_id")%>">
                                  </td>
                                </tr>
                              </tbody>
                            </table>
        <%
                        }
        %>                      
                    </div>
                        <div id="divbutton" class="hide">   
                            <button class="button" type="submit">Modify</button>
                        </div>
                    </section>    
                </form>
        <%
                }
                catch(SQLException ex)
                {
                    out.println(ex);
                }
        %>
    </body>
</html>
