<%-- 
    Document   : delitos
    Created on : 1/10/2019, 09:00:11 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Delitos</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="cabecera.jsp" %>
        <section class="contenedor">
            <h1>Delitos</h1>
            <form action="" method="post">
                <fieldset>
                    <legend>Identificación del tipo penal</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="2">
                                <label class="lblExBig" for="delitoCP">Delito de acuerdo con la ley penal</label>
                                <select class="selPro"  name="delitoCP" id="delitoCP" required>
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="fuero">Fuero</label>
                                <select class="selPro"  name="fuero" id="fuero">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="lblExBig" for="articuloCP">Artículo y/o fracción de acuerdo con el código penal</label>
                                <input class="txtExBig" type="text"  name="articuloCP" id="articuloCP" required/>
                            </td>
                            <td>
                                <label for="reclasificaDel">¿Hubo reclasificación del delito?</label>
                                <select class="selPro"  name="reclasificaDel" id="reclasificaDel">
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="lblExBig" for="delitoNT">Delito de acuerdo con la Norma Técnica</label>
                                <select class="selPro"  name="delitoNT" id="delitoNT" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select> 
                            </td>
                            <td>
                                <label for="fechaReclaDel">Fecha de reclasificacion del delito</label>
                                <input type="date" name="fechaReclaDel" id="fechaReclaDel"/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaReclaDel"><label>No identificada</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset><br/>
                <fieldset>
                    <legend>Características de ejecución</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="consumacion">Grado de consumación</label>
                                <select class="selPro"  name="consumacion" id="consumacion" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="calificacion">Calificación del delito</label>
                                <select class="selPro"  name="calificacion" id="calificacion" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="concurso">Concurso</label>
                                <select class="selPro"  name="concurso" id="concurso" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="clasificacion">Clasificación en orden al resultado</label>
                                <select class="selPro"  name="clasificacion" id="clasificacion" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="comision">Forma de comisión</label>
                                <select class="selPro"  name="comision" id="comision" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="accion">Forma de acción</label>
                                <select class="selPro"  name="accion" id="accion" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="modalidad">Modalidad</label>
                                <select class="selPro"  name="modalidad" id="modalidad" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="modalidad">Modalidad</label>
                                <select class="selPro"  name="modalidad" id="modalidad" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="instrumentos">Instrumentos para la comisión</label>
                                <select class="selPro"  name="instrumentos" id="instrumentos" required>
                                    <option value="0">--Seleccione--</option>
                                    <%                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="ocurrencia">Fecha de ocurrencia</label>
                                <input type="date" name="ocurrencia" id="ocurrencia"/>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkOcurrencia"><label>No identificada</label>
                                </div>
                            </td>
                            <td colspan="2">
                                <fieldset>
                                    <legend>Lugar de ocurrencia</legend>
                                    <div class="cols">
                                        <label>Entidad Federativa</label>
                                        <select class="selPro" name="entidad" id="entidad">
                                            <option value="0">--Seleccione--</option>
                                            <%    //conexion a base
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label class="lblExBig">Municipio o demarcación territorial</label>
                                        <select class="selPro" name="municipio" id="municipio">
                                            <option value="0">--Seleccione--</option>
                                            <%    //conexion a base
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="numAdo">Número de adolescentes por este delito </label>
                                <select class="selPro" name="numAdo" id="numAdo">
                                    <option value="0">--Seleccione--</option>
                                    <%    //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="numVic">Número de víctimas por este delito </label>
                                <select class="selPro" name="numVic" id="numVic">
                                    <option value="0">--Seleccione--</option>
                                    <%    //conexion a base
                                    %>
                                </select>
                            </td>
                            <td></td>
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
        </section>
    </body>
</html>
