<%-- 
    Document   : importarBD
    Created on : 8/09/2020, 12:16:00 PM
    Author     : JONATHAN.AGUIRRE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Importa BD</title>       
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesManipulaBase.js"></script>
    </head>
    <body>
        <div class="load"></div>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>IMPORTACIÓN DE BASE DE DATOS SIJPA</h1><br>
            <form id="formImport" method="post" enctype="multipart/form-data"> 
                <table class="tablaFormu">
                    <tr>
                    <%
                        if((Integer)session.getAttribute("tipoUsuario") > 3){
                            out.println("<td>");
                            out.println("<label for='operacion'>Operación:</label>");
                            out.println("<select name='tipo_operacion' id='tipo_operacion'>");
                            out.println("<option value='importar'>Importar archivo SIJPA</option>");
                            out.println("<option value='ver'>Ver archivo SIJPA</option>");
                            out.println("</select>");
                            out.println("</td>");
                            out.println("<td>");
                            out.println("<label for='tipoArchivo'>Tipo de Archivo</label>");
                            out.println("<select name='tipoArchivo' id='tipoArchivo'>");
                            out.println("<option value='sijpa'>SIJPA(.sijpa)</option>");
                            out.println("</select>");
                            out.println("</td>");
                        }else{
                            out.println("<td>");
                            out.println("<label for='operacion'>Operación:</label>");
                            out.println("<select name='tipo_operacion' id='tipo_operacion' disabled>");
                            out.println("<option value='importar'>Importar archivo SIJPA</option>");
                            out.println("</select>");
                            out.println("</td>");
                            out.println("<td>");
                            out.println("<label for='tipoArchivo'>Tipo de Archivo</label>");
                            out.println("<select name='tipoArchivo' id='tipoArchivo' disabled>");
                            out.println("<option value='sijpa'>SIJPA(.sijpa)</option>");
                            out.println("</select>");
                            out.println("</td>");
                        }
                    %>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="archivos">Seleccionar Archivos</label>
                            <input type="file" name="archivos" id="archivos" required/>
                        </td>
                    </tr>
                </table>
                <br/>
                <input type="submit" name="importaBD" id="importaBD" value="Importar">
            </form>
        </section>
    </body>
</html>
