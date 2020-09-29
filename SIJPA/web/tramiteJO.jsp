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
            
            String proceClaveJO = "", posicion = "", edicion = "";
            if (request.getParameter("proceClaveJO") != null || request.getParameter("posicion") != null) {
                proceClaveJO = request.getParameter("proceClaveJO");
                posicion = request.getParameter("posicion");
            }
            
            String juzgadClaveJO = (String) session.getAttribute("juzgadoClave");
            String causaClaveJO = (String) session.getAttribute("causaClaveJO");
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String estatusJO="";
            String especifiJO = "";
            String fechaActoJO = "";
            if(request.getParameter("edita") != null){//Sabremos si es para edicion de datos o captura de datos
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    tramite = sTramite.findTramiteJO(causaClaveJO, proceClaveJO + juzgadClaveJO.replace("-", ""));
                    if(tramite.size() > 0){
                        operacion = "actualizar";
                        estatusJO=tramite.get(0)[0];
                        especifiJO = tramite.get(0)[1];
                        fechaActoJO = tramite.get(0)[2];
                    }else{
                        out.println("<script>alert('Tramite " + proceClaveJO + " no encontrado dentro de la Causa Penal "  + causaClaveJO + "'); "
                                + "parent.$.fancybox.close();</script>");
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
                    <label for="idProcesado">Procesado Clave Juicio Oral</label>
                    <input type="text" name="proceClave" id="proceClave" value="<%=proceClaveJO%>" readonly>
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
                            <select name="estInvestiJO" id="estInvestiJO" required>
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
                        <input type="date" name="uActoJO" id="uActoJO" value="<%=fechaActoJO%>" max="<%=fechas%>" required>
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
