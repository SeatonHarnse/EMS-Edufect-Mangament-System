<%-- 
    Document   : 12_fees_1
    Created on : Oct 5, 2018, 4:22:54 AM
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
         <link rel="stylesheet" href="formPayFeesBoxCss.css" />
        <title>ShowFees</title>
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
                    PreparedStatement pstmt = null;
                    String std_id = null;
                    
                    String stdntid = (String) session.getAttribute("stdntid");  //looping
                    
                    if(stdntid == null)
                    {
                        std_id = request.getParameter("stu_id");
                    }
                    else
                    {
                        std_id = stdntid;
                    }
                    session.setAttribute("stu_id", std_id);         //for next page to identify student
        
                    String selQuery = "select "
                                    + "courseMaster.name "
                                    + "from coursesEnrolled "
                                    + "left join "
                                    + "studentMaster ON studentMaster.s_id = coursesEnrolled.studentId "
                                    + "left join "
                                    + "courseMaster ON courseMaster.c_id = coursesEnrolled.courseId "
                                    + "where coursesEnrolled.studentId = ? "
                                    + "ORDER BY courseMaster.name";
                    //for all courses name, a student enrolled
                                    
                    pstmt = conn.prepareStatement(selQuery);
                    pstmt.setString(1, std_id);
                    ResultSet rs1 = pstmt.executeQuery();

                    selQuery = "select studentMaster.name, sum(fees) as totalFees "
                            + "from coursesEnrolled "
                            + "inner join "
                            + "studentMaster ON studentMaster.s_id = coursesEnrolled.studentId "
                            + "where studentId = ?";
                    pstmt = conn.prepareStatement(selQuery);
                    pstmt.setString(1, std_id);
                    ResultSet rs2 = pstmt.executeQuery();
                    rs2.next();
                    int totalFees = rs2.getInt(2);
                    
                    selQuery = "select amount "
                            + "from studentMaster "
                            + "inner join "
                            + "feesPaid on feesPaid.studentid = studentMaster.s_Id "
                            + "where studentMaster.s_Id = ?";
                    pstmt = conn.prepareStatement(selQuery);
                    pstmt.setString(1, std_id);
                    ResultSet rs3 = pstmt.executeQuery();
                    int amount = 0;
                    if(rs3.next() != false)
                        amount = rs3.getInt("amount");
                        
        %>
                    <section>
                        <div class="long-block">   
                            FEES DETAILS
                        </div>
                        <div class="tbl-header">
                          
                        </div>
                        
                        <div  style="height:400px;" class="tbl-content">           
                            <table cellpadding="0" cellspacing="0" border="0">
                              <tr>
                                <th style="text-align:left; padding-left: 200px;">Student Name</th>
                                <td style="text-align:left;"><%= rs2.getString("name") %></td>
                              </tr>
                              <tr>
                                <th style="text-align:left; padding-left: 200px;">Course(s) Name</th>
                                <td style="text-align:left;">
        <%   
                                while(rs1.next())
                                {
        %>
                                <%= rs1.getString(1)%> &nbsp;&nbsp;&verbar; &nbsp;&nbsp;
        <%                      
                                }
        %>
                                </td>  
                              </tr>
                              <tr>
                                <th style="text-align:left; padding-left: 200px;">Total Fees</th>
                                <td style="text-align:left;"><%=totalFees%></td>
                              </tr>
                              <tr>
                                <th style="text-align:left; padding-left: 200px;">Fees Paid</th>
                                <td style="text-align:left;"><%=amount%></td>
                              </tr>
                              <tr>
                                <th style="text-align:left; padding-left: 200px;">Fees Payable</th>
        <%                      
                                int payableFees = totalFees - amount;
        %>                      
                                 <td style="text-align:left;"><%=payableFees%></td>
                              </tr>
                    
                          </table>
                               <div style="text-align:center;">
                                   <form action="12_fees_2.jsp" method="POST">
                                        <input id="id1" type="number" name="payfees" min="0" max="<%=payableFees%>"  
                                               title="Enter fees amount($)" autocomplete=off
                                               placeholder="Enter fees amount($)" autofocus required/>
                                        <button class="button2" type="submit" oninput="myFunction()">Pay Fees</button>
                                    </form>
                                </div>  
                        </div>
                            
                    </section>    
        <%
                    conn.close();
                    rs1.close();
                    rs2.close();
                    rs3.close();
                }
                catch(SQLException ex)
                {
                    out.println(ex);
                }
        %>
    </body>
</html>


