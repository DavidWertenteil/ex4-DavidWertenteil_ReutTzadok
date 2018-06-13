<%-- 
    Document   : list
    Created on : Jun 11, 2018, 12:35:36 PM
    Author     : davidwer, reutbar
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="servlets.BeansData"%>
<%
    ServletContext context = getServletContext();
    ArrayList<BeansData> users = (ArrayList<BeansData>) context.getAttribute("users");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List</title>
    </head>
    <body>
        <h1>List</h1>

        <% for (BeansData elem : users) {%>
        <%= elem.getEmail()%> <br>
        <%= elem.getStatus()%><br>
        <%= elem.getState()%><br>
        <% }%>
    </body>
</html>
