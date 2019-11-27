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
            if(request.getParameter("errorJuzgado") != null){
                out.println("<script>alert('Clave duplicada: El juzgado, distrito, entidad, municipio ya existe  verificar')</script>");
            }else if(request.getParameter("errorInforme") != null){
                out.println("<script>alert('Lo datos de datos generales no se puede insertar verificar')</script>");
            }
            
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
            <a href="capturaJuzgado.jsp" class="addJuz">Agregar Juzgado <img src="img/add.png" title="Agregar Juzgado"></a>
            <table class="tablasRegis">
                <tr>
                    <th>Juzgado Clave</th>
                    <th>Nombre</th>
                    <th>Nombre Juez</th>
                    <th>Entidad</th>
                    <th>Municipio</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
                <% 
                    showJuzgados sj = new showJuzgados();
                    lista = sj.findjuzgadoTabla();
                    for (String[] lsj : lista) {
                        out.println("<tr>");
                        out.println("<td>" + lsj[0] + "</td>");
                        out.println("<td>" + lsj[1] + "</td>");
                        out.println("<td>" + lsj[2] + "</td>");
                        out.println("<td>" + lsj[3] + "</td>");
                        out.println("<td>" + lsj[4] + "</td>");
                        out.println("<td><a href='#' class='popJ'><img src='img/editar.png' title='Editar'/></a></td>");
                        out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar'/></a></td>");
                        out.println("</tr>");
                    }
                %>
            </table>
        </section>                       
    </body>
</html>
