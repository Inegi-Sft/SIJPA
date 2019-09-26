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
        <title>SIJPA::Expedientes</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <h1>Expedientes</h1>
            <form action="" method="post">
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
                    </tr>
              
                    <tr>
                        <td>
                            <label for="fIngreso">Fecha de ingreso</label>
                            <input type="date" name="fIngreso" id="fIngreso" class="txtMedia" required>
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
                                <%
                                    //conexion a base
                                %>
                            </select>
                        </td>
                       
                    </tr>             
                    <tr>
                        <td>
                            <label for="ExpAcomu" >Expediente acumulado</label>
                            <select name="ExpAcomu" id="ExpAcomu" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %>
                            </select>
                        </td>
                        <td>
                            <label for="ExpRefe">Expediente al que hace referencia</label>
                            <input type="text" name="ExpRefe" id="ExpRefe" required>
                        </td>
                        <td>
                            <label for="Tprocedi" >Tipo de procedimiento</label>
                            <select name="Tprocedi" id="Tprocedi" class="txtMedia" required>
                                <option value="0">--Seleccione--</option>
                                <%                                        
                                    //conexion a base
                                %>
                            </select>
                        </td>
                    </tr>
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
                    <tr>
                        <td colspan="3">
                            <label for="Pparticular" >¿La causa penal deriva de acción penal por particular?</label>
                            <select name="Pparticular" id="Pparticular" class="txtMedia">
                                <option value="0">--Seleccione--</option>
                                <%                                        
                                    //conexion a base
                                %>
                            </select>
                        </td>
                    </tr>
                </table>
                            
                <table class="tablasRegis" border="0">
                    <tr>
                    <th>ID</th><th>Tipo de audiencias</th><th>Aplica</th><th>Cantidad</th>
                    </tr>
                    <tr>
                        <td>1</td><td>Audiencia inicial </td><td> <select name="Aplaudi1" id="Aplica1" class="txtSelect">
                                <option value="0" >Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi1" id="Cantaudi1" ></td>
                    </tr>
                    <tr>
                        <td>2</td><td>Audiencia para solicitar orden de aprehensión</td><td><select name="Aplaudi2" id="Aplica2" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi2" id="Cantaudi2" ></td>
                    </tr>
                    <tr>
                        <td>3</td><td>Audiencia para solicitar orden de comparecencia </td><td><select name="Aplaudi3" id="Aplica3" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi3" id="Cantaudi3" ></td>
                    </tr>
                    <tr>
                        <td>4</td><td>Audiencia de sobreseimiento</td><td><select name="Aplica4" id="Aplaudi4" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi4" id="Cantaudi4" ></td>
                    </tr>
                    <tr>
                        <td>5</td><td>Audiencia de suspensión del proceso</td><td><select name="Aplica5" id="Aplaudi5" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi5" id="Cantaudi5" ></td>
                    </tr>
                    <tr>
                        <td>6</td><td>Audiencia de reapertura del proceso</td><td><select name="Aplica6" id="Aplaudi6" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi6" id="Cantaudi6" ></td>
                    </tr>
                    <tr>
                        <td>7</td><td>Audiencia de acumulación de procesos</td><td><select name="Aplica7" id="Aplaudi7" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi7" id="7" ></td>
                    </tr>
                    <tr>
                        <td>8</td><td>Audiencia de separación de procesos</td><td><select name="Aplica8" id="Aplaudi8" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi8" id="Cantaudi8" ></td>
                    </tr>
                    <tr>
                        <td>9</td><td>Audiencia de revisión de medidas cautelares</td><td><select name="Aplica9" id="Aplaudi9" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi9" id="Cantaudi9" ></td>
                    </tr>
                    <tr>
                        <td>10</td><td>Audiencia de solicitud de acuerdo reparatorio</td><td><select name="Aplica10" id="Aplaudi10" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi10" id="Cantaudi10" ></td>
                    </tr>
                    <tr>
                        <td>11</td><td>Audiencia de solicitud de suspensión condicional del proceso</td><td><select name="Aplaudi11" id="Aplica11" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi11" id="Cantaudi11" ></td>
                    </tr>
                    <tr>
                        <td>12</td><td>Audiencia de procedimiento abreviado</td><td><select name="Aplica12" id="Aplaudi12" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi12" id="Cantaudi12" ></td>
                    </tr>
                    <tr>
                        <td>13</td><td>Audiencia intermedia </td><td><select name="Aplica13" id="Aplaudi13" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi13" id="Cantaudi13" ></td>
                    </tr>
                    <tr>
                        <td>14</td><td>Otro tipo de audiencia </td><td><select name="Aplica14" id="Aplaudi14" class="txtSelect">
                                <option value="0">Seleccione</option>
                                <%                                        
                                    //conexion a base
                                %></td><td><input type="number" name="Cantaudi14" id="Cantaudi14" ></td>
                    </tr>
                    
                </table>
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
