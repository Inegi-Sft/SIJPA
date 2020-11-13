<%-- 
    Document   : exportarBD
    Created on : 7/09/2020, 05:15:00 PM
    Author     : JONATHAN.AGUIRRE
--%>
<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Exporta BD</title>
        <%@include file="librerias.jsp" %>
    </head>
    <body>
        <div class="load"></div>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>EXPORTACIÓN DE BASE DE DATOS SIJPA</h1><br>
            <!--<h2>Caracteristicas Exportación</h2>-->
            <form action="exportaBD" method="post">
                <table  class="tablaFormu">
                    <tr>
                        <td>
                            <label for="nombreArchivo">Nombre del Archivo:</label>
                            <input type="text" name="nombreArchivo" id="nombreArchivo" maxlength="25" required/>
                        </td>
                        <td>
                            <label for="nombreArchivo">Entidad Federativa:</label>
                            <%      
                                ArrayList<String[]> lista;
                                showJuzgados sj = new showJuzgados();
                                out.println("<select name='entidad' id='entidad' required>");
                                lista = sj.findEntidadExport();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                                out.println("</select>");
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan = "2">
                            <label for="tipoArchivo">Tipo de Archivo:</label>
                            <select name="tipoArchivo" id="tipoArchivo">
                                <option value="sijpa">Archivo SIJPA (.sijpa)</option>
                                <option value="excel">Archivo Excel (.xlsx)</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <br/>
                <input type="submit" name="exportaBD" id="exportaBD" value="Exportar">
            </form>
        </section>
    </body>
</html>
