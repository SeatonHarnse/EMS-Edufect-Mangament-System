<%-- 
    Document   : 10_enroll_student
    Created on : Sep 30, 2018, 6:18:04 AM
    Author     : Seaton Harnse
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="NavBarCss.css" />
        <link rel="stylesheet" href="formCss.css" />
        
        <style>
            select {
                display: inline-block;
                border: none;
                text-align: left;
                box-shadow: 3px 2px rgba(121, 83, 210,.3 );
                padding: 10px;
                width: 370px;
                margin: 10px 0;
                background: transparent;
                color: #FFF;
                }

            select option {
                background-color: #000065;
            }

            select:focus{
                background: none;
                border: none;
                color: #FFF;
            }
        </style>
        <title>Enroll Student</title>
        
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
                   
        <form method="post" action="">
            <center><h2 style="color:white">Enroll Student</h2></center><br>
            <label> Student Name: </label> <br>
                <select name="stu_id" onchange="this.form.submit()" autofocus required > 
                    <option value="0"></option>
                     <%
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            String url = "jdbc:mysql://localhost:3306/ems";
                            Connection conn = DriverManager.getConnection(url,"root","");
                            
                            String Query = "select s_id, name from studentMaster";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(Query);
                            while(rs.next())
                            {
                                %>
                                    <option value="<%=rs.getInt("s_id")%>"

                                <%
                                       if(request.getParameter("stu_id") != null)
                                       {
                                           if(rs.getInt("s_id") == Integer.parseInt(request.getParameter("stu_id")))
                                           {
                                               out.println("selected");
                                           }
                                       }
                                       
                                %>

                                ><%=rs.getString("name")%></option>
                                
                                <%
                            }
                            conn.close();
                            rs.close();
                            
                        }
                        catch(SQLException ex)
                        {
                            out.println(ex);
                        }
                        
                        %>
                </select>
                <br>
            <label> Courses: </label> </br>
            
               <select name="cour_id" required>
                        <option value=""></option>
                        <%
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            String url = "jdbc:mysql://localhost:3306/ems";
                            Connection conn = DriverManager.getConnection(url,"root","");
               
                            String Query = "select c_id, name from courseMaster where c_id "
                                            + "NOT IN (select courseId from CoursesEnrolled "
                                            + "where studentId = ?)";
                            
                            PreparedStatement psmt = conn.prepareStatement(Query);
                            
                            psmt.setString(1, request.getParameter("stu_id"));
                            
                            ResultSet rs = psmt.executeQuery();
                            
                            while(rs.next())
                            {
                                %>
                                <option value="<%=rs.getString("c_id")%>"><%=rs.getString("name")%></option>
                                <%
                            }
                            conn.close();
                            rs.close();
                            
                        }
                        catch(SQLException ex)
                        {
                            out.println(ex);
                        }
                        
                        %>
                </select>
            <br>
            <label> Fees($): </label> </br>
            <input type="text" name="fs" required>
            <br>
            <button type="submit" formaction="10_enroll_student_1.jsp">Add</button>
        </form>
        
    </body>
</html>