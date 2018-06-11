<% 
    /* this page processes the form and generates the response to the user */
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    out.println("Checking login<br>");
    if (username == null || password == null) {
        out.print("Invalid paramters ");
    }

    // Here you put the check on the username and password
    if (username.toLowerCase().trim().equals("admin") && password.toLowerCase().trim().equals("admin")) {
        out.println("Welcome " + username + " <a href=\"forward.jsp\">Back to main</a>");
    } else {
        response.sendRedirect("forward.jsp");
    }
%>