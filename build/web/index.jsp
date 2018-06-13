<!--Reut Tzadok, David Wertenteil-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    if ((request.getParameter("loginform") != null)) {
        String email = request.getParameter("email");
        email = email.toLowerCase().trim();
        out.println("Checking login<br>");
        if (email == null) {
            out.print("Invalid paramters!");
        }

    } else {


%>
<!DOCTYPE html>
<HTML>
    <HEAD>
        <TITLE>Login</TITLE>
    </HEAD>

    <BODY>
        <H1>LOGIN</H1>
        <form action="Login" method="post">
            <input type="hidden" name="loginform" value="1"/>
            <table>
                <tr>
                    <td> Email: </td><td> <input name="email" size=15 type="text" required> </td> 
                </tr>
            </table>
            <input type="submit" value="login" />
        </form>
    </BODY>
</HTML>
<% }%>