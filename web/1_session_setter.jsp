<%-- 
    Document   : 1_session_setter
    Created on : Sep 27, 2018, 6:33:15 PM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Data Check</title>
    </head>
    <body>
        <%
            String lName = (String) session.getAttribute("loginName");
            String lPass = (String) session.getAttribute("loginPass");
         
            if(lName.equals("admin"))
            {
                 if(lPass.equals("admin123"))
                 {
                    session.setAttribute("username", lName);        //setting session for student
                    response.sendRedirect("2_displayHome.jsp");
                 }
                 else
                 {
                    String pmm = "#Password Mismatched#";
                    session.setAttribute("message", pmm);                  
                    response.sendRedirect("index.jsp");
                 }
            }
        %>
        
    </body>
</html>