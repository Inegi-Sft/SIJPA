<%-- 
    Document   : audiencias
    Created on : 3/04/2020, 09:34:31 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.showAudiencias"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Audiencias</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/fnAudiencias.js"></script>
        <%  
            showAudiencias sa = new showAudiencias();
            ArrayList<String[]> lista;
            
            String juzgado = "";
            if(request.getParameter("juzgado") != null){
                if(request.getParameter("juzgado") != ""){
                    juzgado=request.getParameter("juzgado");
                    session.setAttribute("juzgadoClaveAudi", juzgado);
                }
            }else if(session.getAttribute("juzgadoClaveAudi") != null){
                juzgado = (String) session.getAttribute("juzgadoClaveAudi");
            }
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
            <h1>Audiencias</h1>
            <form action="audiencias.jsp" name="formAudiencias" method="post">
                <div id="juzClave">
                    <label for="juzgado">Juzgado Clave:</label>
                    <select name="juzgado" id="juzgado" class="txtLong" onchange="formAudiencias.submit();">
                        <option value="">--Seleccione--</option>
                        <%
                            lista = sa.findJuzgados();
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "'");
                                if(ls[0].equals(juzgado)){
                                    out.println(" selected ");
                                }
                                out.println(">" + ls[0] + "</option>");
                            }
                        %>
                    </select>
                </div>
                <span class="msjAviso" hidden>Selecciona el Juzgado para agregar las audiencias</span>
                <a class="add" href="#" onclick="validaAddAudiencias();">
                    <img src="img/add3.png" width="20" height="20"/> Agregar 
                </a>
                <table id="causas" class="myTable" >
                    <thead>
                        <tr>
                            <th>Causa Penal</th>
                            <th>Juez 1</th>
                            <th>Juez 2</th>
                            <th>Juez 3</th>
                            <th width="80">Investigacion</th>
                            <th width="80">Intermedia</th>
                            <th width="40">Editar</th>
                            <th width="40">Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        lista = sa.findAllCausaAudiencias(juzgado);
                        String juzLimpio = "";
                        if(juzgado != null){
                            juzLimpio = juzgado.replace("-", "");
                        }
                        for (String[] ls : lista) {
                            String causa = ls[0].replace(juzLimpio, "");
                    %>
                        <tr>
                            <td><%=causa%></td>
                            <td><%=ls[1]%></td>
                            <td><%=ls[2]%></td>
                            <td><%=ls[3]%></td>
                            <td><%=ls[4]%></td>
                            <td><%=ls[5]%></td>
                            <td><a href="capturaAudiencias.jsp?causaClave=<%=ls[0]%>"><img src='img/editar.png' title="Editar"/></a></td>
                            <td><a href="#"><img src='img/delete.png' title="Eliminar" onclick="deleteAudiencias('<%=ls[0]%>');"/></a></td>
                        </tr>
                    <% 
                        }
                    %>
                    </tbody>
                </table>
                </div>
            </form>
        </section>
    </body>
</html>
