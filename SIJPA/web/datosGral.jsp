<%-- 
    Document   : datosGral
    Created on : 20/09/2019, 10:19:58 AM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="ConexionDB.Conexion_Mysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Datos Generales</title>
        <%@include file="librerias.jsp" %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
            <h1>Datos Generales</h1>
            <form action="" method="post">
                <table class="tablaFormu" border="0">
                    <tr>
                        <td>
                            <label for="seleccion">Ejercicio:</label>
                            <select name="seleccion" id="seleccion" class="txtMedia">
                                <option value="vacio">--Seleccionar--</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                            </select>
                        </td>
                        <td>
                            <label for="causasPena">Causas Penales:</label>
                            <input type="text" name="causasPena" id="causasPena" class="txtMedia" required>
                        </td>
                        <td>
                            <label for="mediProteccion">Medidas de Protección:</label>
                            <input type="text" name="mediProteccion" id="mediProteccion" class="txtMedia" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="providenPrecauto">Providencias Precautorias:</label>
                            <input type="text" name="providenPrecauto" id="providenPrecauto" class="txtMedia" required>
                        </td>
                        <td>
                            <label for="actosInvestiga">Prueba Anticipada:</label>
                            <input type="text" name="pruebaAnti" id="pruebaAnti" class="txtMedia" required>
                        </td>
                        <td>
                            <label for="actosInvestiga">Actos investigación con Autorizacion Previa:</label>
                            <input type="text" name="actosInvestiga" id="actosInvestiga" class="txtMedia" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="excusa">Excusas:</label>
                            <input type="text" name="excusa" id="excusa" class="txtMedia" required>
                        </td>
                        <td>
                            <label for="recusa">Recusación:</label>
                            <input type="text" name="recusa" id="recusa" class="txtMedia" required>
                        </td>
                        <td>
                            <label for="otras">Otras Cargas:</label>
                            <input type="text" name="otras" id="otras" class="txtMedia" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="causasPenaPend">Causas Penales Pendientes de Conclusión:</label>
                            <input type="text" name="causasPenaPend" id="causasPenaPend" class="txtMedia" required>
                        </td>
                        <td>
                            <label for="causasPenaBaja">Causas Penales Bajas de Sistema:</label>
                            <input type="text" name="causasPenaBaja" id="causasPenaBaja" class="txtMedia" required>
                        </td>
                        <td></td>
                    </tr>
                </table>
                <input type="submit" name="guardar" id="guardar" value="Guardar">
            </form>
        </section>
    </body>
</html>
