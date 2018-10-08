<%-- 
    Document   : 8_modify_student_2
    Created on : Sep 29, 2018, 5:58:11 PM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Student Process</title>
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
                    
                    String st_id = request.getParameter("stu_id");
                    
                    String st_name = request.getParameter("stu_name");
                    String st_pass = request.getParameter("stu_pass");
                    String st_email = request.getParameter("stu_email");
                    String st_mobile = request.getParameter("stu_mobile");
                    String st_city = request.getParameter("stu_city");
                    
                    String upQuery = 
                    "update studentMaster set name=?, password=?, email=?, mobile=?, city=? where s_id= ?";
                    
                    PreparedStatement pstmt = conn.prepareStatement(upQuery);
                    
                    pstmt.setString(1, st_name);
                    pstmt.setString(2, st_pass);
                    pstmt.setString(3, st_email);
                    pstmt.setString(4, st_mobile);
                    pstmt.setString(5, st_city);
                    
                    pstmt.setString(6, st_id);
                    
                    int count = pstmt.executeUpdate();
                    
                    if( count != 0)
                    {
                        response.sendRedirect("display_student.jsp");
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