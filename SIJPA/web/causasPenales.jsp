<%-- 
    Document   : causasPenales
    Created on : 24/09/2019, 11:34:36 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.showJueces"%>
<%@page import="clasesAuxiliar.usuario"%>
<%@page import="clasesAuxiliar.showCausasPenales"%>
<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Causas Penales JC</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <%@include file="librerias.jsp" %>
        <%  
            showJuzgados juz = new showJuzgados();
            showJueces juez = new showJueces();
            showCausasPenales cp = new showCausasPenales();
            ArrayList<String[]> lsCausas;
            ArrayList<String> lista;
            
            String juzgado = "";
            if(request.getParameter("juzgado") != null){
                if(request.getParameter("juzgado") != ""){
                    juzgado=request.getParameter("juzgado");
                    session.setAttribute("juzgadoClave", juzgado);
                }
            }else if(session.getAttribute("juzgadoClave") != null){
                juzgado = (String) session.getAttribute("juzgadoClave");
            }
            
            if(juz.findTotJuzgado() == 0){
                response.sendRedirect("capturaJuzgado.jsp");
            }else if(session.getAttribute("juzgadoClave") != null){
                if(juez.findTotJuez((String)session.getAttribute("juzgadoClave")) == 0){
                    response.sendRedirect("capturaJuez.jsp");
                }
            }
            
            if(session.getAttribute("causaClave") != null){
                session.setAttribute("causaClave", "");
            }
            
            int tCausasJuz=cp.countCausasPenales(juzgado);
        %>
    </head>
    <body>
        <div class="load"></div>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>Causas Penales JC</h1>
            <form action="causasPenales.jsp" name="formCP" method="post">
                <div id="juzClave">
                    <label for="juzgado">Juzgado Clave:</label>
                    <select name="juzgado" id="juzgado" class="txtLong" onchange="formCP.submit();">
                        <option value="">--Seleccione--</option>
                        <%
                            lista = juz.findJuzgados();
                            for (String ls : lista) {
                                out.println("<option value='" + ls + "'");
                                if(ls.equals(juzgado)){
                                    out.println(" selected ");
                                }
                                out.println(">" + ls + "</option>");
                            }
                        %>
                    </select>
                </div>
                <span class="totExp">Total: <%=tCausasJuz%></span>
                <span class="msjAviso" hidden>Selecciona el Juzgado al cual se le agregarán las Causas Penales</span>
                <a class="add" href="#" onclick="validaAddCausa();">
                    <img src="img/add3.png" width="20" height="20"/> Agregar
                </a>
                <table id="causas" class="myTable">
                    <thead>
                        <tr>
                            <th>Posi</th>
                            <th>No. Asunto</th>
                            <th>Fecha Ingreso</th>
                            <th>Conductas Antisociales</th>
                            <th>Adolescentes</th>
                            <th>Victimas</th>
                            <th>Organo Competente</th>
                            <th>Inconsistencias</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        lsCausas = cp.findCausasPenales(juzgado);
                        String juzLimpio = "";
                        if(juzgado != null){
                            juzLimpio = juzgado.replace("-", "");
                        }
                        int pos = 0;
                        for (String[] ls : lsCausas) {
                            String ccSimple = ls[0].replace(juzLimpio, "");
                    %>
                        <tr>
                            <td><%=pos%></td>
                            <td><%=ccSimple%></td>
                            <td><%=ls[1]%></td>
                            <td><%=ls[2]%></td>
                            <td><%=ls[3]%></td>
                            <td><%=ls[4]%></td>
                            <td><%=ls[5]%></td>
                            <td>--</td>
                            <td><a href="elementosPrincipales.jsp?causaClave=<%=ccSimple%>"><img src='img/editar.png' title="Editar"/></a></td>
                            <td><a href="#"><img src='img/delete.png' title="Eliminar" onclick="borraRegistro(<%=ls[0]%>,<%=pos%>,'causas')"/></a></td>
                        </tr>
                    <% 
                            pos++;
                        }
                    %>
                    </tbody>
                </table>
            </form>
        </section>
    </body>
</html>
