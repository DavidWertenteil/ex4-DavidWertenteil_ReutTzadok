<%-- 
    Document   : list
    Created on : Jun 11, 2018, 12:35:36 PM
    Author     : davidwer, reutbar
--%>
<%@page import="java.util.ArrayList"
        import="servlets.BeansData"%>
<%

    if (session.getAttribute("userEmail") != null) {
        ServletContext context = getServletContext();
        ArrayList<BeansData> users = (ArrayList<BeansData>) context.getAttribute("users");
        String user = (String) session.getAttribute("userEmail");
        for (BeansData temp : users) {
            if (temp.getEmail().compareTo(user) == 0) {
                temp.setState(false);
                break;
            }
        }
        session.removeAttribute("userEmail");
        response.sendRedirect("index.jsp");

    } else {
        out.println("You were not logedin <a href=\"index.jsp\">Back</a>");
    }
%> 