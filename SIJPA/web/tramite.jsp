<%-- 
    Document   : tramite
    Created on : 3/10/2019, 09:32:06 AM
    Author     : CESAR.OSORIO
--%>
<%@page import="clasesAuxiliar.showProcesados"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Pendientes de resolución </title>
        <%@include file="librerias.jsp" %>
    </head>
    <body style="zoom: .9;">
        <%
            HttpSession sesion= request.getSession();
            
            catalogos cat = new catalogos();
            showProcesados proce=new showProcesados();
            ArrayList<String[]> lista = new ArrayList();
            
            String entidad =(String) sesion.getAttribute("entidad");
            String municipio =(String) sesion.getAttribute("municipio");
            String numero =(String) sesion.getAttribute("numero");
            String jConcatenado =entidad+municipio+numero;
            String causaClave =(String) sesion.getAttribute("causaClave");
        %>
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor">
            <h1>Pendientes de resolución </h1>
            <form action="" method="post" id="formTramite" name="formTramite">
                <fieldset >
                    <legend style="text-align: left;">Estatus</legend>

                    <label for="idProcesado">Id Adolescente</label>
                    <select name="idProcesado" id="idProcesado" class="lblExBig" required>
                        <option value="">--Seleccione--</option>
                        <%  lista = proce.findProcesadoExp(causaClave+jConcatenado);
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "'>" + ls[0].replace(jConcatenado, "") + ".- " + ls[1] + "</option>");
                            }
                        %>     
                    </select>
                    <br/>
                    <fieldset class="colsA subField">
                        <div class="cols">
                            <label for="eProcesal">Etapa procesal</label>
                            <select name="eProcesal" id="eProcesal" class="txtMedia" required onchange="etapaProcesal();">
                                <option value="">--Seleccione--</option>
                                 <%
                                    lista = cat.findEtapaProcesal();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %>    
                            </select>
                        </div>
                        <div class="cols oculto" id="dEstInvesti">
                            <label for="estInvesti">Estatus para la etapa de investigación</label>
                            <select name="estInvesti" id="estInvesti" class="txtMedia" onchange="ocultaEspecifique();">
                                <option value="">--Seleccione--</option>
                                 <%
                                    lista = cat.findEtapaInicial();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %>    
                            </select>
                        </div>
                        <div class="cols oculto" id="dEstIntermedia">
                            <label for="estIntermedia">Estatus para la etapa intermedia</label>
                            <select name="estIntermedia" id="estIntermedia" class="txtMedia" onchange="ocultaEspecifique();">
                                <option value="">--Seleccione--</option>
                                 <%
                                    lista = cat.findEtapaIntermedia();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %>    
                            </select>
                        </div>
                        <div class="cols oculto" id="dEspecifique">
                            <label for="especifique">Especifique</label>
                            <input type="text" name="especifique"  id="especifique" class="txtLong"/>
                        </div>
                    </fieldset>
                    <div class="cols">
                        <label for="uActo">Fecha del último acto procesal</label>
                        <input type="date" name="uActo" id="uActo" class="txtMedia" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkUActo" onclick="fechaNoIdent('#chkUActo', '#uActo');"><label>No identificada</label>
                        </div>
                    </div>
                </fieldset>
                <br>
                <input type="submit" name="guardar" id="guardarTram" value="Guardar">
            </form>
        </section>
    </body>
</html>
