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
            //Control de Acertados o errores al insertar o actualizar registros
            if(request.getParameter("insert") != null){
                int integer = Integer.parseInt(request.getParameter("insert"));
                out.println("<script>$(document).ready(function () {");
                if(integer == 100){
                    out.println("alertify.alert('Confirmado','El Juzgado fue guardado correctamente', function(){"
                            + "alertify.success('Juzgado Guardado OK')});");
                }else if(integer == 101){
                    out.println("alertify.alert('Confirmado','El Juzgado fue actualizado correctamente', function(){"
                            + "alertify.success('Juzgado Actualizado OK')});");
                }else if(integer == 200){
                    out.println("alertify.alert('Error','El Juzgado no se pudo guardar', function(){"
                            + "alertify.error('Juzgado Sin Guardar')});");
                }else if(integer == 201){
                    out.println("alertify.alert('Error','El Juzgado no se pudo actualizar', function(){"
                            + "alertify.error('Juzgado Sin Actualizar')});");
                }
                out.println("});</script>");
            }
            
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
                        <th>Cambiar Estatus</th>
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
                        out.println("<td><a href='capturaJuzgado.jsp?claveJuzgado=" + lsj[0] + "'><img src='img/editar.png' title='Editar'/></a></td>");
                        out.println("<td><a href='#' class='estatus'><img src='img/update.png' title='Cambiar Estatus'/></a></td>");
                        out.println("</tr>");
                    }
                %>
                </tbody>
            </table>
        </section>
    </body>
</html>
