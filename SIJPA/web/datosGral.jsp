<%-- 
    Document   : datosGral
    Created on : 20/09/2019, 10:19:58 AM
    Author     : CARLOS.SANCHEZG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Datos Generales</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <h1>Datos Generales</h1>
            <form action="" method="post">
                <table class="tablaFormu">
                    <tr>
                        <td></td>
                        <td>
                            <label for="seleccion">Ejercicio:</label>
                            <select name="seleccion" id="seleccion">
                                <option value="vacio">--Seleccionar--</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="causasPena" id="causasPena" placeholder="Causas Penales">
                        </td>
                        <td>
                            <input type="text" name="mediProteccion" id="mediProteccion" placeholder="Medidas Proteccion">
                        </td>
                        <td>
                            <input type="text" name="providenPrecauto" id="providenPrecauto" placeholder="Providencias Precautorias">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="actosInvestiga" id="actosInvestiga" placeholder="Actos de Investigación Previa">
                        </td>
                        <td>
                            <input type="text" name="excusa" id="excusa" placeholder="Excusa">
                        </td>
                        <td>
                            <input type="text" name="recursa" id="recursa" placeholder="Recursación">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="otras" id="otras" placeholder="Otras cargas de Trabajo">
                        </td>
                        <td>
                            <input type="text" name="causasPenaPend" id="causasPenaPend" placeholder="Causas Pendientes Concluir">
                        </td>
                        <td>
                            <input type="text" name="causasPenaPend" id="causasPenaPend" placeholder="Causas P. Pendientes Concluir">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" name="causasPenaBaja" id="causasPenaBaja" placeholder="Causas P. Bajas de Sistema"></td>
                        <td></td>
                    </tr>
                </table>
                <input type="submit" name="guardar" id="guardar" value="Guardar">
            </form>
        </section>
    </body>
</html>
