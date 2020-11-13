<%-- 
    Document   : reportes
    Created on : 15/09/2020, 11:01:09 AM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>SIJPA::Reportes</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/fnReportes.js"></script>
        <%
            HttpSession sesion = request.getSession();
            
            catalogos cat = new catalogos();
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
            <h1>REPORTES</h1>
            <form action="exportaReportes" method="post" name="exportaReportes" id="exportaReportes">
                <%--//Si es un super administrador le mostramos el campos de Entidad para poder filtrarlo
                    if((Integer)sesion.getAttribute("tipoUsuario") <= 100){
                        out.println("<div class='cols'>");
                        out.println("<label for='entRepor'>Filtrar por Entidad (opcional)</label>");
                        out.println("<select name='entRepor' id='entRepor'>");
                        out.println("<option value=''>--Seleccione--</option>");
                        lista = cat.findEntidades();
                        for(String[] ls : lista){
                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".-" + ls[1] + "</option>");
                        }
                        out.println("</select>");
                        out.println("</div>");
                    }
                --%>
                <div class="cols">
                    <label for="sisRepor">Sistema a generar Reporte</label>
                    <select name="sisRepor" id="sisRepor" required>
                        <option value="">--Seleccione--</option>
                        <option value="1">Juzgado de Control</option>
                        <option value="2">Juicio Oral</option>
                    </select>
                </div>
                <div class="cols">
                    <label for="anioReporClave">Año del reporte</label>
                    <select name="anioReporClave" id="anioReporClave" required disabled>
                        <option value="">--Seleccione--</option>
                    </select>
                </div>
                <div class="cols">
                    <label for="juzReporClave">Filtrar por Juzgado (opcional)</label>
                    <select name="juzReporClave" id="juzReporClave" disabled>
                        <option value="">--Seleccione--</option>
                    </select>
                </div>
                <br>
                <input type="button" name="generaRepor" id="generaRepor" value="Generar">
                <p id="descSistema" style="font-weight: bold">Sistema: </p>
                <table class="tablasRegis" id="tblReportes">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Descripción Reporte</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <input type="submit" id="btnReporExcel" name="btnReporExcel" class="oculto" value="Excel">
            </form>
        </section>
    </body>
</html>
