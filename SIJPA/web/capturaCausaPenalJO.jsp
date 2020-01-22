<%-- 
    Document   : causasPenalesJO
    Created on : 15/01/2020, 09:22:30 AM
    Author     : CESAR.OSORIO
--%>
<%@page import="clasesAuxiliar.showCausasPenalesJO"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Captura Causa Penal Juicio Oral</title>
        <%@include file="librerias.jsp" %>
        <%
            catalogos cat = new catalogos();
             showCausasPenalesJO jue = new showCausasPenalesJO();
            ArrayList<String[]> lista;
            ArrayList<String> li;
        %>
    </head>
    <body>
        <section class="contenedor" style="zoom: .9;">
            <h2>Causa Penal en Juicio Oral</h2>
            <form  method="post" name="formCPJO" id="formCPJO">
                <fieldset>
                    <legend>CARACTERÍSTICAS DEL EXPEDIENTE DE LA CAUSA PENAL</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="4">
                                <div class="cols">
                                    <label for="juzgadoClaveJO">Juzgado Clave:  </label> <br>
                                    <select name="juzgadoClaveJO" id="juzgadoClaveJO" class="txtLong" onchange="llenaCausaJO('#juzgadoClaveJO','#causaClaveJC')" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = jue.findJuzgados();
                                            for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + "</option>");
                                            }
                                        %>  
                                    </select>
                                </div>
                                <div class="cols">
                                    <label for="CarpInves">Número de asunto asignado a la causa penal en la etapa de control</label>
                                    <select name="claveJC" id="causaClaveJC" class="txtLong" onchange="llenaElementosCPJC('#juzgadoClaveJO','#causaClaveJC','#TdelitosJO','#TadolescentesJO','#TvictimasJO')" required>
                                        <option value="">--Seleccione--</option>
                                        
                                    </select>
                                </div>
                                <div class="cols">
                                    <label for="expClave">Número de asunto asignado a la causa penal en juicio oral</label>
                                    <input type="text" name="expClaveJO" id="expClaveJO" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="fIngreso">Fecha de ingreso</label>
                                <input type="date" name="fIngresoJO" id="fIngresoJO" class="txtMedia" required>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkFechaIngreJO" onclick="fechaNoIdent('#chkFechaIngreJO', '#fIngresoJO')"><label>No identificada</label>
                                </div>
                            </td>
                            <td>
                                <label for="TdelitosJO">Total de delitos</label>
                               <select class="txtMedia" name="TdelitosJO" id="TdelitosJO" required>
                                    <option value="">--Seleccione--</option>
                                     <%
//                                          lista = jue.findTotalDelitos((String) causaClaveJC );
//                                        for (String[] ls : lista) {
//                                            out.println("<option value=" + ls + ">" + ls + "</option>");
//                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="TadolescentesJO">Total de imputados</label>
                                <select class="txtMedia" name="TadolescentesJO" id="TadolescentesJO" required>
                                    <option value="">--Seleccione--</option>
                                     <%
//                                          lista = jue.findTotalProce((String) causaClaveJC );
//                                        for (String[] ls : lista) {
//                                            out.println("<option value=" + ls + ">" + ls + "</option>");
//                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="TvictimasJO">Total de víctimas</label>
                                <select class="txtMedia" name="TvictimasJO" id="TvictimasJO" required>
                                    <option value="">--Seleccione--</option>
                                      <%
//                                          lista = jue.findTotalVicti((String) causaClaveJC );
//                                        for (String[] ls : lista) {
//                                            out.println("<option value=" + ls + ">" + ls + "</option>");
//                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div class="cols">
                                    <label for="Pparticular" >¿La causa penal registrada fue atendida por un órgano jurisdiccional diferente al que registró inicialmente? </label>
                                    <select name="difeOrgano" id="difeOrgano" class="txtLong" required >
                                        <option value="">--Seleccione--</option>
                                        <%  lista = cat.findRespuestaSimple();
                                            for (int x = 0; x < 3; x++) {
                                                out.println("<option value='" + lista.get(x)[0] + "'>" + lista.get(x)[0] + ".- " + lista.get(x)[1] + "</option>");
                                            }
                                        %>  
                                    </select>
                                </div>
                            </td>
                        </tr>

                    </table>
                </fieldset>
                <fieldset class="oculto" name="juezatender" id="juezatender">
                    <legend>DATOS DE LOS JUECES/ZAS ENCARGADOS DE ATENDER LA CAUSA PENAL </legend>
                    
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                  <label for="Tvictimas">Cantidad de jueces a quien corresponde conocer de la causa</label>
                                <select name="jueznumero" id="jueznumero" class="txtMedia" required>
                                        <option value="">--Seleccione--</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                </select>
                            </td>
                            <td class="oculto" id="nomJuez1">
                                <label for="CarpInves">Nombre del Juez 1</label>
                                    <select name="juez1" id="juez1" class="txtLong dependiente" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                                                        
                                        %>  
                                    </select>
                            </td>
                            <td class="oculto" id="nomJuez2">
                                <label for="CarpInves">Nombre del Juez 2</label>
                                    <select name="juez2" id="juez2" class="txtLong dependiente" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                                                        
                                        %>  
                                    </select>
                            </td>
                            <td  class="oculto" id="nomJuez3">
                                <label for="CarpInves">Nombre del Juez 3</label>
                                    <select name="juez3" id="juez3" class="txtLong dependiente" required>
                                        <option value="">--Seleccione--</option>
                                        <%
                                                                        
                                        %>  
                                    </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"  class="oculto" id="nomJuezespec">
                                 <label for="Tvictimas">Otro juez   Especificar:</label>
                                <input type="text" name="juezEspecificar" id="juezEspecificar" class="txtLong dependiente">
                            </td>
                        </tr>
                    </table>
                </fieldset>
                                     <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="ComentaExpeJO" id="ComentaExpeJO"></textarea>
                </div>
                <br>
                <input type="submit" name="guardarExpJO" id="guardarExpJO" value="Guardar"> 
            </form>
        </section>
    </body>
</html>
