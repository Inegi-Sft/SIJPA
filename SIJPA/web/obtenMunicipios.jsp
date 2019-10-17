<%-- 
    Document   : obtenMunicipios
    Created on : 11/10/2019, 11:17:17 AM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%
    catalogos cat = new catalogos();
    ArrayList<String[]> lista;
    int enti = 0;

    if (request.getParameter("enti") != null) {
        enti = Integer.parseInt(request.getParameter("enti"));
        out.println("<option value=''>--Seleccione--</option>");
    }

    lista = cat.findMunicipios(enti);
    for (String[] ls : lista) {
        out.println("<option value='" + ls[0] + "'>" + ls[1] + "</option>");
    }
%>
