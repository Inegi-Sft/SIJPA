<%-- 
    Document   : jueces
    Created on : 25/11/2019, 04:30:59 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.showJueces"%>
<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" Content="text/html; charset=UTF-8">
        <title>SIJPA::Jueces</title>
        <%@include file="librerias.jsp" %>
        <% 
            //Control de Acertados o errores al insertar o actualizar registros
            if(request.getParameter("insert") != null){
                int integer = Integer.parseInt(request.getParameter("insert"));
                out.println("<script>$(document).ready(function () {");
                if(integer == 100){
                    out.println("alertify.alert('Confirmado','El Juez fue guardado correctamente', function(){"
                            + "alertify.success('Juez Guardado OK')});");
                }else if(integer == 101){
                    out.println("alertify.alert('Confirmado','El Juez fue actualizado correctamente', function(){"
                            + "alertify.success('Juez Actualizado OK')});");
                }else if(integer == 200){
                    out.println("alertify.alert('Error','El Juez no se pudo guardar', function(){"
                            + "alertify.error('Juez Sin Guardar')});");
                }else if(integer == 201){
                    out.println("alertify.alert('Error','El Juez no se pudo actualizar', function(){"
                            + "alertify.error('Juez Sin Actualizar')});");
                }
                out.println("});</script>");
            }
            
            //Controlamos el juzgado para que tenga siempre uno seleccionado
            String juzgado = "";
            if(request.getParameter("juzgado") != null){
                juzgado = request.getParameter("juzgado");
                session.setAttribute("juzgadoClave", juzgado);
            }else if(session.getAttribute("juzgadoClave") != null){
                juzgado = (String) session.getAttribute("juzgadoClave");
            }
            
            showJuzgados juz = new showJuzgados();
            showJueces sj = new showJueces();
            ArrayList<String> juzClave;
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
            <h1>Jueces del Órgano Jurisdiccional</h1>
            <form action="jueces.jsp" name="formJuez" method="post">
                <div id="jjc">
                    <label for="juzgado">Juzgado Clave:</label>
                    <select name="juzgado" id="juzgado" class="txtLong" onchange="formJuez.submit();">
                        <option value="">--Seleccione--</option>
                        <%
                            juzClave = juz.findJuzgados();
                            for (String ls : juzClave) {
                                out.println("<option value='" + ls + "'");
                                if(ls.equals(juzgado)){
                                    out.println(" selected ");
                                }
                                out.println( ">" + ls + "</option>");
                            }
                        %>
                    </select>
                    <span class="msjAviso" hidden>Selecciona el Juzgado al cual se le agregarán las Causas Penales</span>
                    <a href="#" onclick="validaAddJuez();"><img src="img/add.png" title="Agregar Juez"> Agregar Juez</a>
                </div>
            </form>
            <table class="tablasRegis" id="tablaJuez" data-nomTabla="Jueces">
                <tr>
                    <th>Juez ID</th>
                    <th>Nombre</th>
                    <th>Edad</th>
                    <th>Fecha Gestion</th>
                    <th>Estudios</th>
                    <th>Función</th>
                    <th>Estatus</th>
                    <th>Editar</th>
                    <th>Cambiar Estatus</th>
                </tr>
                <% 
                    lista = sj.findJuezTabla(juzgado);
                    for (String[] lsj : lista) {
                        out.println("<tr>");
                        out.println("<td>" + lsj[0] + "</td>");
                        out.println("<td>" + lsj[1] + "</td>");
                        out.println("<td>" + lsj[2] + "</td>");
                        out.println("<td>" + lsj[3] + "</td>");
                        out.println("<td>" + lsj[4] + "</td>");
                        out.println("<td>" + lsj[5] + "</td>");
                        out.println("<td>" + lsj[6] + "</td>");
                        out.println("<td><a href='capturaJuez.jsp?juezClave=" + lsj[0] + "'><img src='img/editar.png' title='Editar'/></a></td>");
                        out.println("<td><a href='#' class='estatus'><img src='img/update.png' title='Cambiar Estatus'/></a></td>");
                        out.println("</tr>");
                    }
                %>
            </table>
        </section>                       
    </body>
</html>
