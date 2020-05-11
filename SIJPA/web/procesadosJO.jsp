<%-- 
    Document   : procesadosJO
    Created on : 08/05/2020, 09:04:33 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::ProcesadosJO</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/fnProcesadosJO.js"></script>
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista;
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp" %>--%>
        <section class="contenedor">
            <h1>Procesados</h1>
            <form action="" method="post" name="formProcesadosJO" id="formProcesadosJO">
                <fieldset>
                    <legend>Características Sociodemográficas </legend>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="4">
                                <label>Procesado Clave</label>
                                <input type="text" name="proceClave" id="proceClave" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="nombre">Nombre(s)</label>
                                <input type="text" name="nombre" id="nombre"  required>
                            </td>
                            <td>
                                <label for="apaterno">Apellido Paterno</label>
                                <input type="text" name="apaterno" id="apaterno" required>
                            </td>
                            <td>
                                <label for="amaterno">Apellido Materno</label>
                                <input type="text" name="amaterno" id="amaterno" required>
                            </td>
                            <td>
                                <label for="alias">Alias</label>
                                <input type="text" name="alias" id="alias" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="curp">Curp</label>
                                <input type="text" name="curp" id="curp" maxlength="18" minlength="18" required>
                            </td>
                            <td>
                                <label for="fNacimiento">Fecha nacimiento</label>
                                <input type="date" name="fNacimiento" id="fNacimiento" required>
                                <div class='noIdentificada'>
                                    <input type='checkbox' id='chkFechaNac' onclick="fechaNoIdent('#chkFechaNac', '#fNacimiento')">
                                    <label>No identificada</label>
                                </div>
                            </td>
                            <td>
                                <label for="sexo">Sexo</label>
                                <select name="sexo" id="sexo" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findSexo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
//                                            if(ls[0].equals(sexo)){
//                                                out.println(" selected ");
//                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="edad">Edad</label>
                                <select name="edad" id="edad" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        for (int i = 12; i <= 99; i++) {
                                            out.println("<option value='" + i + "'");
//                                            if(Integer.toString(i).equals(edad)){
//                                                out.println(" selected ");
//                                            }
                                            out.println(">" + i + "</option>");
                                                    
                                        }
                                    %>
                                    <option value="-9">No identificado</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar de nacimiento</legend>
                                    <div class="colsx">
                                        <label for="nPais">Pais</label>
                                        <select name="nPais" id="nPais" onchange="lugarNacimiento('#nPais', '#dNEntidad', '#dNMunicipio', '#nEntidad', '#nMunicipio');" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(naciPais)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dNEntidad">
                                        <label for="nEntidad">Entidad</label>
                                        <select name="nEntidad" id="nEntidad" onchange="llenaMun('#nEntidad', '#nMunicipio')" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(naciEnti)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dNMunicipio">
                                        <label for="nMunicipio" class="lblExBig">Municipio o Demarcacion Territorial</label>
                                        <select name="nMunicipio" id="nMunicipio" required>
                                            
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="nacionalidad">Nacionalidad</label>
                                <select name="nacionalidad" id="nacionalidad" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findNacionalidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
//                                            if(ls[0].equals(nacionali)){
//                                                out.println(" selected ");
//                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
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
                                        <select name="residencia" id="residencia" onchange="lugarResidencia('#residencia', '#dREntidad', '#dRMunicipio', '#rEntidad', '#rMunicipio');" required >
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(resiPais)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dREntidad">
                                        <label for="rEntidad">Entidad</label>
                                        <select name="rEntidad" id="rEntidad" onchange="llenaMun('#rEntidad', '#rMunicipio')">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(resiEnti)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dRMunicipio">
                                        <label for="rMunicipio">Municipio</label>
                                        <select name="rMunicipio" id="rMunicipio">
                                            
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="edoCivil">Situación conyugal</label>
                                <select name="edoCivil" id="edoCivil" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findEstadoCivil();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
//                                            if(ls[0].equals(edoCivil)){
//                                                out.println(" selected ");
//                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="discapacidad">¿Tiene alguna discapacidad?</label>
                                <select name="discapacidad" id="discapacidad" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
//                                            if(ls[0].equals(discapaci)){
//                                                out.println(" selected ");
//                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select> 
                            </td>
                            <td>
                                <label for="alfabet">Condicion alfabetismo</label>
                                <select name="alfabet" id="alfabet" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findAlfabetismo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
//                                            if(ls[0].equals(condAlfabeto)){
//                                                out.println(" selected ");
//                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="estudios">Grado de Estudios Concluido</label>
                                <select name="estudiosPro" id="estudiosPro" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findGradoEstudios();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
//                                            if(ls[0].equals(gradoEstu)){
//                                                out.println(" selected ");
//                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="condiEstudiante">Condición de estudiante</label>
                                <select name="condiEstudiante" id="condiEstudiante" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findCondicionEstudiante();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
//                                            if(ls[0].equals(condiEstudi)){
//                                                out.println(" selected ");
//                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="hablaEsp">Dominio del español</label>
                                <select name="hablaEsp" id="hablaEsp" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findDominioEspanol();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
