<%-- 
    Document   : tramite
    Created on : 3/10/2019, 09:32:06 AM
    Author     : CESAR.OSORIO
--%>
<%@page import="clasesAuxiliar.FechaMax"%>
<%@page import="clasesAuxiliar.showTramiteJO"%>
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
        <script type="text/javascript" src="js/funcionesTramJO.js"></script>
        <%  
            catalogos cat = new catalogos();
            showTramiteJO sTramite = new showTramiteJO();
            ArrayList<String[]> lista, tramite = new ArrayList();
            FechaMax fecha =new FechaMax();
            String fechas= fecha.FechaValida();
            
            String proceClave = "", posicion = "", edicion = "";
            if (request.getParameter("proceClave") != null || request.getParameter("posicion") != null) {
                proceClave = request.getParameter("proceClave");
                posicion = request.getParameter("posicion");
            }
            
            String juzgadClave = (String) session.getAttribute("juzgadoClave");
            String jDividido[] = juzgadClave.split("-"); //Esto separa en un array basandose en el separador que le pases
            String jEntidadJO = jDividido[0];
            String jMunicipioJO = jDividido[1];
            String jNumeroJO = jDividido[2];
            String jConcatenado = jEntidadJO + jMunicipioJO + jNumeroJO;
            String causaClave = (String) session.getAttribute("causaClave");
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String etapaProcesalJO = "";
            String estatusJO="";
            String especifiJO = "";
            String fechaActoJO = "";
            if(request.getParameter("edita") != null){//Sabremos si es para edicion de datos o captura de datos
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    tramite = sTramite.findTramiteJO(causaClave, proceClave + jConcatenado);
                    if(tramite.size() > 0){
                        operacion = "actualizar";
                        etapaProcesalJO ="Juicio Oral";
                        estatusJO=tramite.get(0)[0];
                        especifiJO = tramite.get(0)[1];
                        fechaActoJO = tramite.get(0)[2];
                    }
                }
            }
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor">
            <h1>Pendientes de resolución </h1>
            <form action="tramiteJO.jsp" method="post" id="formTramiteJO" name="formTramiteJO">
                <fieldset>
                    <legend>Estatus</legend>
                    <label for="idProcesado">Id Adolescente</label>
                    <input type="text" name="proceClave" id="proceClave" value="<%=proceClave%>" readonly>
                    <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>">
                    <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                    <fieldset class="subField">
                        <div class="cols">
                            <label for="eProcesal">Etapa procesal</label>
                            <select name="eProcesal" id="eProcesalJO" disabled required>
                                <option value="">1.-Juicio Oral</option>
                            </select>
                        </div>
                        <div class="cols" id="dEstInvestiJO">
                            <label for="estInvestiJO" class="lblExBig">Estatus para la etapa de investigación</label>
                            <select name="estInvestiJO" id="estInvestiJO">
                                 <option value="">--Seleccione--</option>
                                 <%
                                    lista = cat.findEstatus();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(estatusJO)){
                                            out.println(" selected ");
                                        }
                                        out.println( ">" + ls[0]+ ".- " + ls[1] + "</option>");
                                    }
                                %>    
                            </select>
                        </div>
                        <div class="cols oculto" id="dEspecifiqueJO">
                            <label for="especifiqueJO">Especifique</label>
                            <input type="text" name="especifiqueJO"  id="especifiqueJO" value="<%=especifiJO%>">
                        </div>
                    </fieldset>
                    <div class="cols">
                        <label for="uActo">Fecha del último acto procesal</label>
                        <input type="date" name="uActo" id="uActoJO" value="<%=fechaActoJO%>" max="<%=fechas%>" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkUActoJO" onclick="fechaNoIdent('#chkUActoJO', '#uActoJO');">
                            <label>No identificada</label>
                        </div>
                    </div>
                </fieldset>
                <br>
                <input type="submit" name="guardar" id="guardarTram" value="Guardar">
            </form>
        </section>
    </body>
</html>
