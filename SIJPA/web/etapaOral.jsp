<%-- 
    Document   : etapaOral
    Created on : 13/05/2020, 12:23:05 PM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="clasesAuxiliar.showJuicio"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Etapa Juicio Oral</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/fnEtapaOral.js?v=<%=(int)(Math.random()*10+1)%>"></script>
        <%
            catalogos cat = new catalogos();
            showJuicio eO = new showJuicio();
            ArrayList<String[]> lista, oral, pruebas;
            
            String proceClaveJO = "", posicion = "", edicion = "";
            if (request.getParameter("proceClaveJO") != null || request.getParameter("posicion") != null) {
                proceClaveJO = request.getParameter("proceClaveJO");
                posicion = request.getParameter("posicion");
            }
            
            String juzgadoClaveJO = (String) session.getAttribute("juzgadoClave");
            String causaClaveJO = (String) session.getAttribute("causaClaveJO");
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String autoApertura = "";
            String celebracionA = "";
            String medidasDis = "";
            String tipoMedida = "";
            String incidentes = "";
            String resoIncidente = "";
            String promueveIncidente = "";
            String nuevoMedio = "";
            String testimonial = "";
            String cantTesti = "";
            String pericial = "";
            String cantPeri = "";
            String declaracion = "";
            String cantDecla = "";
            String documental = "";
            String cantDocu = "";
            String otro = "";
            String cantOtro = "";
            String suspencionA = "";
            String fechaSuspencion = "";
            String fechaReanudacion = "";
            String deliberacion = "";
            String fechaDeliberacion = "";
            String sentidoFallo = "";
            String comen = "";
            
            //Consulta para extraer la informacion de intermedia
            String proceClaveJC = eO.findProcesadoJC(causaClaveJO, proceClaveJO + juzgadoClaveJO.replace("-", ""));
            pruebas = eO.findPruebasIntermedia(proceClaveJC);
            
            if(request.getParameter("edita") != null){//Sabremos si es para edicion de datos o captura de datos
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    oral = eO.findAllEtapaOral(causaClaveJO, proceClaveJO + juzgadoClaveJO.replace("-", ""));
                    if(oral.size() > 0){
                        operacion = "actualizar";
                        autoApertura = oral.get(0)[0];
                        celebracionA = oral.get(0)[1];
                        medidasDis = oral.get(0)[2];
                        tipoMedida = oral.get(0)[3];
                        incidentes = oral.get(0)[4];
                        resoIncidente = oral.get(0)[5];
                        promueveIncidente = oral.get(0)[6];
                        nuevoMedio = oral.get(0)[7];
                        testimonial = oral.get(0)[8];
                        cantTesti = oral.get(0)[9];
                        pericial = oral.get(0)[10];
                        cantPeri = oral.get(0)[11];
                        declaracion = oral.get(0)[12];
                        cantDecla = oral.get(0)[13];
                        documental = oral.get(0)[14];
                        cantDocu = oral.get(0)[15];
                        otro = oral.get(0)[16];
                        cantOtro = oral.get(0)[17];
                        suspencionA = oral.get(0)[18];
                        fechaSuspencion = oral.get(0)[19];
                        fechaReanudacion = oral.get(0)[20];
                        deliberacion = oral.get(0)[21];
                        fechaDeliberacion = oral.get(0)[22];
                        sentidoFallo = oral.get(0)[23];
                        comen = oral.get(0)[24];
                    }else{
                        out.println("<script>alert('Procesado " + proceClaveJO + " no encontrado dentro de la Causa Penal "  + causaClaveJO + "'); "
                                + "parent.$.fancybox.close();</script>");
                    }
                }
            }else{// es nueva insercion, traemos las pruebas de intermedia
                if(!pruebas.isEmpty()){
                    for(String[] ls: pruebas){
                        if(ls[0].equals("1")){
                            testimonial = "1";
                            cantTesti = ls[1];
                        }
                        if(ls[0].equals("2")){
                            pericial = "1";;
                            cantPeri = ls[1];
                        }
                        if(ls[0].equals("3")){
                            declaracion = "1";;
                            cantDecla = ls[1];
                        }
                        if(ls[0].equals("4")){
                            documental = "1";;
                            cantDocu = ls[1];
                        }
                        if(ls[0].equals("5")){
                            otro = "1";;
                            cantOtro = ls[1];
                        }
                    }
                }
            }
        %>
    </head>
    <body style="zoom: .9;">
        <section class="contenedor">
            <h1>Etapa Juicio Oral</h1>
            <form method="post" name="formJuicioO" id="fromJuicioO">
                <label for="idProcesado">Procesado Clave Juicio Oral</label>
                <input type="text" name="proceClave" id="proceClave" value="<%=proceClaveJO%>" readonly>
                <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>">
                <input type="hidden" name="opera" id="opera" value="<%=operacion%>">
                <fieldset>
                    <legend>Características de Juicio Oral</legend>
                    <div class="colsA" id="dApertura">
                        <label for="autoApertura">Fecha del auto de apertura a Juicio Oral</label>
                        <input type="date" name="autoApertura" id="autoApertura" value="<%=autoApertura%>" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkAutoApertura" onclick="fechaNoIdent('#chkAutoApertura', '#autoApertura')">
                            <label>No identificada</label>
                        </div> 
                    </div>
                    <div class="colsA" id="dCelebracionA">
                        <label for="celebracionA">Fecha de la celebración de la Audiencia de Juicio</label>
                        <input type="date" name="celebracionA" id="celebracionA" value="<%=celebracionA%>" required>
                        <div class="noIdentificada">
                            <input type="checkbox" id="chkCelebracionA" onclick="fechaNoIdent('#chkCelebracionA', '#celebracionA')">
                            <label>No identificada</label>
                        </div> 
                    </div>
                    <fieldset class="subField colsA">
                        <div class="colsA" id="dMedidasDis">
                            <label for="medidasDis">¿Se aplicaron medidas disciplinarias en la Audiencia?</label>
                            <select name="medidasDis" id="medidasDis" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(medidasDis)){
                                            out.println(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
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
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(tipoMedida)){
                                            out.println(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
                    <br/>
                    <fieldset class="subField colsA">
                        <div class="colsA">
                            <label for="incidentes">¿Se promovieron incidentes dentro de la Audiencia?</label>
                            <select name="incidentes" id="incidentes" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.println("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(incidentes)){
                                            out.println(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="cols oculto" id="dResoIncidente">
                            <label for="resoIncidente">Fecha de resolución del incidente</label>
                            <input type="date" name="resoIncidente" id="resoIncidente" value="<%=resoIncidente%>">
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
                                        out.print("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(promueveIncidente)){
                                            out.print(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
                    <br>    
                    <div class="colsA">
                        <label for="nueMedioPru">¿Se admitieron nuevos medios de pruebas?</label>
                        <select name="nueMedioPru" id="nueMedioPru" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(nuevoMedio)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %> 
                        </select>
                    </div>
                    <table class="tablasRegis" id="pruebasD" style="width: 600px">
                        <tr><th colspan="3">Tipos de pruebas desahogadas durante la Audiencia</th></tr>
                        <tr>
                            <td colspan="2"></td>
                            <td>Cantidad</td>
                        </tr>
                        <tr>
                            <td>Testimonial</td>
                            <td>
                                <select name="testimonial" id="testimonial" class="txtMedia" onchange="habilita(this,'#cantTesti')" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.print("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(testimonial)){
                                                out.print(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td><input type="number" name="cantTesti" id="cantTesti" class="txtMedia" value="<%=cantTesti %>" required/></td>
                        </tr>
                        <tr>
                            <td>Pericial</td>
                            <td>
                                <select name="pericial" id="pericial" class="txtMedia" onchange="habilita(this,'#cantPeri')" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.print("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(pericial)){
                                                out.print(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td><input type="number" name="cantPeri" id="cantPeri" class="txtMedia" value="<%=cantPeri %>" required/></td>
                        </tr>
                        <tr>
                            <td>Declaración del acusado</td>
                            <td>
                                <select name="declaracion" id="declaracion" class="txtMedia" onchange="habilita(this,'#cantDeclara')" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.print("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(declaracion)){
                                                out.print(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td><input type="number" name="cantDeclara" id="cantDeclara" class="txtMedia" value="<%=cantDecla %>" required/></td>
                        </tr>
                        <tr>
                            <td>Documental y material</td>
                            <td>
                                <select name="documental" id="documental" class="txtMedia" onchange="habilita(this,'#cantDocumen')" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.print("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(documental)){
                                                out.print(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td><input type="number" name="cantDocumen" id="cantDocumen" class="txtMedia" value="<%=cantDocu %>" required/></td>
                        </tr>
                        <tr>
                            <td>Otro tipo de prueba</td>
                            <td>
                                <select name="otro" id="otro" class="txtMedia" onchange="habilita(this,'#cantOtro')" required>
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.print("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(otro)){
                                                out.print(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td><input type="number" name="cantOtro" id="cantOtro" class="txtMedia" value="<%=cantOtro %>" required/></td>
                        </tr>
                    </table><br>     
                    <fieldset class="subField colsA">        
                        <div class="colsA">
                            <label for="suspencionA">¿Hubo suspensión de Audiencia de Juicio?</label>
                            <select name="suspencionA" id="suspencionA" required>
                                <option value="">--Seleccione--</option>
                                <%
                                    lista = cat.findRespuestaSimple();
                                    for (String[] ls : lista) {
                                        out.print("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(suspencionA)){
                                            out.print(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA oculto" id="dFechaSuspencion">
                            <label for="fechaSuspencion">Fecha en que se dictó suspensión de Audiencia de Juicio </label>
                            <input type="date" name="fechaSuspencion" id="fechaSuspencion" value="<%=fechaSuspencion%>">
                            <div class="noIdentificada">
                                <input type="checkbox" id="chkFechaSuspencion" onclick="fechaNoIdent('#chkFechaSuspencion', '#fechaSuspencion')">
                                <label>No identificada</label>
                            </div> 
                        </div>    
                        <div class="colsA oculto" id="dFechaReanudacion">
                            <label for="fechaReanudacion">Fecha en que se reanudo  la Audiencia de Juicio</label>
                            <input type="date" name="fechaReanudacion" id="fechaReanudacion" value="<%=fechaReanudacion %>">
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
                                        out.print("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(deliberacion)){
                                            out.print(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                        <div class="colsA oculto" id="dFechaDeliberacion">
                            <label for="fechaDeliberacion">Fecha de la deliberación y emisión del fallo</label>
                            <input type="date" name="fechaDeliberacion" id="fechaDeliberacion" value="<%=fechaDeliberacion%>">
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
                                        out.print("<option value='" + ls[0] + "'");
                                        if(ls[0].equals(sentidoFallo)){
                                            out.print(" selected ");
                                        }
                                        out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                    }
                                %> 
                            </select>
                        </div>
                    </fieldset>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="comentarios" id="comentarios"><%=comen %></textarea>
                </div>
                <br/>
                <input type="submit" name="guardar" value="Guardar" class="btnFlotante"/>
            </form>
        </section>
        <% 
            //variables auxiliares para extraer nuevamente las pruebas de intermedia
            String auxCantTesti="";
            String auxTestimonial="";
            String auxCantPeri="";
            String auxPericial="";
            String auxCantDecla="";
            String auxDeclaracion="";
            String auxCantDocu="";
            String auxDocumental="";
            String auxCantOtro="";
            String auxOtro="";
            if(!pruebas.isEmpty()){
                for(String[] ls: pruebas){
                    if(ls[0].equals("1")){
                        auxTestimonial = "1";
                        auxCantTesti = ls[1];
                        out.println("<input type='hidden' id='hideTesti' value='"+auxTestimonial+"'/>");
                        out.println("<input type='hidden' id='hideCantTesti' value='"+auxCantTesti+"'/>");
                    }
                    if(ls[0].equals("2")){
                        auxPericial = "1";;
                        auxCantPeri = ls[1];
                        out.println("<input type='hidden' id='hidePeri' value='"+auxPericial+"'/>");
                        out.println("<input type='hidden' id='hideCantPeri' value='"+auxCantPeri+"'/>");
                    }
                    if(ls[0].equals("3")){
                        auxDeclaracion = "1";;
                        auxCantDecla = ls[1];
                        out.println("<input type='hidden' id='hideDecla' value='"+auxDeclaracion+"'/>");
                        out.println("<input type='hidden' id='hideCantDecla' value='"+auxCantDecla+"'/>");
                    }
                    if(ls[0].equals("4")){
                        auxDocumental = "1";;
                        auxCantDocu = ls[1];
                        out.println("<input type='hidden' id='hideDocu' value='"+auxDocumental+"'/>");
                        out.println("<input type='hidden' id='hideCantDocu' value='"+auxCantDocu+"'/>");
                    }
                    if(ls[0].equals("5")){
                        auxOtro = "1";;
                        auxCantOtro = ls[1];
                        out.println("<input type='hidden' id='hideOtro' value='"+auxOtro+"'/>");
                        out.println("<input type='hidden' id='hideOtro' value='"+auxCantOtro+"'/>");
                    }
                }
            }
        %>
    </body>
</html>
