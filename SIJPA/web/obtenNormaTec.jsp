<%-- 
    Document   : borrame
    Created on : 16/10/2019, 09:09:00 AM
    Author     : FERMIN.GOMEZ
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%
    catalogos cat = new catalogos();
    ArrayList<String[]> lista;
    int norma = 0;
    
    if (request.getParameter("norma") != null) {
        norma = Integer.parseInt(request.getParameter("norma"));
    }

    lista = cat.findDelitosNorma(norma);
    for (String[] ls : lista) {
        out.println("<option value='" + ls[0] + "'>" +ls[0] + ".- " + ls[1] + "</option>");
    }
%>