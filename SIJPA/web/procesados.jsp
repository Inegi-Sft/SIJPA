<%-- 
    Document   : procesados
    Created on : 26/09/2019, 09:04:33 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Procesados</title>
        <%@include file="librerias.jsp" %>
    </head>
    <body style="zoom: .9;">
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista;
        %>
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Procesados</h1>
            <span class="nota">NOTA: El Adolescente procesado se identificará con el número de expediente seguido de un "-p" más el número consecutivo del Adolescente Procesado registrado.
                Es decir, si es el primer Adolescente Procesado del expediente 10/2016 su identificador será 10/2016-p1
            </span>
            <form action="#" method="post">
                <fieldset>
                    <legend>Situación jurídica del adolescente</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="presentacionAdo">Tipo presentacion adolescente</label>
                                <select class="txtMedia"  name="presentacionAdo" id="presentacionAdo" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findTipoConsigna();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>"+ ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="tipoDetencion">Tipo de detencion</label>
                                <select class="txtMedia" name="tipoDetencion" id="tipoDetencion" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findTipoDetencion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="imputable">Imputabilidad</label>
                                <select class="txtMedia" name="imputable" id="imputable" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findImputabilidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="participacion">Grado de participacion</label>
                                <select class="txtMedia" name="participacion" id="participacion" >
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findGParticipacion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="reincidencia">Condicion de reincidencia</label>
                                <select class="txtMedia" name="reincidencia" id="reincidencia">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findReincidencia();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="psicofisico">Estado psicofisico al momento de cometer la conducta</label>
                                <select class="txtMedia" name="psicofisico" id="psicofisico">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findEdoPsicoFisico();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="interprete">¿Requirió traductor y/o intérprete?</label>
                                <select class="txtMedia" name="interprete" id="interprete">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".-" + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="defensor">Tipo de defensor</label>
                                <select class="txtMedia" name="defensor" id="defensor">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findTipoDefensor();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="representante">Tipo de representante legal</label>
                                <select class="txtMedia" name="representante" id="representante">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRepLegal();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </fieldset><br>
                <fieldset>
                    <legend>Delitos Atribuidos al adolescentes</legend>
                    <table class="tablasRegis">
                        <tr>
                            <th>Id</th>
                            <th>Conducta antisocial</th>
                            <th>No. Victimas</th>
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
                                <select class="txtMedia" name="sexo" id="sexo" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findSexo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
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
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaNac"><label>No identificada</label>
                                </div>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar de nacimiento</legend>
                                    <div class="cols">
                                        <label for="nPais">Pais</label>
                                        <select class="txtMedia" name="nPais" id="nPais">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="nEntidad">Entidad</label>
                                        <select class="txtMedia" name="nEntidad" id="nEntidad" onchange="llenaMun('#nEntidad','#nMunicipio')">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="nMunicipio" class="lblExBig">Municipio o Demarcacion Territorial</label>
                                        <select class="txtMedia" name="nMunicipio" id="nMunicipio">
                                            <option value="">--Seleccione--</option>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="nacionalidad">Nacionalidad</label>
                                <select class="txtMedia" name="nacionalidad" id="nacionalidad">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findNacionalidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
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
                                        <select class="txtMedia" name="residencia" id="residencia">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista=cat.findResidencia();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="rEntidad">Entidad</label>
                                        <select class="txtMedia" name="rEntidad" id="rEntidad" onchange="llenaMun('#rEntidad','#rMunicipio')">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista=cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols">
                                        <label for="rMunicipio">Municipio</label>
                                        <select class="txtMedia" name="rMunicipio" id="rMunicipio">
                                            <option value="">--Seleccione--</option>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="edoCivil">Situación conyugal</label>
                                <select class="txtMedia" name="edoCivil" id="edoCivil">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista=cat.findEdoCivil();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="discapacidad">¿Tiene alguna discapacidad?</label>
                                <select class="txtMedia" name="discapacidad" id="discapacidad">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista=cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
                                    %>
                                </select> 
                            </td>
                            <td>
                                <label for="alfabet">Condicion alfabetismo</label>
                                <select class="txtMedia" name="alfabet" id="alfabet">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista=cat.findAlfabetismo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="estudios">Grado de Estudios</label>
                                <select class="txtMedia" name="estudios" id="estudios">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista=cat.findGEstudios();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="condiEstudiante">Condición de estudiante</label>
                                <select class="txtMedia" name="condiEstudiante" id="condiEstudiante">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista=cat.findCondEstudiante();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="hablaEsp">Dominio del español</label>
                                <select class="txtMedia" name="hablaEsp" id="hablaEsp">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista=cat.findDomEspanol();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="poblaIndigena">¿Pertenece a alguna población indígena?</label>
                                <select class="txtMedia" name="poblaIndigena" id="poblaIndigena">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista=cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="puebloIndigena">Tipo de pueblo indígena</label>
                                <select class="txtMedia" name="puebloIndigena" id="puebloIndigena">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista=cat.findPIndigena();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="hablaIndigena">¿Habla lengua indígena o dialecto?</label>
                                <select class="txtMedia" name="hablaIndigena" id="hablaIndigena">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista=cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="lenguaIndigena">Familia lingüística</label>
                                <select class="txtMedia" name="lenguaIndigena" id="lenguaIndigena">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista=cat.findLinguisticas();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="ocupacion">Ocupación</label>
                                <select class="txtMedia" name="ocupacion" id="ocupacion">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista=cat.findOcupacion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="condicionActi">Condicion de Actividad</label>
                                <select class="txtMedia" name="condicionActi" id="condicionActi">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        lista=cat.findCondActividad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='"+ls[0]+"'>" +ls[0]+ ".- " +ls[1]+"</option>");
                                        }
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
        </section>
    </body>
</html>
