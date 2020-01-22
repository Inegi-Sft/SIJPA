<%-- 
    Document   : usuario
    Created on : 17/01/2020, 03:12:05 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Usuarios</title>
        <%@include file="librerias.jsp"%>
        <%
            usuario usuario = new usuario();
            ArrayList<String[]> lista;
        %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>Usuarios</h1>
            <a href="capturaUsuario.jsp" class="addJuz">Agregar Usuario <img src="img/add.png" title="Agregar Usuario"></a>
            <table class="tablasRegis">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Edad</th>
                    <th>Correo/Usuario</th>
                    <th>Entidad</th>
                    <th>Nivel Usuario</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
                <% 
                    lista = usuario.findUsuarioTabla();
                    for (String[] lsj : lista) {
                        out.println("<tr>");
                        out.println("<td>" + lsj[0] + "</td>");
                        out.println("<td>" + lsj[1] + "</td>");
                        out.println("<td>" + lsj[2] + "</td>");
                        out.println("<td>" + lsj[3] + "</td>");
                        out.println("<td>" + lsj[4] + "</td>");
                        out.println("<td>" + lsj[5] + "</td>");
                        out.println("<td><a href='#' class='popJ'><img src='img/editar.png' title='Editar'/></a></td>");
                        out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar'/></a></td>");
                        out.println("</tr>");
                    }
                %>
            </table>
        </section>
    </body>
</html>
