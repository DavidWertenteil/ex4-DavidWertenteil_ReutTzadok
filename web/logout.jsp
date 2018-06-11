<%

    String username = (String) session.getAttribute("username");
    if (username != null) {
        session.removeAttribute("username");
        response.sendRedirect("index.jsp");

    } else {
        out.println("You are already not login <a href=\"index.jsp\">Back</a>");
    }


%> 