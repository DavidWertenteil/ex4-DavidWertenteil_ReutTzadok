<!--Reut Tzadok, David Wertenteil-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    if ((request.getParameter("loginform") != null)) {
        String email = request.getParameter("email");
        email = email.toLowerCase().trim();
        out.println("Checking login<br>");
        if (email == null) {
            out.print("Invalid paramters ");
        }

        // Here you put the check on the username and password
        //if (username.equals("a")) {
        out.println("Welcome " + email + " <a href=\"index.jsp\">Back to main</a>"
                + "<br/><a href=\"logout.jsp\">Logout</a>");
        session.setAttribute("email", email);
        //} else {
        //  session.setAttribute("errormsg", "Invalid username");
        ///  response.sendRedirect("index.jsp");
        //}

    } else {


%>
<!DOCTYPE html>
<html>
    <HTML>
        <HEAD>
            <TITLE>Login</TITLE>
        </HEAD>

        <BODY>
            <H1>LOGIN</H1>
                <%                    String myname = (String) session.getAttribute("email");
                    if (myname != null) {
                        out.println("Welcome  " + myname + "  , <a href=\"logout.jsp\" >Logout</a>");
                    } else {
                        String err = (String) session.getAttribute("errormsg");
                        if (err != null) {
                            out.println(err);
                            /* don't forget to erase the error (process it once!) */
                            session.setAttribute("errormsg", "");
                        }
                %>
            <form action="Login" method="get">
                <input type="hidden" name="loginform" value="1"/>
                <table>
                    <tr>
                        <td> Email  : </td><td> <input name="email" size=15 type="text" required> </td> 
                    </tr>
                </table>
                <input type="submit" value="login" />
            </form>
            <%
                }
            %>

        </BODY>
    </HTML>
    <% }%>