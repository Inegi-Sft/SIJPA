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
            String juzgado = "";
            if(request.getParameter("juzgado") != null){
                juzgado=request.getParameter("juzgado");
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
            
            <table class="tablasRegis">
                <tr>
                    <th>Juez ID</th>
                    <th>Nombre</th>
                    <th>Edad</th>
                    <th>Fecha Gestion</th>
                    <th>Función</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
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
                        out.println("<td><a href='capturaJuez.jsp?juezClave=" + lsj[0] + "' class='popJ'><img src='img/editar.png' title='Editar'/></a></td>");
                        out.println("<td><a href='#'><img src='img/delete.png' title='Eliminar'/></a></td>");
                        out.println("</tr>");
                    }
                %>
            </table>
        </section>                       
    </body>
</html>
