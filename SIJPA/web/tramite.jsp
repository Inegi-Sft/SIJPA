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
            String distrito =(String) sesion.getAttribute("distrito");
            String numero =(String) sesion.getAttribute("numero");
            String jConcatenado =entidad+municipio+distrito+numero;
            String expediente =(String) sesion.getAttribute("expediente");
        %>
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor">
            <h1>Pendientes de resolución </h1>
            <form action="" method="post" id="formTramite" name="formTramite">
                <!--<center>-->
                <fieldset >
                    <legend style="text-align: left;">Estatus</legend>

                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="idProcesado">Id Adolescente</label>
                                <select name="idProcesado" id="idProcesado" class="lblExBig" required>
                                    <option value="">--Seleccione--</option>
                                    <%  lista = proce.findProcesadoExp(expediente+jConcatenado);
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0].replace(jConcatenado, "") + ".- " + ls[1] + "</option>");
                                        }
                                    %>     
                                </select>
                            </td>

                            <td>
                                <label for="eProcesal">Etapa procesal</label>
                                <select name="eProcesal" id="eProcesal" class="txtMedia" required>
                                    <option value="">--Seleccione--</option>
                                     <%
                                        lista = cat.findEtapaProcesal();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'>" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>    
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="eMotivo">Especifique el motivo</label>
                                <input type="text" name="eMotivo"  id="eMotivo" class="txtLong" required  />
                            </td>
                            <td>
                                <label for="uActua">Fecha de la última actuación</label>

                                <input type="date" name="uActua" id="uActua" class="txtMedia" required>
                                <div class="noIdentificada">
                                    <input type="checkbox" id="chkOcurrencia" onclick="fechaNoIdent('#chkOcurrencia', '#uActua');"><label>No identificada</label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br>
                <input type="submit" name="guardar" id="guardarTram" value="Guardar">
            </form>
        </section>
    </body>
</html>
