<%

    String username = (String) session.getAttribute("email");
    
    if (username != null) {
        session.removeAttribute("email");
        response.sendRedirect("index.jsp");

    } else {
        out.println("You were not logedin <a href=\"index.jsp\">Back</a>");
    }


%> 