<%-- 
    Document   : usuarios
    Created on : 21 de mai. de 2021, 22:38:53
    Author     : usuário
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("user.add") != null){
        String name = request.getParameter("user.name");
        String email = request.getParameter("user.email");
        String passwordHash = request.getParameter("user.password");
        User newUser = new User(name, email, passwordHash.hashCode());
        Database.addUsers(newUser);
        response.sendRedirect(request.getRequestURI());
    } else if(request.getParameter("remove") != null){
        String email = request.getParameter("user.email");
        Database.removeUsers(email);
        response.sendRedirect(request.getRequestURI());
    }
    ArrayList<User> users = Database.getUsers();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if(!"Administrador".equals(session.getAttribute("session.name"))){%> 
        <p>você não tem autorização para acessar este sitema</p>
        <%} else{%> 
        <form method="post">
            Nome:<input type="text" name="user.name" />
            Email:<input type="text" name="user.email" />
            Senha:<input type="password" name="user.password" />
            <input type="submit" name="user.add" value="Criar" />
            
        </form>
        <hr/>
        <table border = 1>
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Email</th>
                    <th></th>
                </tr>
            </thead>
            <%for(User user: users){%>
            <tbody>
                <tr>
                    <td><%= user.getName()%></td>
                    <td><%= user.getEmail()%></td>
                    <td><form>
                            <input type="hidden" name="user.email" value="<%= user.getEmail()%>" />
                            <button type="submit" name="remove">Excluir</button>
                        </form></td>
                </tr>
            </tbody>
            <%}%>
        </table>
        <%}%>
    </body>
</html>
