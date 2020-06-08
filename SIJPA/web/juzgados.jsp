<%-- 
    Document   : juzgados
    Created on : 20/09/2019, 10:55:04 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" Content="text/html; charset=UTF-8">
        <title>SIJPA::Juzgados</title>
        <%@include file="librerias.jsp" %>
        <% 
            showJuzgados sj = new showJuzgados();
            ArrayList<String[]> lista;
        %>
    </head>

    <body >
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>Órganos Jurisdiccionales</h1>
            <a href="capturaJuzgado.jsp" class="addJuz">
                <img src="img/add.png" title="Agregar Órgano"> Agregar Órgano
            </a>
            <table class="tablasRegis" id="tablaJuzgados" data-nomTabla="Juzgados">
                <thead>
                    <tr>
                        <th>Juzgado Clave</th>
                        <th>Nombre</th>
                        <th>Número</th>
                        <th>Jurisdicción</th>
                        <th>Entidad</th>
                        <th>Municipio</th>
                        <th>Estatus</th>
                        <th>Editar</th>
                        <th>Cmabiar Estatus</th>
                    </tr>
                </thead>
                <tbody>
                <% 
                    lista = sj.findJuzgadoTabla();
                    for (String[] lsj : lista) {
                        out.println("<tr>");
                        out.println("<td>" + lsj[0] + "</td>");
                        out.println("<td>" + lsj[1] + "</td>");
                        out.println("<td>" + lsj[2] + "</td>");
                        out.println("<td>" + lsj[3] + "</td>");
                        out.println("<td>" + lsj[4] + "</td>");
                        out.println("<td>" + lsj[5] + "</td>");
                        out.println("<td>" + lsj[6] + "</td>");
                        out.println("<td><a href='capturaJuzgado.jsp?claveJuz=" + lsj[0] + "' class='popJ'><img src='img/editar.png' title='Editar'/></a></td>");
                        out.println("<td><a href='#' class='estatus' id='borraJuzgado'><img src='img/delete.png' title='Eliminar'/></a></td>");
                        out.println("</tr>");
                    }
                %>
                </tbody>
            </table>
        </section>
    </body>
</html>
