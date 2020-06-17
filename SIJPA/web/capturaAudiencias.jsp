<%-- 
    Document   : capturaAudiencias
    Created on : 3/04/2020, 12:31:03 PM
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
        <title>SIJPA::Captura Audiencias</title>
        <link type="image/png" href="img/logo_sijpa64.png" rel="icon"/>
        <link type="text/css" href="css/principal.css" rel="stylesheet"/>
        <link type="text/css" href="css/cabecera.css" rel="stylesheet"/>
        <link type="text/css" href="css/audiencias.css" rel="stylesheet"/>
        <link type="text/css" href="css/selectize.bootstrap2.css" rel="stylesheet"/>
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/menu.js"></script>
        <script type="text/javascript" src="js/fnAudiencias.js"></script>
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
            
            if(request.getParameter("causaClave") != null){//Si viene la causa penal, recuperamos datos
                String causaClave = request.getParameter("causaClave");
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
            <a class="btnCerrar" id="btnCerrar" title="Cerrar" href="audiencias.jsp" >X</a>
            <h1>Captura Audiencias</h1>
            <form  method="post" action="capturaAudiencias.jsp" name="formAudiencias" id="formAudiencias">
                <fieldset>
                    <legend>Datos generales de las Audiencias</legend>
                    <input type="hidden" name="operacion" id="operacion" value="<%=operacion%>">
                    <div class="cols">
                        <label for="juzgadoClave">Juzgado Clave: </label> 
                        <input type="text" name="juzgadoClave" id="juzgadoClave" value="<%=juzgadoClave%>" disabled required>
                    </div>
                    <div class="cols">
                        <label for="causaClave">Causa Penal:</label>
                    <%
                        String juzLimpio = juzgadoClave.replace("-", "");
                        if(request.getParameter("causaClave") == null){
                            out.println("<select class='demo-default txtLong' name='causaClave' id='causaClave' required>");
                            out.println("<option value=''>--Seleccione--</option>");
                                lista = sA.findCausasJC(juzgadoClave);
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'>" + ls[0].replace(juzLimpio, "") + "</option>");
                                }
                            out.println("</select>");
                        }else{
                            out.println("<input type='text' name='causaClave' value='"+causa.replace(juzLimpio, "")+"' readonly />");
                        }
                    %>
                    </div>
                    <fieldset id="fstJueces">
                        <legend>Jueces que celebraron la audiencia</legend>
                        <div id="dJueces">
                        <%
                            jueces = sA.recuperaJuez(juzgadoClave, causa);//para recuperar datos de jueces
                            lista = sA.findJueces(juzgadoClave);
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
                        %>
                        </div>
                    </fieldset>
                    <span id="msjAudi">Puedes seleccionar hasta 3 jueces</span>   
                    <label class="lblExBig">Audiencias por etapas del proceso:</label>
                    <table id="tblAudiInves" border="1" class="tablasRegis colsA">
                        <tr>
                            <th>Id</th>
                            <th>Investigación</th>
                            <th>Aplica</th>
                            <th>Fecha celebración</th>
                            <th>Duracion Hrs.</th>
                        </tr>
                        <%

                        lista = cat.findAudienciasInvestigacion();
                        for (String[] ls : lista) {
                            audi = sA.recuperaAudiencias(juzgadoClave, causa,"INVESTIGACION",ls[0]);
                            if(audi.size() != 0){
                        %>
                            <tr>
                                <td><%=ls[0]%></td>
                                <td><%=ls[1]%></td>
                                <td>
                                    <input type="checkbox" name="chkInves" id="chkInves<%=ls[0]%>" value="<%=ls[0]%>" onchange="habilitaTxt(this,'#fechaInves<%=ls[0]%>','#duracionInves<%=ls[0]%>','#chkFNI<%=ls[0]%>','#chkDNI<%=ls[0]%>')" checked/>
                                </td>
                                <td>
                                    <input type="date" name="fechaInves" id="fechaInves<%=ls[0]%>" class="audiFecha" value="<%=audi.get(0)[1]%>" <%if(audi.get(0)[1].equals("1899-09-09")){%>readonly<%}%>/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkFNI<%=ls[0]%>" onclick="fechaNI(this, '#fechaInves<%=ls[0]%>')" <%if(audi.get(0)[1].equals("1899-09-09")){%>checked<%}%>/>N/I
                                    </div>
                                </td>
                                <td>
                                    <input type="time" name="duracionInves" id="duracionInves<%=ls[0]%>" class="tiempo" value="<%=audi.get(0)[2]%>" <%if(audi.get(0)[2].equals("09:09:00")){%>readonly<%}%>/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkDNI<%=ls[0]%>" onclick="duracionNI(this, '#duracionInves<%=ls[0]%>')" <%if(audi.get(0)[2].equals("09:09:00")){%>checked<%}%>/>N/I
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
                                    <input type="checkbox" name="chkInves" id="chkInves<%=ls[0]%>" value="<%=ls[0]%>" onchange="habilitaTxt(this,'#fechaInves<%=ls[0]%>','#duracionInves<%=ls[0]%>','#chkFNI<%=ls[0]%>','#chkDNI<%=ls[0]%>')" />
                                </td>
                                <td>
                                    <input type="date" name="fechaInves" id="fechaInves<%=ls[0]%>" class="audiFecha" disabled/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkFNI<%=ls[0]%>" onclick="fechaNI(this, '#fechaInves<%=ls[0]%>')" disabled>N/I
                                    </div>
                                </td>
                                <td>
                                    <input type="time" name="duracionInves" id="duracionInves<%=ls[0]%>" class="tiempo" disabled/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkDNI<%=ls[0]%>" onclick="duracionNI(this, '#duracionInves<%=ls[0]%>')" disabled>N/I
                                    </div>
                                </td>
                            </tr>
                    <%
                        }
                    }

                    %>
                    </table>
                    <br/>
                    <table id="tblAudiInter" border="1" class="tablasRegis colsA">
                        <tr>
                            <th>Id</th>
                            <th>Intermedia</th>
                            <th>Aplica</th>
                            <th>Fecha celebración</th>
                            <th>Duracion</th>
                        </tr>
                    <%
                    lista = cat.findAudienciasIntermedia();
                    for (String[] ls : lista) {
                        audi=sA.recuperaAudiencias(juzgadoClave, causa,"INTERMEDIA",ls[0]);
                        if(audi.size() != 0){
                    %>
                            <tr>
                                <td><%=ls[0]%></td>
                                <td><%=ls[1]%></td>
                                <td>
                                    <input type="checkbox" name="chkInter" id="chkInter<%=ls[0]%>" value="<%=ls[0]%>" onchange="habilitaTxt(this,'#fechaInter<%=ls[0]%>','#duracionInter<%=ls[0]%>','#chkFNII<%=ls[0]%>','#chkDNII<%=ls[0]%>')" checked/>
                                </td>
                                <td>
                                    <input type="date" name="fechaInter" id="fechaInter<%=ls[0]%>" class="audiFecha" value="<%=audi.get(0)[1]%>" <%if(audi.get(0)[1].equals("1899-09-09")){%>readonly<%}%>/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkFNII<%=ls[0]%>" onclick="fechaNI(this, '#fechaInter<%=ls[0]%>')" <%if(audi.get(0)[1].equals("1899-09-09")){%>checked<%}%>/>N/I
                                    </div>
                                </td>
                                <td>
                                    <input type="time" name="duracionInter" id="duracionInter<%=ls[0]%>" class="tiempo" value="<%=audi.get(0)[2]%>" <%if(audi.get(0)[2].equals("09:09:00")){%>readonly<%}%>/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkDNII<%=ls[0]%>" onclick="duracionNI(this, '#duracionInter<%=ls[0]%>')" <%if(audi.get(0)[2].equals("09:09:00")){%>checked<%}%>/>N/I
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
                                    <input type="checkbox" name="chkInter" id="chkInter<%=ls[0]%>" value="<%=ls[0]%>" onchange="habilitaTxt(this,'#fechaInter<%=ls[0]%>','#duracionInter<%=ls[0]%>','#chkFNII<%=ls[0]%>','#chkDNII<%=ls[0]%>')" />
                                </td>
                                <td>
                                    <input type="date" name="fechaInter" id="fechaInter<%=ls[0]%>" class="audiFecha" disabled/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkFNII<%=ls[0]%>" onclick="fechaNI(this, '#fechaInter<%=ls[0]%>')" disabled>N/I
                                    </div>
                                </td>
                                <td>
                                    <input type="time" name="duracionInter" id="duracionInter<%=ls[0]%>" class="tiempo" disabled/>
                                    <div class="noIden">
                                        <input type="checkbox" id="chkDNII<%=ls[0]%>" onclick="duracionNI(this, '#duracionInter<%=ls[0]%>')" disabled>N/I
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
