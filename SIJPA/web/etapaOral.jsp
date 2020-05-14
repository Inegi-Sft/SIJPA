<%-- 
    Document   : etapaOral
    Created on : 13/05/2020, 12:23:05 PM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Etapa Juicio Oral</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/fnEtapaOral.js"></script>
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista = new ArrayList();
        %>
    </head>
    <body style="zoom: .9;">
        <section class="contenedor">
            <h1>Etapa Juicio Oral</h1>
            <form action="" method="post" name="formJuicioO" id="fromJuicioO">
                <label for="idProcesado">Id Adolescente</label>
                <input type="text" name="proceClave" id="proceClave" readonly>
                <fieldset>
                    <legend>Características de la de juicio oral</legend>
                    <div class="cols" id="dApertura">
                        <label for="autoApertura">Fecha del auto de apertura a juicio oral</label>
                        <input type="date" name="autoApertura" id="autoApertura" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkAutoApertura" onclick="fechaNoIdent('#chkAutoApertura', '#autoApertura')">
                            <label>No identificada</label>
                        </div> 
                    </div>
                    <div class="cols" id="dCelebracionA">
                        <label for="celebracionA">Fecha de la celebración de la audiencia de juicio</label>
                        <input type="date" name="celebracionA" id="celebracionA" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkCelebracionA" onclick="fechaNoIdent('#chkCelebracionA', '#celebracionA')">
                            <label>No identificada</label>
                        </div> 
                    </div>
                    <fieldset class="subField colsA">
                        <div class="colsA" id="dMedidasDis">
                            <label for="medidasDis">¿Se aplicaron medidas disciplinarias en la audiencia?</label>
                            <select name="medidasDis" id="medidasDis" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA oculto" id="dTipoMedida">
                            <label for="tipoMedida">Tipo de medida disciplinaria</label>
                            <select name="tipoMedida" id="tipoMedida" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findMedidasDisciplinarias();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
                    <br/>
                    <fieldset class="subField colsA">
                        <div class="colsA">
                            <label for="incidentes">¿Se promovieron incidentes dentro de la audiencia?</label>
                            <select name="incidentes" id="incidentes" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dResoIncidente">
                            <label for="resoIncidente">Fecha de resolución del incidente</label>
                            <input type="date" name="resoIncidente" id="resoIncidente">
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkResoIncidente" onclick="fechaNoIdent('#chkResoIncidente', '#resoIncidente')">
                                <label>No identificada</label>
                            </div> 
                        </div>
                        <div class="cols oculto" id="dPromueveIncidente">
                            <label for="promueveIncidente">¿Por quién fue promovido el incidente?</label>
                            <select name="promueveIncidente" id="promueveIncidente" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findPromueveIncidente();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
                    <fieldset class="subField">
                        <legend>Tipos de pruebas desahogadas durante la audiencia</legend>
                        <div class="colsA">
                            <label for="testimonial">Testimonial</label>
                            <select name="testimonial" id="testimonial" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA">
                            <label for="pericial">Pericial</label>
                            <select name="pericial" id="pericial" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA">
                            <label for="declaracion">Declaración del acusado</label>
                            <select name="declaracion" id="declaracion" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA">
                            <label for="documental">Documental y material</label>
                            <select name="documental" id="documental" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA">
                            <label for="otro">Otro tipo de prueba</label>
                            <select name="otro" id="otro" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
                    <fieldset class="subField colsA">        
                        <div class="colsA">
                            <label for="suspencionA">¿Hubo suspensión de audiencia de juicio?</label>
                            <select name="suspencionA" id="suspencionA" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA oculto" id="dFechaSuspencion">
                            <label for="fechaSuspencion">Fecha en que se dictó suspensión de audiencia de juicio </label>
                            <input type="date" name="fechaSuspencion" id="fechaSuspencion">
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkFechaSuspencion" onclick="fechaNoIdent('#chkFechaSuspencion', '#fechaSuspencion')">
                                <label>No identificada</label>
                            </div> 
                        </div>    
                        <div class="colsA oculto" id="dFechaReanudacion">
                            <label for="fechaReanudacion">Fecha en que se reanudo  la audiencia de juicio</label>
                            <input type="date" name="fechaReanudacion" id="fechaReanudacion">
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkFechaReanudacion" onclick="fechaNoIdent('#chkFechaReanudacion', '#fechaReanudacion')">
                                <label>No identificada</label>
                            </div> 
                        </div>
                    </fieldset>
                    <br/>        
                    <fieldset class="subField colsA">
                        <div class="colsA">
                            <label for="deliberacion">¿Hubo deliberación y emisión del fallo?</label>
                            <select name="deliberacion" id="deliberacion" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA oculto" id="dFechaDeliberacion">
                            <label for="fechaDeliberacion">Fecha de la deliberación y emisión del fallo</label>
                            <input type="date" name="fechaDeliberacion" id="fechaDeliberacion">
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkFechaDeliberacion" onclick="fechaNoIdent('#chkFechaDeliberacion', '#fechaDeliberacion')">
                                <label>No identificada</label>
                            </div> 
                        </div>
                        <div class="colsA oculto" id="dSentidoFallo">
                            <label for="sentidoFallo">Sentido del fallo</label>
                            <select name="sentidoFallo" id="sentidoFallo" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findSentidoFallo();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
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
