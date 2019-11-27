<%-- 
    Document   : procesados
    Created on : 26/09/2019, 09:04:33 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.showVictimas"%>
<%@page import="clasesAuxiliar.showCausasPenales"%>
<%@page import="clasesAuxiliar.showDelitos"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Procesados</title>
        <%@include file="librerias.jsp" %>
        <%
            String proceClave = "", posicion = "";
            if (request.getParameter("proceClave") != null || request.getParameter("posicion") != null) {
                proceClave = request.getParameter("proceClave");
                posicion = request.getParameter("posicion");
            }
            if (request.getParameter("insertado") != null) {
                out.println("<script type='text/javascript'>alert('Error al insertar: Consulte al administrador del sistema');</script>");
            }

            catalogos cat = new catalogos();
            showVictimas sd = new showVictimas();
            showCausasPenales objExp = new showCausasPenales();
            ArrayList<String[]> lista;
            String entidad = (String) session.getAttribute("entidad");
            String municipio = (String) session.getAttribute("municipio");
            String distrito = (String) session.getAttribute("distrito");
            String numero = (String) session.getAttribute("numero");
            String jConcatenado = entidad + municipio + distrito + numero;
            String expediente = (String) session.getAttribute("expediente");
        %>
    </head>
    <body style="zoom: .85;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Procesados</h1>
            <span class="nota">NOTA: El Adolescente procesado se identificará con el número de expediente seguido de un "-p" más el número consecutivo del Adolescente Procesado registrado.
                Es decir, si es el primer Adolescente Procesado del expediente 10/2016 su identificador será 10/2016-p1
            </span>
            <form action="" method="post" name="formProcesados" id="formProcesados">
                <fieldset>
                    <legend>Situación jurídica del adolescente</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>"/>
                            </td>
                            <td >
                                <label>Procesado Clave</label>
                                <input type="text" name="proceClave" id="proceClave" value="<%=proceClave%>" readonly/>
                            </td>
                            <td>
                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="presentAdo">Tipo de presentación</label>
                                        <select class="txtMedia"  name="presentAdo" id="presentAdo" required onchange="respuestaSimpleSelect('#presentAdo', '#dTipoDetencion', '#tipoDetencion');">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findTipoConsigna();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="dTipoDetencion">
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
                                    </div>
                                    <div class="cols oculto" id="formCondu">
                                        <label for="tipoDetencion">Forma de conducción</label>
                                        <select class="txtMedia" name="formaConduc" id="formaConduc">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findFormConduccion();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="participacion">Grado de participacion</label>
                                <select class="txtMedia" name="participacion" id="participacion" required>
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
                                <select class="txtMedia" name="reincidencia" id="reincidencia" required>
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
                                <select class="txtMedia" name="psicofisico" id="psicofisico" required>
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
                                <label for="defensor">Tipo de defensor</label>
                                <select class="txtMedia" name="defensor" id="defensor" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findTipoDefensor();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="representante">Tipo de persona responsable</label>
                                <select class="txtMedia" name="representante" id="representante" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRepLegal();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="presentAdo">¿Forma parte o pertenece a algún grupo delictivo?</label>
                                        <select class="txtMedia"  name="grupoDelictivo" id="grupoDelictivo" required onchange="respuestaSimpleSelect('#grupoDelictivo', '#gruDeli', '#delictivo');">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="gruDeli">
                                        <label for="presentAdo">Grupo delictivo del que forma parte</label>
                                        <input type="text" class="txtMedia"  name="delictivo" id="delictivo">
                                        <div class="noIdentificada">
                                            <input type="checkbox" id="chkdelictivo"><label>No identificada</label>
                                        </div>
                                    </div>
                                </fieldset>
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </fieldset><br>
                <fieldset>
                    <legend>Delitos Atribuidos al adolescentes</legend>
                    <table class="tablasRegis">
                        <tr>
                             <th>Delito Clave</th>
                            <th>Delito</th>
                            <th>No. Victimas</th>
                        </tr>
                        <%
                            int totVic = objExp.countTotalVictimas(expediente + jConcatenado);
                            lista = sd.findDelitos(expediente + jConcatenado);
                            for (String[] ls : lista) {
                        %>
                        <tr>
                            <td> <input type="hidden" name="arrayDelito" value="<%= ls[0]%>"/> <%= ls[0].replace(jConcatenado, "")%></td>
                            <td> <%= ls[1]%> </td>
                            <td>
                                <select class='txtSmall' name='arrayNumVic' required>
                                    <option value=""> - - - </option>
                                    <%
                                        for (int i = 0; i <= totVic; i++) {
                                            out.println("<option value=" + i + ">" + i + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </fieldset><br>
                <fieldset>
                    <legend>Características sociodemográficas </legend>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="4">
                                <fieldset>
                                    <legend>Nombre del adolescente</legend>
                                    <div class="colsx">
                                        <label for="nombre">Nombre(s)</label>
                                        <input type="text" name="nombre" id="nombre" required/>
                                    </div>
                                    <div class="colsx">
                                        <label for="apaterno">Apellido Paterno</label>
                                        <input type="text" name="apaterno" id="apaterno" required/>
                                    </div>
                                    <div class="colsx">
                                        <label for="amaterno">Apellido Materno</label>
                                        <input type="text" name="amaterno" id="amaterno" required/>
                                    </div>
                                    <div class="colsx">
                                        <label for="alias">Alias</label>
                                        <input type="text" name="alias" id="alias" required/>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="curp">Curp</label>
                                <input type="text" name="curp" id="curp" required/>
                            </td>
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
                                <input type="number" class="txtSmall" name="edad" id="edad" required/>
                            </td>
                            <td>
                                <label for="fNacimiento">Fecha nacimiento</label>
                                <input type="date" class="txtMedia" name="fNacimiento" id="fNacimiento" />
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaNac" onclick="fechaNoIdent('#chkFechaNac', '#fNacimiento');"><label>No identificada</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar de nacimiento</legend>
                                    <div class="colsx">
                                        <label for="nPais">Pais</label>
                                        <select class="txtMedia" name="nPais" id="nPais" required onchange="lugarNacimiento('#nPais', '#dNEntidad', '#dNMunicipio', '#nEntidad', '#nMunicipio');">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dNEntidad">
                                        <label for="nEntidad">Entidad</label>
                                        <select class="txtMedia" name="nEntidad" id="nEntidad" onchange="llenaMun('#nEntidad', '#nMunicipio')" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dNMunicipio">
                                        <label for="nMunicipio" class="lblExBig">Municipio o Demarcacion Territorial</label>
                                        <select class="txtMedia" name="nMunicipio" id="nMunicipio" required>
                                            <option value="">--Seleccione--</option>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="nacionalidad">Nacionalidad</label>
                                <select class="txtMedia" name="nacionalidad" id="nacionalidad" required>
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
                                    <div class="colsx">
                                        <label for="residencia">Lugar de residencia</label>
                                        <select class="txtMedia" name="residencia" id="residencia" onchange="lugarResidencia('#residencia', '#dREntidad', '#dRMunicipio', '#rEntidad', '#rMunicipio');" required >
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResidencia();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dREntidad">
                                        <label for="rEntidad">Entidad</label>
                                        <select class="txtMedia" name="rEntidad" id="rEntidad" onchange="llenaMun('#rEntidad', '#rMunicipio')" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dRMunicipio">
                                        <label for="rMunicipio">Municipio</label>
                                        <select class="txtMedia" name="rMunicipio" id="rMunicipio" required>
                                            <option value="">--Seleccione--</option>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="edoCivil">Situación conyugal</label>
                                <select class="txtMedia" name="edoCivil" id="edoCivil" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findEdoCivil();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
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
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select> 
                            </td>
                            <td>
                                <label for="alfabet">Condicion alfabetismo</label>
                                <select class="txtMedia" name="alfabet" id="alfabet">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findAlfabetismo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="estudios">Grado de Estudios</label>
                                <select class="txtMedia" name="estudios" id="estudios">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findGEstudios();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="condiEstudiante">Condición de estudiante</label>
                                <select class="txtMedia" name="condiEstudiante" id="condiEstudiante">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findCondEstudiante();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="hablaEsp">Dominio del español</label>
                                <select class="txtMedia" name="hablaEsp" id="hablaEsp" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findDomEspanol();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="hablaEsp">¿Habla alguna lengua extranjera?</label>
                                <select class="txtMedia" name="hablaEsp" id="hablaEsp" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols lblExBig">
                                        <label for="poblaIndigena" class="lblExBig">¿Pertenece a alguna población indígena?</label>
                                        <select class="txtMedia" name="poblaIndigena" id="poblaIndigena" onchange="respuestaSimpleSelect('#poblaIndigena', '#dPuebloIndigena', '#puebloIndigena');" required="">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="dPuebloIndigena">
                                        <label for="puebloIndigena">Tipo de pueblo indígena</label>
                                        <select class="txtMedia" name="puebloIndigena" id="puebloIndigena">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPIndigena();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols lblExBig">
                                        <label for="hablaIndigena" class="lblExBig">¿Habla lengua indígena o dialecto?</label>
                                        <select class="txtMedia" name="hablaIndigena" id="hablaIndigena" onchange="respuestaSimpleSelect('#hablaIndigena', '#dLenguaIndigena', '#lenguaIndigena');">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols lblExBig oculto" id="dLenguaIndigena">
                                        <label for="lenguaIndigena">Familia lingüística</label>
                                        <select class="txtMedia" name="lenguaIndigena" id="lenguaIndigena">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findLinguisticas();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols lblExBig">
                                        <label for="ocupacion">Ocupación</label>
                                        <select class="txtMedia" name="ocupacion" id="ocupacion" onchange="ocupacionAdo('#ocupacion', '#dCondicionActi', '#condicionActi');">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findOcupacion();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols lblExBig oculto" id="dCondicionActi">
                                        <label for="condicionActi">Condicion de Actividad</label>
                                        <select class="txtMedia" name="condicionActi" id="condicionActi">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findCondActividad();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                             <td>
                                <label for="hablaEsp">¿Requirió traductor y/o intérprete?</label>
                                <select class="txtMedia" name="traductorPro" id="traductorPro" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findResSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                             <td colspan="3">
                                 <fieldset>
                                      <div class="cols">
                                        <label for="indigena">¿Percibe algún tipo de ingresos? </label>
                                        <select name="ingresosPro" id="ingresosPro" class="txtMedia" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findResSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                        <div class="cols oculto" id="rangoIngePro">
                                        <label for="indigena">Rango de ingresos </label>
                                        <select name="rangoIngresosPro" id="rangoIngresosPro" class="txtMedia">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRangoIngre();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                         <div class="cols oculto" id="fuenteIngePro">
                                        <label for="indigena"> Fuente de ingresos  </label>
                                        <select name="fuenteIngresosPro" id="fuenteIngresosPro" class="txtMedia">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findFuenteIngre();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                 </fieldset>
                             </td>
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
