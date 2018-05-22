<%-- 
    Document   : manufacturer
    Created on : 22/05/2018, 15:57:31
    Author     : letic
--%>

<%@page import="br.com.fatecpg.db.SampleConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.fatecpg.db.Manufacturer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        
        <title>Java DB WebApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
    <br> <center><h1>Fornecedores</h1></center><br>
        
        <% 
            ArrayList<Manufacturer> list = null;
            try{
                list = SampleConnector.getManufacturer();
                
            }catch(Exception ex){
                out.print("<div>Erro: "+ex.getMessage()+"</div>");
            }
        
        %>
        
        <table class="table table-hover">
            <thead class="thead-light">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Estado</th>
                <th scope="col">Cidade</th>
                
            </tr>
            </thead>
            <%if(list!= null){%>
               <%for(Manufacturer m: list){ %>
                <tr>
                    
                   <td><%= m.getId() %></td>
                   <td><%= m.getName() %></td>
                   <td><%= m.getState() %></td>
                   <td><%= m.getCity() %></td>
                   
                </tr>
               <%}%>
            <%}%>
        </table>
        
    </body>
</html>
