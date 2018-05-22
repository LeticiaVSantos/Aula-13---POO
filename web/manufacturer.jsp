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
        <title>Java DB WebApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <h1>Fornecedores</h1>
        
        <% 
            ArrayList<Manufacturer> list = null;
            try{
                list = SampleConnector.getManufacturer();
                
            }catch(Exception ex){
                out.print("<div>Erro: "+ex.getMessage()+"</div>");
            }
        
        %>
        
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Estado</th>
                <th>Cidade</th>
                
            </tr>
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
