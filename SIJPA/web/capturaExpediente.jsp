<%-- 
    Document   : captura_expediente
    Created on : 24/09/2019, 09:42:00 AM
    Author     : CESAR.OSORIO
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Captura Expediente</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/pestanas.js"></script>
    </head>
    <body>
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor" style="zoom: .9;">
            <h1>Expediente</h1>
            <form action="" method="post">
                <fieldset>
                    <legend>Características del expediente de la causa penal</legend>
                    <table class="tablaFormu" border="0">
                        <tr>
                            <td>
                                <label for="jClave">Juzgado Clave:</label>
                                <input type="text" name="jClave" id="jClave" required>
                            </td>
                            <td>
                                <label for="CarpInves">No. Carpeta Investigación</label>
                                <input type="text" name="CarpInves" id="CarpInves" required>
                            </td>
                            <td>
                                <label for="expClave">Expediente Clave</label>
                                <input type="text" name="expClave" id="expClave" required>
                            </td>
                            <td>
                                <label for="fIngreso">Fecha de ingreso</label>
                                <input type="date" name="fIngreso" id="fIngreso" class="txtMedia" required>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label for="Pparticular" >¿La causa penal deriva de acción penal por particular?</label>
                                <select name="Pparticular" id="Pparticular" class="txtMedia">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="compe">Organo Competente</label>
                                <select name="compe" id="compe" class="txtSelect">
                                    <option value="0">Seleccione</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="Tincompe">Tipo de incompetencia</label>
                                <select name="Tincompe" id="Tincompe" class="txtMedia">
                                    <option value="0">--Seleccione--</option>
                                    <%                                    //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="ExpAcomu" >Expediente acumulado</label>
                                <select name="ExpAcomu" id="ExpAcomu" class="txtSelect">
                                    <option value="0">Seleccione</option>
                                    <%                                    //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>             
                        <tr>
                            <td>
                                <label for="ExpRefe">Expediente al que hace referencia</label>
                                <input type="text" name="ExpRefe" id="ExpRefe" required>
                            </td>
                            <td>
                                <label for="Tprocedi" >Tipo de procedimiento</label>
                                <select name="Tprocedi" id="Tprocedi" class="txtMedia" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                    //conexion a base
                                    %>
                                </select>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Contenidos del expediente de la causa penal</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="Tdelitos">Total de delitos</label>
                                <input type="number" name="Tdelitos" id="Tdelitos" required>
                            </td>
                            <td>
                                <label for="Tadolescentes">Total de adolescentes</label>
                                <input type="number" name="Tadolescentes" id="Tadolescentes" required>
                            </td>
                            <td>
                                <label for="Tvictimas">Total de víctimas</label>
                                <input type="number" name="Tvictimas" id="Tvictimas" required>
                            </td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Audiencias</legend>
                    <table class="tablasRegis" border="0">
                        <tr>
                            <th width="50">ID</th><th>Tipo de audiencias</th><th width="100">Aplica Si/No</th><th width="100">Cantidad</th>
                        </tr>
                        <tr>
                            <td>1</td><td>Audiencia inicial </td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi1"/> </td><td><input type="number" name="Cantaudi1" id="Cantaudi1" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>2</td><td>Audiencia para solicitar orden de aprehensión</td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi2"/> </td><td><input type="number" name="Cantaudi2" id="Cantaudi2" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>3</td><td>Audiencia para solicitar orden de comparecencia </td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi3"/> </td><td><input type="number" name="Cantaudi3" id="Cantaudi3" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>4</td><td>Audiencia de sobreseimiento</td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi4"/> </td><td><input type="number" name="Cantaudi4" id="Cantaudi4" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>5</td><td>Audiencia de suspensión del proceso</td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi5"/> 
                            </td><td><input type="number" name="Cantaudi5" id="Cantaudi5" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>6</td><td>Audiencia de reapertura del proceso</td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi6"/> </td><td><input type="number" name="Cantaudi6" id="Cantaudi6" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>7</td><td>Audiencia de acumulación de procesos</td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi7"/> </td><td><input type="number" name="Cantaudi7" id="7" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>8</td><td>Audiencia de separación de procesos</td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi8"/> </td><td><input type="number" name="Cantaudi8" id="Cantaudi8" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>9</td><td>Audiencia de revisión de medidas cautelares</td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi9"/> </td><td><input type="number" name="Cantaudi9" id="Cantaudi9" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>10</td><td>Audiencia de solicitud de acuerdo reparatorio</td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi10"/> </td><td><input type="number" name="Cantaudi10" id="Cantaudi10" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>11</td><td>Audiencia de solicitud de suspensión condicional del proceso</td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi11"/> </td><td><input type="number" name="Cantaudi11" id="Cantaudi11" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>12</td><td>Audiencia de procedimiento abreviado</td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi12"/> </td><td><input type="number" name="Cantaudi12" id="Cantaudi12" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>13</td><td>Audiencia intermedia </td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi13"/> </td><td><input type="number" name="Cantaudi13" id="Cantaudi13" class="txtSmall"></td>
                        </tr>
                        <tr>
                            <td>14</td><td>Otro tipo de audiencia </td><td>
                                <input class="chkAplica" type="checkbox" name="aplAudi" id="aplAudi14"/> </td><td><input type="number" name="Cantaudi14" id="Cantaudi14" class="txtSmall"></td>
                        </tr>
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="ComentaExpe" id="ComentaExpe"></textarea>
                </div>
                <br>
                <input type="submit" name="guardar" id="guardar" value="Guardar">
            </form>
        </section>
    </body>
</html>
