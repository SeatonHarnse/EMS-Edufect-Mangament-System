<%-- 
    Document   : 2_displayHome
    Created on : Sep 27, 2018, 9:34:43 PM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Takes to home</title>
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("username");
            if(name == null)                            //if this page is run directly
            {
            response.sendRedirect("index.jsp");
            }
            if(name.equals("admin"))                   //takes to admin dashboard
            {
                response.sendRedirect("3_HomePage_admin.jsp");
            }
            else                                            //takes to student dashboard
            {
                response.sendRedirect("3_HomePage_student.jsp");
            }
        %>
    </body>
</html>
