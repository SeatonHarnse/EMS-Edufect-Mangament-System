<%-- 
    Document   : 1_session_setter_1
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
            String lName = request.getParameter("loginName");
            String lPass = request.getParameter("loginPass");
            if(lName.equals("admin"))
            {   
                session.setAttribute("loginName", lName);   //to send the from values to thirdJsp
                session.setAttribute("loginPass", lPass);   //to send the from values to thirdJsp
                response.sendRedirect("1_session_setter.jsp");
            }
            else
            {
                try
                {
                     Class.forName("com.mysql.jdbc.Driver").newInstance();
                     String url = "jdbc:mysql://localhost:3306/ems";
                     Connection conn = DriverManager.getConnection(url,"root","");

                     String Query = "select * from studentMaster where name=? and password=?";;

                     PreparedStatement pstmt = conn.prepareStatement(Query);

                     pstmt.setString(1,lName);
                     pstmt.setString(2,lPass);

                     ResultSet theResult = pstmt.executeQuery();

                     if(theResult.next())
                     {
                         session.setAttribute("username", lName);     //setting session for student
                         response.sendRedirect("2_displayHome.jsp");
                     }
                     else
                     {
                         String unf = "#UserNotFound#";
                         session.setAttribute("message", unf);                  
                         response.sendRedirect("index.jsp");
                     }
                 }
                 catch(SQLException ex)
                 {
                     out.println(ex);
                 }  
            }
         %>
    </body>
</html>          
        
        
        
        
        
        
        
        
        
        
        
        
        
                if(rs.next() == true)       //isResultSetEmpty()
                {
                    int pwd = rs.getInt("password");
                    String dataBasePwd = "" + pwd;

                    if(dataBasePwd.equals(lPass))
                    {
                        
                    }
                    else
                    {
                        String passMisMatch = "#Password Mismatched#";
                        session.setAttribute("message", passMisMatch);                  
                        response.sendRedirect("index.jsp");
                    }
                }
                else   //false ->  resultSet is emplty
                {
                    String invalid = "#Invalid User#";
                    session.setAttribute("message", invalid);         
                    response.sendRedirect("index.jsp");
                }
                conn.close();
                rs.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();    
            }
        