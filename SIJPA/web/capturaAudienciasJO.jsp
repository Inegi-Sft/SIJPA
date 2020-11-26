<%-- 
    Document   : capturaAudiencias
    Created on : 14/05/2020, 12:31:03 PM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.showAudiencias"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Captura AudienciasJO</title>
        <link type="image/png" href="img/logo_sijpa64.png" rel="icon"/>
        <link type="text/css" href="css/principal.css" rel="stylesheet"/>
        <link type="text/css" href="css/cabecera.css" rel="stylesheet"/>
        <link type="text/css" href="css/audiencias.css" rel="stylesheet"/>
        <link type="text/css" href="css/selectize.bootstrap2.css" rel="stylesheet"/>
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/menu.js"></script>
        <script type="text/javascript" src="js/fnAudienciasJO.js"></script>
        <script type="text/javascript" src="js/selectize.js"></script>
        <%
            catalogos cat = new catalogos();
            showAudiencias sA = new showAudiencias();
            ArrayList<String[]> lista;
            
            String juzgadoClave = (String)session.getAttribute("juzgadoClave");
            
            //variables para recuperar datos
            ArrayList<String[]> jueces, audi;
            String causa = "";
            String operacion = "insertar";
            
            if(request.getParameter("causaClaveJO") != null){//Si viene la causa penal, recuperamos datos
                String causaClave = request.getParameter("causaClaveJO");
                causa=causaClave;
                operacion="actualizar";
            }

        %>
    </head>
    <body>
        <%@include file="cabecera.jsp"%>
        <%@include file="menu.jsp"%>
        <section class="contenedor">
            <div class="toggle-nav">
                <div class="toggle-nav-inner"></div>
            </div>
        <a class="btnCerrar" id="btnCerrar" title="Cerrar" href="audienciasJO.jsp" >X</a>
        <h1>Captura Audiencias JO</h1>
        <form  method="post" action="capturaAudienciasJO.jsp" name="formAudienciasJO" id="formAudienciasJO">
            <fieldset>
                <legend>Datos generales de las Audiencias</legend>
                <input type="hidden" name="operacion" id="operacion" value="<%=operacion%>">
                <div class="cols">
                    <label for="juzgadoClave">Juzgado Clave: </label> 
                    <input type="text" name="juzgadoClave" id="juzgadoClave" value="<%=juzgadoClave%>" disabled required>
                </div>
                <div class="cols">
                    <label for="causaClaveJO">Causa Penal:</label>
                <%
                    String juzLimpio = juzgadoClave.replace("-", "");
                    if(request.getParameter("causaClaveJO") == null){
                        out.println("<select class='demo-default txtLong' name='causaClaveJO' id='causaClaveJO' required>");
                        out.println("<option value=''>--Seleccione--</option>");
                            lista = sA.findCausasJO(juzgadoClave);
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "' data-data='{\"causajc\":\"" + ls[1] +"&"+ ls[2]+"\"}'>" + ls[0].replace(juzLimpio, "") + "</option>");
                            }
                        out.println("</select>");
                    }else{
                        out.println("<input type='text' name='causaClaveJO' value='"+causa.replace(juzLimpio, "")+"' readonly />");
                    }
                %>
                </div>
                <fieldset id="fstJueces"><legend>Jueces que celebraron la audiencia</legend>
                    <div id="dJueces">
                        <a href="capturaJuez.jsp" class="addJuez">
                            <img src="img/add.png" title="Agregar Juez"> Agregar Juez
                        </a>
                    <%
                        jueces=sA.recuperaJuezJO(juzgadoClave, causa);//para recuperar datos de jueces
                        lista = sA.findJuecesJO(juzgadoClave, causa, operacion);
                        for (String[] ls : lista){ 
                            if(jueces.size() != 0){
                                if(ls[0].equals(jueces.get(0)[0]) || ls[0].equals(jueces.get(0)[1]) || ls[0].equals(jueces.get(0)[2])){
                                    out.println("<input type='checkbox' name='chkJuez' onchange='cuenta(this)' value='"+ ls[0] +"' checked/>"+ ls[1] +" "+ ls[2] +" "+ ls[3] +"<br>");
                                }else{
                                    out.println("<input type='checkbox' name='chkJuez' onchange='cuenta(this)' value='"+ ls[0] +"'/>"+ ls[1] +" "+ ls[2] +" "+ ls[3] +"<br>");
                                }
                            }else{
                                out.println("<input type='checkbox' name='chkJuez' onchange='cuenta(this)' value='"+ ls[0] +"'/>"+ ls[1] +" "+ ls[2] +" "+ ls[3] +"<br>");
                            }
                        }
                        if(lista.isEmpty()){
                           out.println("No hay Jueces para mostrar"); 
                        }
                        if(operacion.equals("actualizar")){
                           //Deshabilita el juez que que llevo las audiencias en jc
                            String causaJC= sA.recuperaCausaJC(causa, juzgadoClave);
                            int juezAtendio= sA.findJuezAtendioJC(causaJC, juzgadoClave);
                            out.println("<script>$('input[name=\"chkJuez\"][value="+juezAtendio+"]').prop(\"disabled\",true);</script>");
                        }
                    %>
                    </div>
                </fieldset>
                <span id="msjAudi">Puedes seleccionar hasta 3 jueces</span>   
                <label class="lblExBig">Audiencias por etapas del proceso:</label>
                <table id="tblAudiJO" border="1" class="tablasRegis colsA">
                    <tr>
                        <th>Id</th>
                        <th>Juicio Oral</th>
                        <th>Aplica</th>
                        <th>Fecha celebración</th>
                        <th>Duracion Hrs.</th>
                    </tr>
                <%
                    
                lista = cat.findAudienciasJuicioOral();
                for (String[] ls : lista) {
                    audi=sA.recuperaAudienciasJO(juzgadoClave, causa, ls[0]);
                    if(audi.size() != 0){
                %>
                        <tr>
                            <td><%=ls[0]%></td>
                            <td><%=ls[1]%></td>
                            <td>
                                <input type="checkbox" name="chkJO" id="chkJO<%=ls[0]%>" value="<%=ls[0]%>" onchange="habilitaTxt(this,'#fechaJO<%=ls[0]%>','#hrsJO<%=ls[0]%>','#minJO<%=ls[0]%>','#chkFNI<%=ls[0]%>','#chkDNI<%=ls[0]%>')" checked/>
                            </td>
                            <td>
                                <input type="date" name="fechaJO" id="fechaJO<%=ls[0]%>" class="audiFecha" value="<%=audi.get(0)[1]%>" <%if(audi.get(0)[1].equals("1899-09-09")){%>readonly<%}%>/>
                                <div class="noIden">
                                    <input type="checkbox" id="chkFNI<%=ls[0]%>" onclick="fechaNI(this, '#fechaJO<%=ls[0]%>')" <%if(audi.get(0)[1].equals("1899-09-09")){%>checked<%}%>/>N/I
                                </div>
                            </td>
                            <td>
                                <input type="number" name="hrsJO" id="hrsJO<%=ls[0]%>" class="tiempo" value="<%=audi.get(0)[2]%>" <%if(audi.get(0)[2].equals("99")){%>readonly<%}%>/>:
                                <input type="number" name="minJO" id="minJO<%=ls[0]%>" class="tiempo" value="<%=audi.get(0)[3]%>" <%if(audi.get(0)[3].equals("99")){%>readonly<%}%>/>
                                <div class="noIden">
                                    <input type="checkbox" id="chkDNI<%=ls[0]%>" onclick="duracionNI(this, '#hrsJO<%=ls[0]%>','#minJO<%=ls[0]%>')" <%if(audi.get(0)[2].equals("09:09:00")){%>checked<%}%>/>N/I
                                </div>
                            </td>
                        </tr>
                <%
                    }else{
                %>
                        <tr>
                            <td><%=ls[0]%></td>
                            <td><%=ls[1]%></td>
                            <td>
                                <input type="checkbox" name="chkJO" id="chkJO<%=ls[0]%>" value="<%=ls[0]%>" onchange="habilitaTxt(this,'#fechaJO<%=ls[0]%>','#hrsJO<%=ls[0]%>','#minJO<%=ls[0]%>','#chkFNI<%=ls[0]%>','#chkDNI<%=ls[0]%>')" />
                            </td>
                            <td>
                                <input type="date" name="fechaJO" id="fechaJO<%=ls[0]%>" class="audiFecha" disabled/>
                                <div class="noIden">
                                    <input type="checkbox" id="chkFNI<%=ls[0]%>" onclick="fechaNI(this, '#fechaJO<%=ls[0]%>')" disabled>N/I
                                </div>
                            </td>
                            <td>
                                <input type="number" name="hrsJO" id="hrsJO<%=ls[0]%>" class="tiempo" disabled/>:
                                <input type="number" name="minJO" id="minJO<%=ls[0]%>" class="tiempo" disabled/>
                                <div class="noIden">
                                    <input type="checkbox" id="chkDNI<%=ls[0]%>" onclick="duracionNI(this, '#hrsJO<%=ls[0]%>','#minJO<%=ls[0]%>')" disabled>N/I
                                </div>
                            </td>
                        </tr>
                <%
                    }
                }

                %>
                </table>
            </fieldset>
            <input type="submit" name="guardar" value="Guardar" />
        </form>
        </section>
    </body>
</html>
