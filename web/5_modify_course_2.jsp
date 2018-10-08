<%-- 
    Document   : 5_modify_course_2
    Created on : Sep 29, 2018, 4:14:27 AM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Course Process</title>
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
                    
                    String cr_id = request.getParameter("crs_id");
                    String cr_name = request.getParameter("crs_name");
                    String cr_drs = request.getParameter("crs_drs");
                    String cr_tech = request.getParameter("crs_tech");
                    
                    String upQuery = "update coursemaster set name=?, duration=?, technology=? where c_id= ?";
                    
                    PreparedStatement pstmt = conn.prepareStatement(upQuery);
                    
                    pstmt.setString(1, cr_name);
                    pstmt.setString(2, cr_drs);
                    pstmt.setString(3, cr_tech);
                    pstmt.setString(4, cr_id);
                    
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
                    out.println(ex);
                }
            conn.close();
        %>
    </body>
</html>
