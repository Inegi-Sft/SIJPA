    <%-- 
    Document   : JuicioPenal
    Created on : 7/05/2020, 08:39:55 AM
    Author     : ANTONIO.CORIA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::juicioPenalJO</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesJP.js"></script>    
        <%
            catalogos cat = new catalogos();
            ArrayList<String[]> lista;

        %>        
    </head>   
    <body style="zoom: .9;">
        <section class="contenedor">
            <h1>Juicio Penal</h1>
            <form method="post" name="formJuicioPenalJO" id="formJuicioPenal">
                <fieldset>
                <legend>Características de la etapa de juicio oral </legend>    
                    <table class="tablaFormu" >
                        <tr>
                            <td colspan="4" style="text-align: center;">
                                <label>Procesado Clave</label>
                                <input type="text" name="procesadoClave" id="procesadoClave" value="" readonly>
                                <input type="hidden" name="posicion" id="posicion" value="">
                                <input type="hidden" name="opera" id="opera" value="">
                            </td>
                        </tr> 
                        <tr>
                            <td>
                                <label for="aperturaJO">Fecha de apertura a juicio oral</label>
                                <input type="date" name="aperturaJO" id="aperturaJO" value="" required max="" onkeydown="return false" onblur="">
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkaperturaJO" onclick="fechaNoIdent('#chkaperturaJO', '#aperturaJO')">
                                    <label>No identificada</label>
                                </div>
                            </td>
                            <td>
                                <label for="audienciaJO">Fecha de la audiencia de juicio</label>
                                <input type="date" name="audienciaJO" id="audienciaJO" value="" required max="" onkeydown="return false" onblur="">
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkaudienciaJO" onclick="fechaNoIdent('#chkaudienciaJO', '#audienciaJO')">
                                    <label>No identificada</label>
                                </div>
                            </td> 
                            </tr> 
                            <tr>
                            <td colspan="4" style="text-align: center;">
                                <fieldset> 
                                    <label for="medidasJO">¿Se aplicaron medidas disciplinarias en la audiencia?</label>
                                    <select  name="medidasJO" id="medidasJO" required>
                                        <option value="">--Seleccione--</option>
                                        <%                                        lista = cat.findFuero();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if (ls[0].equals(0)) {
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>
                                    </select>
                                    <div class="oculto" id="incidenteJO">
                                        <label for="incidenteJO">¿Por quién fue promovido el incidente?</label>
                                        <select  name="incidenteJO" id="incidenteJO" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findFuero();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if (ls[0].equals(0)) {
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>
                                        </select>      
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: center;">
                             <fieldset>    
                             <label for="tipoPruebasJO">¿Se promovieron incidentes dentro de la audiencia?</label>
                             <select  name="incidenciasJO" id="incidenciasJO" required>
                                    <option value="">--Seleccione--</option>
                                    <%  
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if (ls[0].equals(0)) {
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                                <div class="oculto" id="incidenteJO">
                            <input type="date" name="audienciaJO" id="audienciaJO" value="" required max="" onkeydown="return false" onblur="">
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkincidenteJO" onclick="fechaNoIdent('#chkincidenteJO', '#audienciaJO')">
                                    <label>No identificada</label>
                                </div>
                            <label for="incidenteJO">¿Por quién fue promovido el incidente?</label>
                            <select  name="incidenteJO" id="incidenteJO" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findMedidasDisciplinarias();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if (ls[0].equals(0)) {
                                            out.println(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %>
                            </select>      
                        </div>
                         </fieldset>    
                       </td>  
                       </tr>
                      <tr>
                       <td>
                         <label for="pruebasJO">Tipos de pruebas desahogadas durante la audiencia</label>  
                           
                       </td> 
                        </tr>
                    </table>  
                </fieldset>
            </form>
        </section>
    </body>
</html>
