<%-- 
    Document   : 12_fees_2.jsp
    Created on : Oct 7, 2018, 3:49:23 PM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fees Update</title>
    </head>
    <body>
        <%
        try
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String url = "jdbc:mysql://localhost:3306/ems";
                Connection conn = DriverManager.getConnection(url,"root","");
                PreparedStatement pstmt = null;
                int count = 0;
                String stdent_id = (String) session.getAttribute("stu_id");
                
                String feeAmount = request.getParameter("payfees");
                
                String searchStu = "select studentId from feesPaid where studentId=?";
                pstmt = conn.prepareStatement(searchStu);
                
                pstmt.setString(1, stdent_id);
                
                ResultSet rs = pstmt.executeQuery();
                
            
                if(rs.next() == false)
                {   
                
                    String insQuery = "insert into feesPaid(studentid, amount) values(?,?)";
                    pstmt = conn.prepareStatement(insQuery);
                    pstmt.setString(1, stdent_id);
                    pstmt.setString(2, feeAmount);
                    
                    count = pstmt.executeUpdate();
                }
                else
                {
                    String updQuery = "update feesPaid set amount=amount+ ? where studentId=?";
                    pstmt = conn.prepareStatement(updQuery);
                    pstmt.setString(1, feeAmount);
                    pstmt.setString(2, stdent_id);

                    count = pstmt.executeUpdate();
                }
                
                if(count != 0)
                {
                    session.setAttribute("stdntid", stdent_id);
                    response.sendRedirect("12_fees_1.jsp");
                    
                }
                else
                {
                    response.sendRedirect("zErrorPageSqlOperationFailure.html");
                }    
                
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
