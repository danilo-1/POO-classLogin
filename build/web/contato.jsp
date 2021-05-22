<%-- 
    Document   : contato
    Created on : 21 de mai. de 2021, 22:38:36
    Author     : usuário
--%>

<%@page import="java.util.ArrayList"%>
<%
    if(request.getParameter("user.add") != null){
        String name = request.getParameter("user.name");
        String emails = request.getParameter("user.emails");
        String num = request.getParameter("user.tel");
        Cont newCont = new Cont(name, num, emails);
        Database.addConts(newCont);
        response.sendRedirect(request.getRequestURI());
    } else if(request.getParameter("remove") != null){
        String emails = request.getParameter("user.emails");
        Database.removeConts(emails);
        response.sendRedirect(request.getRequestURI());
    }
    ArrayList<Cont> contatos = Database.getConts();
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if(session.getAttribute("session.name") == null){%> 
        <p>você não tem autorização para acessar este sitema</p>
        <%} else{%> 
         <form method="post">
            Nome:<input type="text" name="user.name" />
            Telefone:<input type="text" name="user.tel" />
            Email:<input type="text" name="user.emails" />
            <input type="submit" name="user.add" value="Criar" />
            
        </form>
         <hr/>
         <table border = 1>
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Telefone</th>
                    <th>Email</th>
                </tr>
            </thead>
            <%for(Cont contato: contatos){%>
            <tbody>
                <tr>
                    <td><%= contato.getName()%></td>
                    <td><%= contato.getNum()%></td>
                    <td><%= contato.getEmails()%></td>
                    <td><form>
                            <input type="hidden" name="user.emails" value="<%= contato.getEmails()%>" />
                            <button type="submit" name="remove">Excluir</button>
                        </form></td>
                </tr>
            </tbody>
            <%}%>
        </table>
        <%}%>
         <%@include file="WEB-INF/jspf/footer.jspf" %> 
    </body>
</html>
