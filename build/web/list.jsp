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
//    ArrayList<BeansData> users = new ArrayList<BeansData>();

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

    </head>
    <body onload="htmlPage()">
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
                <div>
                    <tbody id="list">

                        <% for (BeansData elem : users) {%>
                        <tr>
                            <th div class="col-md-5"> <%= elem.getEmail()%> </th>
                            <th div class="col-md-10"> <%
                                if (elem.getEmail().compareTo(userEmail) != 0 || request.getAttribute("edit") == null) {
                                    out.println(elem.getStatus());
                                } else {%>
                                <div class="container">
                                    <form class="form-horizontal" action="Save" method="get">
                                        <div class="form-group">
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" id="status" placeholder="<%=elem.getStatus()%>" autofocus="autofocus" name="status" required><br>
                                                <button type="submit" id="status" class="btn btn-success">Save</button>
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
                                <%  if (elem.getEmail().compareTo(userEmail) == 0) {
                                        if (request.getAttribute("edit") == null) {
                                %>
                                <a href="Edit" method="post" name="edit">  
                                    <button type="button" class="btn btn-default">Edit</button>
                                </a>   
                                <% } else {
                                    request.removeAttribute("edit");%>  
                                <%}
                                    }%>
                            </th>
                        </tr>
                        <%}%> <!-- end for -->

                    </tbody>
                </div>
            </table>
        </div>
        <div class="container">
            <a href="Logout" >  
                <button type="button" class="btn btn-primary">Logout</button>
            </a>
        </div>
        <script>
            $(document).ready(function () {
                var myVar;
                function myFunction() {
                    myVar = setInterval(getUpdate, 1000);
                }
                myFunction();
                function getUpdate() {


                    $.post("Update", function (dataInJson) {
//                        alert("Hello! I am an alert box!!");
                        $("#list").empty();
                        str = "<tbody id=list>";
                        console.log('success', dataInJson);
//                        $.each(dataInJson, function (index, elem) {
                        str += " <tr>";
                        str += "<th div class=col-md-5>";
//                            str += elem.email;
                        str += "elem.email";

                        str += "   </div> </th>";
                        str += " <th div class=col-md-10> ";
//                            if (elem.email.compareTo(userEmail) !== 0 || request.getAttribute("edit") === null) {
//                        str += elem.status;
//                            } else {
                        str += " <div class=container>";
                        str += " <form class=form - horizontal action=Save method=post>";
                        str += " <div class=form - group>";
                        str += " <div class=col - md - 10>";
                        str += " <input type=text class=form-control id=status placeholder=";
//                        str += elem.status;
                        str += " autofocus=autofocus name=status required><br>";
                        str += "  <button type=submit id=status class=btn btn-success>Save</button>";
                        str += "    </div>";
                        str += "    </div>";
                        str += "    </form>";
                        str += "    </div> ";
//                            }
                        str += "</th>";
                        str += "<th div class=col-md-2>";
//                            if (elem.state) {
                        str += "Connencted";
//                            } else {
//                                str += "Disconnencted";
//                            }
                        str += "</th>";
                        str += "<th div class=col-md-2 id=edit>";
//                            if (elem.email.compareTo(userEmail) === 0) {
//                                if (request.getAttribute("edit") === null) {
//
//                                    str += "  <a href=Update method=post name=edit>  ";
//                                    str += "   <button type=button class=btn btn-default>Edit</button>";
//                                    str += "      </a>   ";
//                                } else {
//                                    request.removeAttribute("edit");
//                                }
//                            }
                        str += "</th>";
                        str += "</tr>";
//                        });
                        str += " </tbody>";
                        $("#list").html(str);
                    });

                }

            });
        </script>
    </body>


</html>