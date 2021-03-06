<%-- 
    Document   : causasPenalesJO
    Created on : 15/01/2020, 09:22:30 AM
    Author     : CESAR.OSORIO
--%>
<%@page import="clasesAuxiliar.FechaMax"%>
<%@page import="clasesAuxiliar.showCausasPenales"%>
<%@page import="clasesAuxiliar.showJuzgados"%>
<%@page import="clasesAuxiliar.showJueces"%>
<%@page import="clasesAuxiliar.showCausasPenalesJO"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Captura Causa Penal Juicio Oral</title>
        <script type="text/javascript" src="js/funcionesCPJO.js?v=<%=(int)(Math.random()*10+1)%>"></script>
        <%
            catalogos cat = new catalogos();
            showJueces juez = new showJueces();
            showCausasPenalesJO causaPenalJO = new showCausasPenalesJO();
            FechaMax fecha =new FechaMax();
            String fechas= fecha.FechaValida();

            ArrayList<String[]> lista, lisCausaJC, lisCausaJO;
            ArrayList<String> lis;
            
            String juzgadoClaveJO = (String)session.getAttribute("juzgadoClave");
            String juzgadoClaveJC = "";
            String operacion = "";//Variable de control para saber si se inserta o se 
            String causaClaveJC = "";
            String causaClaveJO = "";
            String fechaIngresoJC = "";
            String fechaIngresoJO = "";
            String totDelitos = "";
            String totProce = "";
            String totVicti = "";
            String cantJueces = "";
            String juez1 = "";
            String juez2 = "";
            String juez3 = "";
            String comen = "";
            if(request.getParameter("causaClaveJO") != null){//Ya esta guardada la causa penal
                //Si viene la variable causa penales JO entonces recuperamos los datos
                juzgadoClaveJC = request.getParameter("juzClaveJC");
                causaClaveJO = request.getParameter("causaClaveJO");
                causaClaveJC = request.getParameter("causaClaveJC");
                lisCausaJO = causaPenalJO.findCausaPenalJO(juzgadoClaveJO, causaClaveJO + juzgadoClaveJO.replace("-", ""));
                if(lisCausaJO.size() > 0){
                    session.setAttribute("juzgadoClaveJC", juzgadoClaveJC);
                    session.setAttribute("causaClaveJO", causaClaveJO + juzgadoClaveJO.replace("-", ""));//Iniciamos variable de sesion con causa clave JO
                    session.setAttribute("causaClave", causaClaveJC + juzgadoClaveJC.replace("-", ""));//Iniciamos variable de sesion con causa clave JC
                    operacion = "actualizar";
                    //Recuperamos todo los datos de JO
                    fechaIngresoJC = lisCausaJO.get(0)[0];
                    fechaIngresoJO = lisCausaJO.get(0)[1];
                    totDelitos = lisCausaJO.get(0)[2];
                    totProce = lisCausaJO.get(0)[3];
                    totVicti = lisCausaJO.get(0)[4];
                    cantJueces = lisCausaJO.get(0)[5];
                    juez1 = lisCausaJO.get(0)[6];
                    juez2 = lisCausaJO.get(0)[7];
                    juez3 = lisCausaJO.get(0)[8];
                    comen = lisCausaJO.get(0)[9];
                }
            }else if(request.getParameter("causaClaveJC") != null){//Es nueva con recuperacion de JC del mismo juxgado
                //Si no trae JO entonces trae JC solamente y recuperamos datos de JC
                juzgadoClaveJC = request.getParameter("juzClaveJC");
                causaClaveJC = request.getParameter("causaClaveJC");
                lisCausaJC = causaPenalJO.findCausaPenalJC(juzgadoClaveJC, causaClaveJC + juzgadoClaveJC.replace("-", ""));
                if(lisCausaJC.size() > 0){
                    session.setAttribute("causaClave", causaClaveJC + juzgadoClaveJC.replace("-", ""));//Actualizamos variable de sesion con causa clave JC
                    //Solo recuperamos las necesarias que se comparten JC y JO
                    fechaIngresoJC = lisCausaJC.get(0)[0];
                    totDelitos = lisCausaJC.get(0)[1];
                    totProce = lisCausaJC.get(0)[2];
                    totVicti = lisCausaJC.get(0)[3];
                }
            }
        %>
    </head>
    <body>
        <section class="contenedor" style="zoom: .9;">
            <h2>Causa Penal en Juicio Oral</h2>
            <form  method="post" name="formCausaPenalJO" id="formCausaPenalJO">
                <fieldset>
                    <legend>Características de la Causa Penal</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td colspan="3">
                                <fieldset class="subField">
                                    <legend>Datos Juzgado de Control</legend>
                                    <div class="cols">
                                        <label for="jClaveJC">Juzgado Clave Juzgado Control</label>
                                        <%
                                            if(causaClaveJC != ""){
                                                out.println("<input type='text' name='jClaveJC' id='jClaveJC' value='" + juzgadoClaveJC + "' readonly>");
                                            }else{
                                                out.println("<select name='jClaveJC' id='jClaveJC'>");
                                                out.println("<option value=''>--Seleccione--</option>");
                                                lis = causaPenalJO.findJuzgadosEnJO(juzgadoClaveJO);
                                                for(String ls : lis) {
                                                    out.println("<option value='" + ls + "'>" + ls + "</option>");
                                                }
                                                out.println("</select>");
                                            }
                                        %>
                                    </div>
                                    <div class="cols">
                                        <label for="expClaveJC">No. Asunto Asignado Juzgado Control</label>
                                        <%
                                            if(causaClaveJC != ""){
                                                out.println("<input type='text' name='expClaveJC' id='expClaveJC' value='" + causaClaveJC + "' readonly>");
                                            }else{
                                                out.println("<select name='expClaveJC' id='expClaveJC' disabled>");
                                                out.println("<option value=''>--Seleccione--</option>");
                                                out.println("</select>");
                                            }
                                        %>
                                    </div>
                                    <div class="cols">
                                        <label for="fIngresoJC">Fecha de ingreso Juzgado Control</label>
                                        <input type="date" name="fIngresoJC" id="fIngresoJC" value="<%=fechaIngresoJC%>" max="<%=fechas%>" required readonly>
                                        <div class="noIdentificada">
                                            <input type="checkbox" id="chkFechaIngreJC" onclick="fechaNoIdent('#chkFechaIngreJC', '#fIngresoJC')" disabled>
                                            <label>No identificada</label>
                                        </div>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset class="subField">
                                    <legend>Datos Juicio Oral</legend>
                                    <div class="cols">
                                        <label for="jClaveJO">Juzgado Clave Juicio Oral</label>
                                        <input type="text" name="jClaveJO" id="jClaveJO" value="${sessionScope.juzgadoClave}" readonly>
                                        <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                                    </div>
                                    <div class="cols">
                                        <label for="expClaveJO">No. Asunto Asignado Juicio Oral</label>
                                        <input type="text" name="expClaveJO" id="expClaveJO" value="<%=causaClaveJO%>" maxlength="15" onkeypress="return validaMascara(event)" onblur="ValidaCarpeInvest('#expClaveJO')" placeholder="Ej: 00001/2020" required/>
                                    </div>
                                    <div class="cols">
                                        <label for="fIngresoJO">Fecha de ingreso Juicio Oral</label>
                                        <input type="date" name="fIngresoJO" id="fIngresoJO" value="<%=fechaIngresoJO%>" max="<%=fechas%>" required>
                                        <div class="noIdentificada">
                                            <input type="checkbox" id="chkFechaIngreJO" onclick="fechaNoIdent('#chkFechaIngreJO', '#fIngresoJO')">
                                            <label>No identificada</label>
                                        </div>
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="TdelitosJO">Total de delitos</label>
                                <input type="number" name="TdelitosJO" id="TdelitosJO" value="<%=totDelitos%>" min="<%=totDelitos%>">
                                <input type="hidden" name="TdelitosJC" id="TdelitosJC" value="<%=totDelitos%>">
                            </td>
                            <td>
                                <label for="TadolescentesJO">Total de imputados</label>
                                <input type="number" name="TadolescentesJO" id="TadolescentesJO" value="<%=totProce%>" min="<%=totProce%>">
                                <input type="hidden" name="TadolescentesJC" id="TadolescentesJC" value="<%=totProce%>">
                            </td>
                            <td>
                                <label for="TvictimasJO">Total de víctimas</label>
                                <input type="number" name="TvictimasJO" id="TvictimasJO" value="<%=totVicti%>" min="<%=totVicti%>">
                                <input type="hidden" name="TvictimasJC" id="TvictimasJC" value="<%=totVicti%>">
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset id="juezAtiende">
                    <legend>Atención de la Causa Penal</legend>
                    <table class="tablaFormu">
