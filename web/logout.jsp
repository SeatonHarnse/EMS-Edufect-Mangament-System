<%-- 
    Document   : logout
    Created on : Sep 28, 2018, 3:22:18 AM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <% 
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
