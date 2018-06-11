<%-- 
    Document   : BGColor
    Created on : Jan 4, 2012, 9:22:06 AM
    Author     : solange
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- 
Example of a JSP scriptlet.
   
Taken from Core Servlets and JavaServer Pages 2nd Edition
from Prentice Hall and Sun Microsystems Press,
http://www.coreservlets.com/.
(C) 2003 Marty Hall; may be freely used or adapted.
-->
<HTML>
    <HEAD>
        <TITLE>Color Testing</TITLE>
    </HEAD>
    <%
        String bgColor = request.getParameter("bgColor");
        if ((bgColor == null) || (bgColor.trim().equals(""))) {
            bgColor = "WHITE";
        }
    %>
    <BODY BGCOLOR="<%= bgColor%>">
        <H2 ALIGN="CENTER">Testing a Background of "<%= bgColor%>"</H2>
    </BODY>
</HTML>
