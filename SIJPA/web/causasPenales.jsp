<%-- 
    Document   : causasPenales
    Created on : 24/09/2019, 11:34:36 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.showCausasPenales"%>
<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Causas Penales</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <%@include file="librerias.jsp" %>
        <%
            String juzgado=request.getParameter("juzgado");
            
            showJuzgados juz = new showJuzgados();
            showCausasPenales cp = new showCausasPenales();
            
            ArrayList<String[]> lsCausas = new ArrayList();
            ArrayList<String> lista;
            
            int totCausas=cp.countTotalCausas();
            int tCausasJuz=cp.countTotalCausasPorJuzgado(juzgado);
           
//            request.getAttribute("juzgadoClave")
        %>
    </head>
    <body>
        <div class="load"></div>
        <%@include file="cabecera.jsp" %>
        <%@include file="menu.jsp"%>
        
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>Causas Penales</h1>
            <form action="elementosPrincipales.jsp" name="formEnviaJuz" method="post">
                <input type="hidden" name="juzgado" value="<%=juzgado%>" />
            </form>
            <form action="causasPenales.jsp" name="formCP" method="post">
                <div id="juzClave">
                    <label for="juzgado">Juzgado Clave:</label>
                    <select name="juzgado" id="juzgado" class="txtLong" id="juzgado" onchange="formCP.submit();">
                        <option value="">--Seleccione--</option>
                        <%
                            lista = juz.findJuzgados();
                            for (String ls : lista) {
                                out.println("<option value='" + ls + "'");
                                if(ls.equals(juzgado)){
                                    out.println(" selected ");
                                }
                                out.println( ">" + ls + "</option>");
                            }
                        %>
                    </select>
                </div>
                <span class="totExp">Total de Causas:<%=totCausas%></span>
                <span class="totExp">Causas de este Juzgado:<%=tCausasJuz%></span>
                <span class="msjAviso" hidden>Selecciona el Juzgado al cual se le agregarán las Causas Penales</span>
                <a class="add" href="#" onclick="validaAddCausa();"><img src="img/add3.png" width="20" height="20" /> Agregar Expediente</a>
                <table id="causas" class="myTable">
                    <thead>
                        <tr>
                            <th>Expediente</th>
                            <th>Tipo de Procedimiento</th>
                            <th>Adolescentes</th>
                            <th>Victimas</th>
                            <th>Conductas Antisociales</th>
                            <th>Organo Competente</th>
                            <th>Fecha Ingreso</th>
                            <th>Inconsistencias</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                    lsCausas = cp.findCausasPorJuzgado(juzgado);
                    for (String[] ls : lsCausas) {
                %>
                        <tr>
                            <td><%=ls[0]%></td>
                            <td><%=ls[1]%></td>
                            <td><%=ls[2]%></td>
                            <td><%=ls[3]%></td>
                            <td><%=ls[4]%></td>
                            <td><%=ls[5]%></td>
                            <td><%=ls[6]%></td>
                            <td>--</td>
                            <td><a href="elementosPrincipales.jsp"><img src='img/editar.png' title="Editar"/></a></td>
                            <td><a href="#"><img src='img/delete.png' title="Eliminar"/></a></td>
                        </tr>
                <% 
                    }
                %>
                    </tbody>
                </table>
            </form>
        </section>
    </body>
</html>
