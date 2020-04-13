<%-- 
    Document   : capturaJuez
    Created on : 27/11/2019, 10:05:45 AM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.showJueces"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Captura Juzgados</title>
        <%@include file="librerias.jsp"%>
        <% 
            if(request.getParameter("error") != null){
                int error = Integer.parseInt(request.getParameter("error"));
                if(error == 100){
                    out.println("<script>alert('Clave duplicada: El juez, distrito, entidad, municipio ya existe  verificar')</script>");
                }
            }
            
            showJueces ju = new showJueces();
            int totJuez = ju.findTotJuez((String) session.getAttribute("juzgadoClave"));
            
            catalogos cat = new catalogos();
            ArrayList<String[]> lista;
            
            int maxJu = 0;
        %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <% if(totJuez > 0){ %>
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <% } %>
            <h1>Captura Juez del Órgano</h1>
            <div class="pestana">
                <button class="pestanaLinks active" onclick="openPestana('btn1', 'p1')" id="btn1">Datos del Juez</button>
            </div>
            <form action="insrtJuez" method="post" name="formJuez">
                <!--Contenido pestañas--> 
                <div id="p1" class="pestanaContent" style="display: block">
                    <h2>Datos Generales del Juez</h2>
                    <table  class="tablaFormu">
                        <tr>
                            <td></td>
                            <td>
                                <label for="juzClaveJuez">Órgano Jurisdiccional</label>
                                <input type="text" name="juzClaveJuez" id="juzClaveJuez" value="${sessionScope.juzgadoClave}" disabled/>
                            </td>
                            <td>
                                <% 
                                    maxJu = ju.findMaxJuez((String) session.getAttribute("juzgadoClave")) + 1;
                                %>
                                <label for="juezID">Juez ID</label>
                                <input type="text" name="juezID" id="juezID" value="<%=maxJu%>" readonly/>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nombre">Nombre(s)</label>
                                <input type="text" name="nombre" id="nombre" required/>
                            </td>
                            <td>
                                <label for="apaterno">Apellido Paterno</label>
                                <input type="text" name="apaterno" id="apaterno" required/>
                            </td>
                            <td>
                                <label for="amaterno">Apellido Materno</label>
                                <input type="text" name="amaterno" id="amaterno" required/>
                            </td>
                            <td>
                                <label for="fGestion">Fecha inicio gestion:</label>
                                <input type="date" name="fGestion" id="fGestion" required/>
                                <div class="noIdentificada">
                                    <input type="checkbox" name="chkFechaInicioG" id="chkFechaInicioG" onclick="fechaNoIdent('#chkFechaInicioG', '#fGestion');"><label>No identificada</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="sexoJuez">Sexo</label>
                                <select name="sexoJuez" id="sexoJuez" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findSexo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="edadJuez">Edad</label>
                                <input type="number" class="txtSmall" name="edadJuez" id="edadJuez" min="18" required/>
                            </td>
                            <td>
                                <label for="estudioJuez">Grado de Estudios</label>
                                <select name="estudioJuez" id="estudioJuez" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findEstudioProfesional();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="funcionJuez">Función dentro del Órgano</label>
                                <select name="funcionJuez" id="funcionJuez" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findFuncionJuzgado();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <br>
                <input type="submit" name="guardar" id="guardar" value="Guardar">
            </form>
        </section>
    </body>
</html>
