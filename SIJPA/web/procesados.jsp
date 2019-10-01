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
                                <select class="selPro"  name="presentacionAdo" id="presentacionAdo" required>
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="tipoDetencion">Tipo de detencion</label>
                                <select class="selPro" name="tipoDetencion" id="tipoDetencion" required>
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="imputable">Imputabilidad</label>
                                <select class="selPro" name="imputable" id="imputable" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="participacion">Grado de participacion</label>
                                <select class="selPro" name="participacion" id="participacion" >
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="reincidencia">Condicion de reincidencia</label>
                                <select class="selPro" name="reincidencia" id="reincidencia">
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="psicofisico">Estado psicofisico al momento de cometer la conducta</label>
                                <select class="selPro" name="psicofisico" id="psicofisico">
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="interprete">¿Requirió traductor y/o intérprete?</label>
                                <select class="selPro" name="interprete" id="interprete">
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="defensor">Tipo de defensor</label>
                                <select class="selPro" name="defensor" id="defensor">
                                    <option value="0">--Seleccione--</option>
                                    <%                                //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="representante">Tipo de representante legal</label>
                                <select class="selPro" name="representante" id="representante">
                                    <option value="0">--Seleccione--</option>
                                    <% //conexion a base
                                    %>
                                </select>
                            </td>
                            <td colspan="3" align="center">
                                <label class="lblColor">Delitos atribuidos al adolescente</label>
                                <table class="tblDelitos">
                                    <tr>
                                        <th width="150">Id</th>
                                        <th width="400">Conducta antisocial</th>
                                        <th width="120">No. Victimas</th>
                                    </tr>
                                    <%                                            //conexion a bd
                                    %>
                                    <tr>
                                        <td >000/2019-d1</td>
                                        <td >Algoa asdf as df asd fasd fas dfasdfasdfasdf as fdsa</td>
                                        <td >
                                            <select name="noVict" id="noVict">
                                                <option value="0">0</option>
                                                <option value="0">12</option>
                                                <option value="0">24</option>
                                                <% //conexion a base
                                                %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>004000/2019-d2</td>
                                        <td>Algo</td>
                                        <td>
                                            <select name="noVict" id="noVict">
                                                <option value="0">0</option>
                                                <% //conexion a base
                                                %>
                                            </select>
                                        </td>
                                    </tr>
                                </table>         
                            </td>
                        </tr>
                    </table>
                </fieldset><br>
                <fieldset>
                    <legend>Características sociodemográficas </legend>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Nombre del adolescente</legend>
                                    <div class="cols">
                                        <label for="nombre">Nombre(s)</label>
                                        <input type="text" name="nombre" id="nombre" required/>
                                    </div>
                                    <div class="cols">
                                        <label for="apaterno">Apellido Paterno</label>
                                        <input type="text" name="apaterno" id="apaterno" />
                                    </div>
                                    <div class="cols">
                                        <label for="amaterno">Apellido Materno</label>
                                        <input type="text" name="amaterno" id="amaterno" />
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="curp">Curp</label>
                                <input type="text" name="curp" id="curp" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="sexo">Sexo</label>
                                <select class="selPro" name="sexo" id="sexo" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
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
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar de nacimiento</legend>
                                    <div class="cols">
                                        <label for="nPais">Pais</label>
                                        <select class="selPro" name="nPais" id="nPais">
                                            <option value="0">--Seleccione--</option>
                                            <%                                        //conexion a base
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="nEntidad">Entidad</label>
                                        <select class="selPro" name="nEntidad" id="nEntidad">
                                            <option value="0">--Seleccione--</option>
                                            <%                                        //conexion a base
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="nMunicipio">Municipio o Demarcacion Territorial</label>
                                        <select class="selPro" name="nMunicipio" id="nMunicipio">
                                            <option value="0">--Seleccione--</option>
                                            <%                                        //conexion a base
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="nacionalidad">Nacionalidad</label>
                                <select class="selPro" name="nacionalidad" id="nacionalidad">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar habitual de residencia</legend>
                                    <div class="cols">
                                        <label for="residencia">Lugar de residencia</label>
                                        <select class="selPro" name="residencia" id="residencia">
                                            <option value="0">--Seleccione--</option>
                                            <%                                        //conexion a base
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="rEntidad">Entidad</label>
                                        <select class="selPro" name="rEntidad" id="rEntidad">
                                            <option value="0">--Seleccione--</option>
                                            <%                                        //conexion a base
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="rMunicipio">Municipio</label>
                                        <select class="selPro" name="rMunicipio" id="rMunicipio">
                                            <option value="0">--Seleccione--</option>
                                            <%                                        //conexion a base
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="edoCivil">Situación conyugal</label>
                                <select class="selPro" name="edoCivil" id="edoCivil">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="discapacidad">¿Tiene alguna discapacidad?</label>
                                <select class="selPro" name="discapacidad" id="discapacidad">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select> 
                            </td>
                            <td>
                                <label for="alfabet">Condicion alfabetismo</label>
                                <select class="selPro" name="alfabet" id="alfabet">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="estudios">Grado de Estudios</label>
                                <select class="selPro" name="estudios" id="estudios">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="condiEstudiante">Condición de estudiante</label>
                                <select class="selPro" name="condiEstudiante" id="condiEstudiante">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="hablaEsp">Dominio del español</label>
                                <select class="selPro" name="hablaEsp" id="hablaEsp">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="poblaIndigena">¿Pertenece a alguna población indígena?</label>
                                <select class="selPro" name="poblaIndigena" id="poblaIndigena">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="puebloIndigena">Tipo de pueblo indígena</label>
                                <select class="selPro" name="puebloIndigena" id="puebloIndigena">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="hablaIndigena">¿Habla lengua indígena o dialecto?</label>
                                <select class="selPro" name="hablaIndigena" id="hablaIndigena">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="lenguaIndigena">Familia lingüística</label>
                                <select class="selPro" name="lenguaIndigena" id="lenguaIndigena">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="ocupacion">Ocupación</label>
                                <select class="selPro" name="ocupacion" id="ocupacion">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="condicionActi">Condicion de Actividad</label>
                                <select class="selPro" name="condicionActi" id="condicionActi">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
%>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante"/>
            </form>
            <br/><br/><br/>
        </section>
    </body>
</html>
