<%-- 
    Document   : 13_student_profile
    Created on : Oct 7, 2018, 5:35:24 PM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="NavBarCss.css"/>
        <link rel="stylesheet" href="table.css"/>
        <title>StudentProfile</title>
    </head>
    <body>
        <body>
        <div id="nav1">
            <ul>
                <li class="active"><a href="index.jsp"><b>Home</b></a></li>
                <li><a href="13_student_profile.jsp"><b>Profile</b></a></li>
                <li style="float:right"><a href="logout.jsp"><b>Logout</b></a></li>
            </ul>
        </div>
        <%
                String std_name = (String) session.getAttribute("username");
                try
                {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    String url = "jdbc:mysql://localhost:3306/ems";
                    Connection conn = DriverManager.getConnection(url,"root","");
                    PreparedStatement pstmt = null;
                            
                    String selQuery = "select "
                                    + "courseMaster.name "
                                    + "from coursesEnrolled "
                                    + "left join "
                                    + "studentMaster ON studentMaster.s_id = coursesEnrolled.studentId "
                                    + "left join "
                                    + "courseMaster ON courseMaster.c_id = coursesEnrolled.courseId "
                                    + "where studentMaster.name = ? "  //Column 'name' ambiguous
                                    + "ORDER BY name";
                    pstmt = conn.prepareStatement(selQuery);
                    pstmt.setString(1, std_name);
                    ResultSet rs1 = pstmt.executeQuery();

                    selQuery = "select studentMaster.name, sum(fees) as totalFees "
                            + "from coursesEnrolled "
                            + "inner join "
                            + "studentMaster ON studentMaster.s_id = coursesEnrolled.studentId "
                            + "where name = ?";
                    pstmt = conn.prepareStatement(selQuery);
                    pstmt.setString(1, std_name);
                    ResultSet rs2 = pstmt.executeQuery();
                    rs2.next();
                    int totalFees = rs2.getInt(2);
                    
                    selQuery = "select amount "
                            + "from studentMaster "
                            + "inner join "
                            + "feesPaid on feesPaid.studentid = studentMaster.s_Id "
                            + "where name = ?";
                    pstmt = conn.prepareStatement(selQuery);
                    pstmt.setString(1, std_name);
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
