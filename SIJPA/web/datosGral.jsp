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
                <table class="tablaFormu" border="0">
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
                            <label for="causasPena">Causas Penales:</label>
                            <input type="text" name="causasPena" id="causasPena" placeholder="Causas Penales" required>
                        </td>
                        <td>
                            <label for="mediProteccion">Medidas de Protección:</label>
                            <input type="text" name="mediProteccion" id="mediProteccion" placeholder="Medidas Proteccion" required>
                        </td>
                        <td>
                            <label for="providenPrecauto">Providencias Precautorias:</label>
                            <input type="text" name="providenPrecauto" id="providenPrecauto" placeholder="Providencias Precautorias" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="actosInvestiga">Prueba Anticipada:</label>
                            <input type="text" name="pruebaAnti" id="pruebaAnti" placeholder="Prueba Anticipada" required>
                        </td>
                        <td>
                            <label for="actosInvestiga">Actos investigación con Autorizacion Previa:</label>
                            <input type="text" name="actosInvestiga" id="actosInvestiga" placeholder="Actos de Investigación Previa" required>
                        </td>
                        <td>
                            <label for="excusa">Excusas:</label>
                            <input type="text" name="excusa" id="excusa" placeholder="Excusa" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="recusa">Recusación:</label>
                            <input type="text" name="recusa" id="recusa" placeholder="Recusación" required>
                        </td>
                        <td>
                            <label for="otras">Otras Cargas:</label>
                            <input type="text" name="otras" id="otras" placeholder="Otras cargas de Trabajo" required>
                        </td>
                        <td>
                            <label for="causasPenaPend">Causas Penales Pendientes de Conclusión:</label>
                            <input type="text" name="causasPenaPend" id="causasPenaPend" placeholder="Causas Pendientes Concluir" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="causasPenaBaja">Causas Penales Bajas de Sistema:</label>
                            <input type="text" name="causasPenaBaja" id="causasPenaBaja" placeholder="Causas P. Bajas de Sistema" required>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
                <input type="submit" name="guardar" id="guardar" value="Guardar">
            </form>
        </section>
    </body>
</html>
