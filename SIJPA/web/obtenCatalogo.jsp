<%-- 
    Document   : obtenCatalogo
    Created on : 29/11/2019, 01:04:55 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.showJueces"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%
    catalogos cat = new catalogos();
    showJueces ju = new showJueces();
    ArrayList<String[]> lista;
    String catalogo = "";
    
    catalogo = request.getParameter("cat");
    out.println("<option value=''>--Seleccione--</option>");
    
    System.out.println("Variable recibida: " + catalogo);
    if (catalogo.equals("tipoAudi")) {
        lista = cat.findTipoAudiencias();
        for (String[] ls : lista) {
            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
        }
    }else if(catalogo.equals("jueces")){
        lista = ju.findJuez(request.getParameter("juzClave"));
        for (String[] ls : lista) {
            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
        }
    }
%>
