<%-- 
    Document   : index
    Created on : 21 de mai. de 2021, 18:37:52
    Author     : usuário
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index - controle de login</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if(session.getAttribute("session.name") == null){%> 
        <p>você não tem autorização para acessar este sitema</p>
        <%} else{%> 
        <h1>inicio</h1>
        aloou
        <%}%>
        
        
    </body>
</html>
