<%-- 
    Document   : list
    Created on : Jun 11, 2018, 12:35:36 PM
    Author     : davidwer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List</title>
    </head>
    <body>
        <h1>List</h1>

        
        <jsp:useBean id="beansData" type="servlets.BeansData" scope="session" />
        <p> Hi <jsp:getProperty name="beansData" property="email" /> </p>

    </body>
</html>
