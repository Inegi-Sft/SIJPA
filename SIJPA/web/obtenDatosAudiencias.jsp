<%-- 
    Document   : obtenDatosAudiencias
    Created on : 8/04/2020, 11:55:31 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.showAudiencias"%>

<%
    showAudiencias sa = new showAudiencias();
    ArrayList<String[]> lista;
    
    String juzgadoClave = null;
    
    

    if (request.getParameter("juzgadoClave") != null) {
        juzgadoClave = request.getParameter("juzgadoClave");
        
    
        lista = sa.findCausas(juzgadoClave);
        for (String[] ls : lista) {
            out.println("<option value='" + ls[0] + "'>" + ls[0] + "</option>");
        }
        
        lista = sa.findJueces(juzgadoClave);
        for (String[] ls : lista) {
            out.println("<input type='checkbox' value='" + ls[0] + "'>" + ls[1]+" "+ls[2]+" "+ls[3]+"<br>");
        }
        
        
    }
      
%>

