<%-- 
    Document   : customers
    Created on : 22/05/2018, 14:12:07
    Author     : leticia
--%>

<%@page import="br.com.fatecpg.db.Customer"%>
<%@page import="br.com.fatecpg.db.SampleConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        
        <title>JavaDB WebApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <br> <center><h1>Todos os Clientes</h1></center><br>
        
        <% 
            ArrayList<Customer> list = null;
            try{
                list = SampleConnector.getCustomers();
                
            }catch(Exception ex){
                out.print("<div>Erro: "+ex.getMessage()+"</div>");
            }
        
        %>
        
        <table class="table table-hover">
            <thead class="thead-light">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Limite de crédito</th>
            </tr>
            </thead>
            <%if(list!= null){%>
               <%for(Customer c: list){ %>
                <tr>
                    
                   <td><%= c.getId() %></td>
                   <td><%= c.getName() %></td>
                   <td><%= c.getCreditLimit() %></td>

                </tr>
               <%}%>
            <%}%>
        </table>
    </body>
</html>
