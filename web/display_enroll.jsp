<%-- 
    Document   : display_enroll
    Created on : Oct 4, 2018, 3:02:16 AM
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
        <title>Show Enrollments</title>
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
                try
                {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    String url = "jdbc:mysql://localhost:3306/ems";
                    Connection conn = DriverManager.getConnection(url,"root","");
                    
                    Statement st = conn.createStatement();
                    String selQuery =    "select en_id, fees, studentMaster.s_id, studentMaster.name, courseMaster.name "
                                       + "from coursesEnrolled "
                                       + "left join "
                                       + "studentMaster ON studentMaster.s_id = coursesEnrolled.studentId "
                                       + "left join courseMaster ON courseMaster.c_id = coursesEnrolled.courseId "
                                       + "ORDER BY studentMaster.name, courseMaster.name";

                    ResultSet rs = st.executeQuery(selQuery);
        %>
                     <section>
                        <div class="long-block">   
                            All ENROLLMENTS DETAILS
                        </div>
                        <div class="tbl-header">
                          <table cellpadding="0" cellspacing="0" border="0">
                            <thead>
                              <tr>
                                <th>Student Id</th>
                                <th>Student Name</th>
                                <th>Course </th>
                                <th>Fees</th>
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
                                <tr>
                                  <td><%= rs.getInt("studentMaster.s_id") %></td>
                                  <td><%= rs.getString("studentMaster.name") %></td>
                                  <td><%= rs.getString("courseMaster.name") %></td>
                                  <td><%= rs.getInt("fees") %></td>
                                </tr>
                              </tbody>
                            </table>
        <%
                        }
        %>
                    </div>
                    </section>    
        <%
                    conn.close();
                    rs.close();
                }
                catch(SQLException ex)
                {
                    out.println(ex);
                }
        %>
    </body>
</html>
