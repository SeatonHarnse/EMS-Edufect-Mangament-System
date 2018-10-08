<%-- 
    Document   : 12_fees
    Created on : Oct 5, 2018, 2:16:10 AM
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
        <title>Fees Form</title>
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
            
        <form method="post" action="12_fees_1.jsp">
            <center><h2 style="color:white">Student Fees Details</h2></center><br><br>
            <label> Student Name: </label> <br>
                <select name="stu_id" autofocus required > 
                    <option value="0"></option>
                    <%
                        try
                        {
                            request.getSession().removeAttribute("stdntid"); //smart move for third page
                            
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            String url = "jdbc:mysql://localhost:3306/ems";
                            Connection conn = DriverManager.getConnection(url,"root","");
                            
                            String selQuery = "select studentId, name "
                                    + "from coursesEnrolled "
                                    + "left join "
                                    + "studentMaster ON studentMaster.s_id = coursesEnrolled.studentId "
                                    + "GROUP BY name";
                            
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(selQuery);
                                    
                            while(rs.next())
                            {
                                %>
                                <option value="<%=rs.getInt("studentId")%>"><%=rs.getString("name")%></option>
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
            <button type="submit" >Get Details</button>
        </form>
    </body>
</html>
