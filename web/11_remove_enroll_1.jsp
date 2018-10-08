<%-- 
    Document   : 11_remove_enroll_1
    Created on : Oct 4, 2018, 4:16:40 AM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Course Process</title>
    </head>
    <body>
        <%
            try
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String url = "jdbc:mysql://localhost:3306/ems";
                Connection conn = DriverManager.getConnection(url,"root","");
                    
                String enroll_id = request.getParameter("selectedQuery");

                String upQuery = "delete from CoursesEnrolled where en_id= ?";

                PreparedStatement pstmt = conn.prepareStatement(upQuery);

                pstmt.setString(1, enroll_id);

                int count = pstmt.executeUpdate();

                if( count != 0)
                {
                    response.sendRedirect("display_enroll.jsp");
                }
                else
                {
                    response.sendRedirect("zErrorPageSqlOperationFailure.html");
                }    
                        
                conn.close();
            }
            catch(SQLException ex)
            {
                out.println(ex);
            }
        %>
    </body>
</html>

