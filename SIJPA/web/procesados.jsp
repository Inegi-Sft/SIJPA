<%-- 
    Document   : procesados
    Created on : 26/09/2019, 09:04:33 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Procesados</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="cabecera.jsp" %>
        <section class="contenedor">
            <h1>Procesados</h1>
            <form action="#" method="post">
                <fieldset>
                    <legend>Situación jurídica del adolescente: </legend>
                    <table class="tablaFormu" border="0">
                        <tr>
                            <td>
                                <label for="presentacionAdo">Tipo presentacion adolescente</label>
                                <select name="presentacionAdo" id="presentacionAdo" required>
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="tipoDetencion">Tipo de detencion</label>
                                <select name="tipoDetencion" id="tipoDetencion" required>
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="imputable">Imputabilidad</label>
                                <select name="imputable" id="imputable" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="participacion">Grado de participacion</label>
                                <select name="participacion" id="participacion" >
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="reincidencia">Condicion de reincidencia</label>
                                <select name="reincidencia" id="reincidencia">
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="psicofisico">Estado psicofisico al momento de cometer la conducta</label>
                                <select name="psicofisico" id="psicofisico">
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="interprete">¿Requirió traductor y/o intérprete?</label>
                                <select name="interprete" id="interprete">
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="defensor">Tipo de defensor</label>
                                <select name="defensor" id="defensor">
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="representante">Tipo de representante legal</label>
                                <select name="representante" id="representante">
                                    <option value="0">--Seleccione--</option>
                                    <% //conexion a base
                                    %>
                                </select>
                            </td>
                            <td colspan="3">
                                <label>Delitos atribuidos al adolescente</label>
                                <table border="1">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Conducta antisocial</th>
                                            <th>No. Victimas</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                            //conexion a bd
                                        %>
                                        <tr>
                                            <td>000/2019-d1</td>
                                            <td>Algo</td>
                                            <td>
                                                <select name="noVict" id="noVict">
                                                    <option value="0">0</option>
                                                    <% //conexion a base
                                                    %>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>000/2019-d2</td>
                                            <td>Algo</td>
                                            <td>
                                                <select name="noVict" id="noVict">
                                                    <option value="0">0</option>
                                                    <% //conexion a base
                                                    %>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset>
                    <legend>Características sociodemográficas </legend>
                    <table>
                        <tr>
                            <td>
                                <label for="nombre">Nombre(s)</label>
                                <input type="text" name="nombre" id="nombre" required/>
                            </td>
                            <td>
                                <label for="apaterno">Apellido Paterno</label>
                                <input type="text" name="apaterno" id="apaterno" />
                            </td>
                            <td>
                                <label for="amaterno">Apellido Materno</label>
                                <input type="text" name="amaterno" id="amaterno" />
                            </td>
                            <td>
                                <label for="curp">Curp</label>
                                <input type="text" name="curp" id="curp" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="sexo">Sexo</label>
                                <select name="sexo" id="sexo" required>
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="edad">Edad</label>
                                <input type="number" class="txtSmall" name="edad" id="edad" />
                            </td>
                            <td>
                                <label for="fNacimiento">Fecha nacimiento</label>
                                <input type="date" class="txtMedia" name="fNacimiento" id="fNacimiento" />
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nPais">Pais</label>
                                <select name="nPais" id="nPais">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="nEntidad">Entidad</label>
                                <select name="nEntidad" id="nEntidad">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="nMunicipio">Municipio o Demarcacion Territorial</label>
                                <select name="nMunicipio" id="nMunicipio">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="nacionalidad">Nacionalidad</label>
                                <select name="nacionalidad" id="nacionalidad">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="residencia">Lugar de residencia</label>
                                <select name="residencia" id="residencia">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="rEntidad">Entidad</label>
                                <select name="rEntidad" id="rEntidad">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="rMunicipio">Municipio</label>
                                <select name="rMunicipio" id="rMunicipio">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="edoCivil">Situación conyugal</label>
                                <select name="edoCivil" id="edoCivil">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="discapacidad">¿Tiene alguna discapacidad?</label>
                                <select name="discapacidad" id="discapacidad">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select> 
                            </td>
                            <td>
                                <label for="alfabet">Condicion alfabetismo</label>
                                <select name="alfabet" id="alfabet">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="estudios">Grado de Estudios</label>
                                <select name="estudios" id="estudios">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="condiEstudiante">Condición de estudiante</label>
                                <select name="condiEstudiante" id="condiEstudiante">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="hablaEsp">Dominio del español</label>
                                <select name="hablaEsp" id="hablaEsp">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="poblaIndigena">¿Pertenece a alguna población indígena?</label>
                                <select name="poblaIndigena" id="poblaIndigena">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="puebloIndigena">Tipo de pueblo indígena</label>
                                <select name="puebloIndigena" id="puebloIndigena">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="hablaIndigena">¿Habla lengua indígena o dialecto?</label>
                                <select name="hablaIndigena" id="hablaIndigena">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="lenguaIndigena">Familia lingüística</label>
                                <select name="lenguaIndigena" id="lenguaIndigena">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="ocupacion">Ocupación</label>
                                <select name="ocupacion" id="ocupacion">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="condicionActi">Condicion de Actividad</label>
                                <select name="condicionActi" id="condicionActi">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                               <label for="comentarios">Comentarios:</label>
                               <textarea name="comentarios" id="comentarios"></textarea>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br/>
                <input type="submit" name="guardar" value="Guardar"/>
            </form>
        </section>
    </body>
</html>
