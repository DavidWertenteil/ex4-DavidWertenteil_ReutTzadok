<%-- 
    Document   : list
    Created on : Jun 11, 2018, 12:35:36 PM
    Author     : davidwer, reutbar
--%>

<%@page import="java.util.ArrayList"
        import="servlets.BeansData"
        import="javax.servlet.http.HttpSession"
        contentType="text/html" pageEncoding="UTF-8"%>
<%
    ServletContext context = getServletContext();
    ArrayList<BeansData> users = (ArrayList<BeansData>) context.getAttribute("users");
    String userEmail = (String) session.getAttribute("userEmail");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>List</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $(window).beforeunload(function () {
            <%
//                for (BeansData temp : users) {
//                    if (temp.getEmail().compareTo(userEmail) == 0) {
//                        temp.setState(false);
//                        break;
//                    }
//                }
            %>
                });
            });
        </script>
    </head>
    <body>
        <br>
        <br>
        <div class="container">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th div class="col-md-5">Email</th>
                        <th div class="col-md-10">Status</th>
                        <th div class="col-md-2">State</th>
                        <th div class="col-md-2">Edit</th>
                    </tr>
                </thead>

                <tbody>

                    <% for (BeansData elem : users) {%>
                    <tr>
                        <th div class="col-md-5"> <%= elem.getEmail()%> </th>
                        <th div class="col-md-10"> <% if (request.getAttribute("edit") == null
                                    || !(Boolean) request.getAttribute("edit")) {
                                out.println(elem.getStatus());
                            } else { %>
                            <div class="container">
                                <form class="form-horizontal" action="Save" method="post" name="form">
                                    <div class="form-group">
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" id="edit" placeholder="Enter your status:" autofocus="autofocus" name="edit" required>
                                        </div>
                                    </div>
                                </form>
                            </div> 
                            <%}%> </th>
                        <th div class="col-md-2"> <%if (elem.getState()) {
                                out.println("Connencted");
                            } else {
                                out.println("Disconnencted");
                            }%> </th>
                        <th div class="col-md-2" id="edit" >
                            <%  if (elem.getEmail().compareTo(userEmail) == 0) {%>
                            <a action="Edit" method="post">
                                <button type="button" class="btn btn-default" >Edit</button>
                            </a>
                            <%   } %>
                        </th>
                    </tr>
                    <%}%> <!-- end for -->
                </tbody>
            </table>
        </div>
        <div class="container">
            <a href="Logout" >  
                <button type="button" class="btn btn-primary">Logout</button>
            </a>
        </div>
    </body>

</html>