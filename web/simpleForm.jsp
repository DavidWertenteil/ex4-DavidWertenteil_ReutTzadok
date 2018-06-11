<%-- 
    Document   : printParam
    Created on : May 25, 2018, 2:42:30 PM
    Author     : solangekarsenty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <H2>JSP Expressions</H2>
<% if (request.getParameter("testParam") == null) { %>
        <form action="simpleForm.jsp">
            testParam <input type="text" name="testParam">
            <input type="submit">
        </form>
<% } else {%>
        <UL>
            <LI>Current time: <%= new java.util.Date()%>
            <LI>Your hostname: <%= request.getRemoteHost()%>
            <LI>Your session ID: <%= session.getId()%>
            <LI>The <CODE>testParam</CODE>
                form parameter:
                <%= request.getParameter("testParam")%>
        </UL>
<% }%>

    </body>
</html>