//                                            if(ls[0].equals(hablaEspa)){
//                                                out.println(" selected ");
//                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td colspan="3">
                                <fieldset>
                                    <div class="colsx lblExBig">
                                        <label for="poblaIndigena" class="lblExBig">¿Pertenece a alguna población indígena?</label>
                                        <select name="poblaIndigena" id="poblaIndigena" onchange="respuestaSimpleSelect('#poblaIndigena', '#dPuebloIndigena', '#puebloIndigena');" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(poblaIndi)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="colsx oculto" id="dPuebloIndigena">
                                        <label for="puebloIndigena">Tipo de pueblo indígena</label>
                                        <select name="puebloIndigena" id="puebloIndigena">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPuebloIndigena();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(tiPoblaIndi)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="hablaIndigena" class="lblExBig">¿Habla lengua indígena o dialecto?</label>
                                        <select name="hablaIndigena" id="hablaIndigena" onchange="respuestaSimpleSelect('#hablaIndigena', '#dLenguaIndigena', '#lenguaIndigena');" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(hablaIndi)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols lblExBig oculto" id="dLenguaIndigena">
                                        <label for="lenguaIndigena">Familia lingüística</label>
                                        <select name="lenguaIndigena" id="lenguaIndigena">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findLinguisticas();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(lenguaIndi)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="lenExtranjera">¿Habla alguna lengua extranjera?</label>
                                <select name="lenExtranjera" id="lenExtranjera" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
//                                            if(ls[0].equals(lenguaExtra)){
//                                                out.println(" selected ");
//                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="hablaEsp">¿Requirió traductor y/o intérprete?</label>
                                <select name="traductorPro" id="traductorPro" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
//                                            if(ls[0].equals(interprete)){
//                                                out.println(" selected ");
//                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <div class="colsA">
                                        <label for="ingresosPro">¿Percibe algún tipo de ingresos? </label>
                                        <select name="ingresosPro" id="ingresosPro" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(ingresos)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="colsA oculto" id="rangoIngePro">
                                        <label for="indigena">Rango de ingresos </label>
                                        <select name="rangoIngresosPro" id="rangoIngresosPro">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRangoIngresos();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(rangoIngre)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <table class="tablasRegis oculto" id="tblFuenteIngrePro">
                                        <tr>
                                            <th>ID</th>
                                            <th>Fuente de ingresos</th>
                                            <th>Aplica</th>
                                        </tr>
                                        <%
                                            lista = cat.findFuenteIngresos();
                                            for (String[] ls : lista) {
                                                out.println("<tr>");
                                                out.println("<td>" + ls[0] + "</td>");
                                                out.println("<td>" + ls[1] + "</td>");
                                                out.println("<td>");
                                                out.println("<input type='checkbox' name='chkIngresosPro' id='chkIngresosPro"+ls[0]+"' value=" + ls[0] + ">");
                                                out.println("</td>");
                                                out.println("</tr>");
                                            }
                                        %>
                                    </table>
                                </fieldset>
                            </td>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="ocupacion">Ocupación</label>
                                        <select name="ocupacion" id="ocupacion" onchange="ocupacionAdo('#ocupacion', '#dCondicionActi', '#condicionActi');" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findOcupacion();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(ocupacion)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="cols lblExBig oculto" id="dCondicionActi">
                                        <label for="condicionActi">Condicion de Actividad</label>
                                        <select name="condicionActi" id="condicionActi">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findCondicionActividad();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
//                                                    if(ls[0].equals(condiActi)){
//                                                        out.println(" selected ");
//                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset>
                    <legend>Características Procesales</legend>                    
                    <div class="colsx"> 
                        <label for="participacion">Grado de participacion</label>
                        <select name="participacion" id="participacion" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findGradoParticipacion();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(gradoParti)){
//                                        out.println(" selected ");
//                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="colsx">
                        <label for="reincidencia">Condicion de reincidencia</label>
                        <select name="reincidencia" id="reincidencia" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findReincidencia();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(reinciden)){
//                                        out.println(" selected ");
//                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="colsx">
                        <label for="psicofisico">Estado psicofisico al momento de cometer la conducta</label>
                        <select name="psicofisico" id="psicofisico" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findEstadoPsicofisico();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(edoPsicofi)){
//                                        out.println(" selected ");
//                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <br>
                    <fieldset class="subField colsA">
                        <div class="colsx">
                            <label for="presentAdo">¿Forma parte o pertenece a algún grupo delictivo?</label>
                            <select  name="grupoDelictivo" id="grupoDelictivo" onchange="respuestaSimpleSelect('#grupoDelictivo', '#gruDeli', '#delictivo');" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
//                                        if(ls[0].equals(gpoDeli)){
//                                            out.println(" selected ");
//                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                        <div class="colsx oculto" id="gruDeli">
                            <label for="presentAdo">Grupo delictivo del que forma parte</label>
                            <input type="text" class="txtLong"  name="delictivo" id="delictivo" >
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkdelictivo">
                                <label>No identificada</label>
                            </div>
                        </div>
                    </fieldset>
                    <div class="colsx">    
                        <label for="defensor">Tipo de defensor</label>
                        <select name="defensor" id="defensor" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findTipoDefensor();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(defensor)){
//                                        out.println(" selected ");
//                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="colsx">
                        <label for="representante">Tipo de persona responsable</label>
                        <select name="representante" id="representante" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRepresentanteLegal();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
//                                    if(ls[0].equals(personaRes)){
//                                        out.println(" selected ");
//                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>
                        </select>  
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Delitos Atribuidos al Adolescente</legend>
                    <table class="tablasRegis">
                        <tr>
                            <th>Delito Clave</th>
                            <th>Delito</th>
                            <th>No. Victimas</th>
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
