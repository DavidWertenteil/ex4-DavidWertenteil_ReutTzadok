<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

if ((request.getParameter("loginform")!= null) ) { %>
    <jsp:forward page="processrequest.jsp" />
    
<% } else { %>
<!DOCTYPE html>
<html>
<HTML>
    <HEAD>
        <TITLE>Login using jsp</TITLE>
    </HEAD>

    <BODY>
        <H1>LOGIN FORM</H1>
            <form action="forward.jsp" method="post">
                <input type="hidden" name="loginform" value="1"/>
                <table>
                    <tr>
                        <td> Username  : </td><td> <input name="username" size=15 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Password  : </td><td> <input name="password" size=15 type="text" /> </td> 
                    </tr>
                </table>
                <input type="submit" value="login" />
            </form>
        
    </BODY>
</HTML>
<% } %>