<!--                        <tr>
                            <td>
                                <label for="difeOrgano" class="txtExBig">¿La causa penal registrada fue atendida por un órgano jurisdiccional diferente al que registró inicialmente? </label>
                                <select name="difeOrgano" id="difeOrgano" required>
                                    <option value="">--Seleccione--</option>
                                    <%--
                                        lista = cat.findRespuestaSimple();
                                        for (int x = 0; x < 3; x++) {
                                            out.println("<option value='" + lista.get(x)[0] + "'");
                                            if(lista.get(x)[0].equals(orgDiferen)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + lista.get(x)[0] + ".- " + lista.get(x)[1] + "</option>");
                                        }
                                    --%>  
                                </select>
                            </td>
                        </tr>-->
                        <tr>
                            <td id="regCantJuez">
                                <!--Usamos un input invisible para recuperar el dato de cantidad jueces de BD y llenarlo con jquery-->
                                <input type="hidden" id="cantJuezHi" name="cantJuezHi" value="<%=cantJueces%>">
                                <label for="cantJuez" class="lblExBig">Cantidad de jueces a quien corresponde conocer de la Causa Penal</label>
                                <select name="cantJuez" id="cantJuez" required>
                                        <option value="">--Seleccione--</option>
                                        <option value="-2">-2</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="cols oculto" id="divJuezJO1">
                                    <label for="juezJO1">Nombre del Juez 1</label>
                                    <select name="juezJO1" id="juezJO1">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = juez.findJuezJO(juzgadoClaveJO, causaClaveJC , juzgadoClaveJC, causaClaveJO);
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(juez1)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[1] + "</option>");
                                            }
                                            out.println("<option value='100'>--Captura Juez--</option>");
                                        %>  
                                    </select>
                                </div>
                                <div class="cols oculto" id="divJuezJO2">
                                    <label for="juezJO2">Nombre del Juez 2</label>
                                    <select name="juezJO2" id="juezJO2">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = juez.findJuezJO(juzgadoClaveJO, causaClaveJC, juzgadoClaveJC, causaClaveJO);
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(juez2)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[1] + "</option>");
                                            }
                                            out.println("<option value='100'>--Captura Juez--</option>");
                                        %>  
                                    </select>
                                </div>
                                <div class="cols oculto" id="divJuezJO3">
                                    <label for="juezJO3">Nombre del Juez 3</label>
                                    <select name="juezJO3" id="juezJO3">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = juez.findJuezJO(juzgadoClaveJO, causaClaveJC, juzgadoClaveJC, causaClaveJO);
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(juez3)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[1] + "</option>");
                                            }
                                            out.println("<option value='100'>--Captura Juez--</option>");
                                        %>  
                                    </select>
                                </div>
<!--                                <div class="colsA oculto" id="divOrgDif">
                                    <label for="orgDif" class="lblExBig">Clave del Organo Jurisdiccional que atendió la Causa Penal</label>
                                    <select name="orgDif" id="orgDif">
                                        <option value="">--Seleccione--</option>
                                        <option value="-2">-2</option>
                                        <%--
                                            lis = juzgados.findJuzgadosDifJO(juzgadoClave);
                                            for (String ls : lis) {
                                                out.println("<option value='" + ls + "'");
                                                if(ls.equals(juzgaDif)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls + "</option>");
                                            }
                                            out.println("<option value='100'>--Captura Juzgado--</option>");
                                        --%>  
                                    </select>
                                </div>-->
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="ComentaExpeJO" id="ComentaExpeJO"><%=comen%></textarea>
                </div>
                <br>
                <input type="submit" name="guardarExpJO" id="guardarExpJO" value="Guardar"> 
            </form>
        </section>
    </body>
</html>
