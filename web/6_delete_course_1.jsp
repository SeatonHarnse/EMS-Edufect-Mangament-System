<%-- 
    Document   : 6_delete_course_1
    Created on : Sep 29, 2018, 5:49:14 AM
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
            Connection conn = null;
            String url = "jdbc:mysql://localhost:3306/";
            String dbName = "ems";
            String driver = "com.mysql.jdbc.Driver";
            String userName = "root";
            String password = "";
            try {
                    Class.forName(driver).newInstance();
                    conn = DriverManager.getConnection(url+dbName,userName,password);
                    
                    String course_id = request.getParameter("selectedQuery");
                    
                    String upQuery = "delete from coursemaster where c_id= ?";
                    
                    PreparedStatement pstmt = conn.prepareStatement(upQuery);
                    
                    pstmt.setString(1, course_id);
                    
                    int count = pstmt.executeUpdate();
                    
                    if( count != 0)
                    {
                        response.sendRedirect("display_course.jsp");
                    }
                    else
                    {
                        response.sendRedirect("zErrorPageSqlOperationFailure.html");
                    }    
                }
                catch(SQLException ex)
                {
                    response.sendRedirect("zErrorPage.html");
                }
            conn.close();
        %>
    </body>
</html>

