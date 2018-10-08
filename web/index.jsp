<%-- 
    Document   : index
    Created on : Sep 27, 2018, 6:17:39 PM
    Author     : Seaton Harnse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="indexCss.css" />
        <title>EMS-HOME</title>
    </head>
    <body>
        
        <%! String str = ""; %>
        <%
            String msg = (String) session.getAttribute("message");
            if(msg == null)
                msg = "#Please Login#";
            /*
            else
                str = "Try again";
            */
            
            String user = (String) session.getAttribute("username");   //session check if exists
            
            if(user == null)
            {
        %>
            <div class="wrapper fadeInDown">
                <div id="formContent">
                    <h2><%= msg%> <br> <%=str %></h2>
                    <div class="fadeIn first">
                      <img src="image/edufect-icon.jpeg" id="icon" alt="User Icon" />
                    </div>

                    <!-- Login Form -->
                    <form method="post" action="1_session_setter_1.jsp">
                    <input type="text" id="login" class="fadeIn second" name="loginName" placeholder="login" required>
                    <input type="password" id="password" class="fadeIn third" name="loginPass" placeholder="password" required>
                    <input type="submit" class="fadeIn fourth" value="Log In">
                    </form>
                </div>
            </div>
        <%
            }
            else
            {
                response.sendRedirect("2_displayHome.jsp"); //redirects to same location: where data check goes to
            }
        %>
    </body>
</html>