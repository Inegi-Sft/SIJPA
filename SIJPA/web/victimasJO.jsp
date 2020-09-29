<%-- 
    Document   : victimas
    Created on : 27/09/2019, 10:10:38 AM
    Author     : CESAR.OSORIO
--%>

<%@page import="clasesAuxiliar.showProcesadosJO"%>
<%@page import="clasesAuxiliar.showDelitosJO"%>
<%@page import="clasesAuxiliar.showVictimasJO"%>
<%@page import="clasesAuxiliar.FechaMax"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::VíctimasJO</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesVicJO.js"></script>
        <script type="text/javascript" src="js/fnVictimaDelito.js"></script>
        <%
            catalogos cat = new catalogos();
            showDelitosJO sDelitos = new showDelitosJO();
            showVictimasJO sVictima = new showVictimasJO();
            FechaMax fecha =new FechaMax();
            String fechas= fecha.FechaValida();
            ArrayList<String[]> lista, victiJC, victiJO, vic, vicDel;
            ArrayList<String> viDel, viIngre;
            ArrayList<String> viPro = new ArrayList();
            
            String victiClaveJC = "", victiClaveJO = "", posicion = "", edicion = "";
            if (request.getParameter("victiClaveJO") != null || request.getParameter("posicion") != null) {
                victiClaveJC = request.getParameter("victiClaveJC");
                victiClaveJO = request.getParameter("victiClaveJO");
                posicion = request.getParameter("posicion");//Variable de control para saber la fila de la tabla que pertenece
            }
            
            String juzgadoClaveJC = (String)session.getAttribute("juzgadoClaveJC");
            String juzgadoClaveJO = (String) session.getAttribute("juzgadoClave");
            String causaClaveJC = (String)session.getAttribute("causaClave");//Obtenemos la causa clave de JC
            String causaClaveJO = (String)session.getAttribute("causaClaveJO");//Obtenemos la causa clave de JO
            String datoSis = "";//Variable que se llena dependiendo de que datos se muestran
            String operacion = "";//Variable de control para saber si se inserta o se actualiza
            String tipoVicti = "";
            String victiMoral = "";
            String contoAsesor = "";
            String asesor = "";
            String sexoVic = "";
            String fechaNaciV = "";
            String edadV = "";
            String vulnera = "";
            String paisNaci = "";
            String entiNaci = "";
            String munNaci = "";
            String nacionalidad = "";
            String resiPaisV = "";
            String resiEntiV = "";
            String resiMuniV = "";
            String edoCivilV = "";
            String condAlfaV = "";
            String gdoEstudioV = "";
            String hablaEspa = "";
            String hablaExtra = "";
            String hablaIndigena = "";
            String lenguaIndigena = "";
            String interprete = "";
            String ocupa = "";
            String ingresos = "";
            String rangoIngre = "";
            String justificacion = "";
            String comen = "";
            if(request.getParameter("edita") != null){//Si es diferente de null entonces le mostramos los datos de JO
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    victiJO = sVictima.findVictimasJO(causaClaveJO, victiClaveJO + juzgadoClaveJO.replace("-", ""));
                    if(victiJO.size() > 0){
                        operacion = "actualizar";
                        datoSis = "Se muestran datos de Juicio Oral";
                        tipoVicti = victiJO.get(0)[0];
                        victiMoral = victiJO.get(0)[1];
                        contoAsesor = victiJO.get(0)[2];
                        asesor = victiJO.get(0)[3];
                        sexoVic = victiJO.get(0)[4];
                        fechaNaciV = victiJO.get(0)[5];
                        edadV = victiJO.get(0)[6];
                        vulnera = victiJO.get(0)[7];
                        paisNaci = victiJO.get(0)[8];
                        entiNaci = victiJO.get(0)[9];
                        munNaci = victiJO.get(0)[10];
                        nacionalidad = victiJO.get(0)[11];
                        resiPaisV = victiJO.get(0)[12];
                        resiEntiV = victiJO.get(0)[13];
                        resiMuniV = victiJO.get(0)[14];
                        edoCivilV = victiJO.get(0)[15];
                        condAlfaV = victiJO.get(0)[16];
                        gdoEstudioV = victiJO.get(0)[17];
                        hablaEspa = victiJO.get(0)[18];
                        hablaExtra = victiJO.get(0)[19];
                        hablaIndigena = victiJO.get(0)[20];
                        lenguaIndigena = victiJO.get(0)[21];
                        interprete = victiJO.get(0)[22];
                        ocupa = victiJO.get(0)[23];
                        ingresos = victiJO.get(0)[24];
                        rangoIngre = victiJO.get(0)[25];
                        justificacion = victiJO.get(0)[26];
                        comen = victiJO.get(0)[27];
                    }else{
                        out.println("<script>alert('Victima " + victiClaveJO + " no encontrada dentro de la Causa Penal "  + causaClaveJO + "'); "
                                + "parent.$.fancybox.close();</script>");
                    }
                }
            }else if(!victiClaveJC.equals("--")){//Si no trae variable edita, entonces le determinamos si trae JC
                victiJC = sVictima.findVictimasJC(causaClaveJC, victiClaveJC + juzgadoClaveJC.replace("-", ""));
                if(victiJC.size() > 0){
                    datoSis = "Se muestran datos de Juzgado de Control";
                    tipoVicti = victiJC.get(0)[0];
                    victiMoral = victiJC.get(0)[1];
                    contoAsesor = victiJC.get(0)[2];
                    asesor = victiJC.get(0)[3];
                    sexoVic = victiJC.get(0)[4];
                    fechaNaciV = victiJC.get(0)[5];
                    edadV = victiJC.get(0)[6];
                    vulnera = victiJC.get(0)[7];
                    paisNaci = victiJC.get(0)[8];
                    entiNaci = victiJC.get(0)[9];
                    munNaci = victiJC.get(0)[10];
                    nacionalidad = victiJC.get(0)[11];
                    resiPaisV = victiJC.get(0)[12];
                    resiEntiV = victiJC.get(0)[13];
                    resiMuniV = victiJC.get(0)[14];
                    edoCivilV = victiJC.get(0)[15];
                    condAlfaV = victiJC.get(0)[16];
                    gdoEstudioV = victiJC.get(0)[17];
                    hablaEspa = victiJC.get(0)[18];
                    hablaExtra = victiJC.get(0)[19];
                    hablaIndigena = victiJC.get(0)[20];
                    lenguaIndigena = victiJC.get(0)[21];
                    interprete = victiJC.get(0)[22];
                    ocupa = victiJC.get(0)[23];
                    ingresos = victiJC.get(0)[24];
                    rangoIngre = victiJC.get(0)[25];
                    justificacion = victiJC.get(0)[28];
                    comen = victiJC.get(0)[29];
                }else{
                    out.println("<script>alert('Victima " + victiClaveJC + " no encontrada dentro de la Causa Penal "  + causaClaveJC + "'); "
                            + "parent.$.fancybox.close();</script>");
                }
            }else{//Si viene JC vacio entonces es un registro nuevo
                datoSis = "Registro nuevo en Juicio Oral";
            }
            
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor">
            <h1>Víctimas</h1>
            <form action="" method="post" name="formVictimasJO" id="formVictimasJO">
                <fieldset>
                    <legend>Caracteristicas Generales</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <h5><%=datoSis%></h5>
                                <% if(!victiClaveJC.equals("--")){ %>
                                    <div class="cols">
                                        <label for="victima_clave">Víctima Clave Juzgado Control</label>
                                        <input type="text" name="victiClaveJC" id="victiClaveJC" value="<%=victiClaveJC%>" readonly/>
                                    </div>
                                    <img src="img/flechaIz.png" id="flechaRela">
                                <% } %>
                                <div class="cols">
                                    <label for="victima_clave">Víctima Clave Juicio Oral</label>
                                    <input type="text" name="victiClaveJO" id="victiClaveJO" value="<%=victiClaveJO%>" readonly/>
                                    <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>"/>
                                    <input type="hidden" name="opera" id="opera" value="<%=operacion%>"/>
                                </div>
                                <br>
                                <div class="cols">
                                    <!--Usamos un input invisible para recuperar el dato de tipo victima de BD y llenarlo con jquery-->
                                    <input type="hidden" id="tipoVictiHi" name="tipoVictiHi" value="<%=tipoVicti%>">
                                    <label for="tipoVictima">Tipo de Víctima</label>
                                    <select name="tipoVictima" id="tipoVictima" required>
                                        <option value="">--Seleccione--</option>
                                        <option value="1">1.- Persona física</option>
                                        <option value="2">2.- Persona moral</option>
                                        <optgroup label="Otro tipo de víctima">
                                            <option value="3">3.- Sociedad</option>
                                            <option value="4">4.- Estado</option>
                                            <option value="5">5.- Otro</option>
                                            <option value="9">9.- No identificado</option>
                                        </optgroup>
                                    </select>
                                </div>
                                <div class="cols oculto" id="tipoMoral">
                                    <label for="tvic_moral">Tipo de Víctima Moral</label>
                                    <select name="tvic_moral" id="tvic_moral">
                                        <option value="">--Seleccione--</option>
                                        <%
                                            lista = cat.findVictimaMoral();
                                            for (String[] ls : lista) {
                                                out.println("<option value='" + ls[0] + "'");
                                                if(ls[0].equals(victiMoral)){
                                                    out.println(" selected ");
                                                }
                                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                            }
                                        %>    
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset>
                    <legend >Delitos cometidos a la víctima</legend>
                    <table class="tablasRegis">
                        <thead>
                            <tr>
                                <th>Procesado Clave</th>
                                <th>Nombre</th>
                                <th>Delito Clave</th>
                                <th>Delito</th>
                                <th>Delito cometido</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            vic = sVictima.findProcesadosJO(causaClaveJO);
                            for (String[] pro : vic) {
                                int idx=0;
                                vicDel = sDelitos.findDelitosVictiJO(causaClaveJO);
                                out.println("<tr>");
                                out.println("<td rowspan='"+ vicDel.size() +"'>"+ pro[1].replace(juzgadoClaveJO.replace("-", ""), "") +"</td>");
                                out.println("<td rowspan='"+ vicDel.size() +"'>"+ pro[2] +"</td>");
                                for (String[] vi : vicDel) {
                                    if(idx!=0){
                                        out.println("<tr>");
                                    }
                                    out.println("<td>" + vi[1].replace(juzgadoClaveJO.replace("-", ""), "") + "</td>");
                                    out.println("<td>" + vi[2] + "</td>");
                                    if(!edicion.equals("")){//Si edicion viene diferente de vacio traemos JO
                                        viDel = sVictima.findVDelitoJO(causaClaveJO, pro[1], victiClaveJO + juzgadoClaveJO.replace("-", ""), vi[1]);
                                    }else{
                                        viDel = sVictima.findVDelitoJC(causaClaveJC, pro[0], victiClaveJC + juzgadoClaveJC.replace("-", ""), vi[0]);
                                    }
                                    out.println("<td>");
                                    if(viDel.size() != 0){
                                        out.println("<input type='checkbox' name='deliCometido' id='deliCometido' class='chkAplica' value='" + pro[1] + "@@@" + vi[1] + "' normaT=" +vi[3]+ " onclick='victimaDelito(this)' checked>");
                                    }else{
                                        out.println("<input type='checkbox' name='deliCometido' id='deliCometido' class='chkAplica' value='" + pro[1] + "@@@" + vi[1] + "' normaT=" +vi[3]+ " onclick='victimaDelito(this)' />");
                                    }
                                    out.println("</td>");
                                    out.println("</tr>");
                                    idx++;
                                }
                            }
                        %>
                        </tbody>
                    </table>
                    <div class="comentarios oculto" id="divJustificacion">
                        <h3>Justificacón de los delitos cometidos a la víctima</h3>
                        <textarea name="justificaDeli" id="justificaDeli" maxlength="500"><%=justificacion%></textarea>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Defensa</legend>
                    <div class="cols">
                        <label for="con_asesor">¿Contó con Asesor Jurídico?</label>
                        <select name="con_asesor" id="con_asesor" required>
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findRespuestaSimple();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(contoAsesor)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>      
                        </select>
                    </div>
                    <div class="cols oculto" id="asesorJuri">
                        <label for="asesor">Asesor Jurídico</label>
                        <select name="asesor" id="asesor">
                            <option value="">--Seleccione--</option>
                            <%
                                lista = cat.findTipoDefensor();
                                for (String[] ls : lista) {
                                    out.println("<option value='" + ls[0] + "'");
                                    if(ls[0].equals(asesor)){
                                        out.println(" selected ");
                                    }
                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                }
                            %>        
                        </select>
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Relación de la Victima con el Procesado</legend>
                    <table class="tablasRegis" id="tblVictiProceJO">
                        <thead>
                            <tr>
                                <th>Procesado Clave</th>
                                <th width="750">Relación</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            vic = sVictima.findVprocesadosJO(causaClaveJO);
                            int i = 0;
                            for (String[] vi : vic) {
                                out.println("<tr>");
                                out.println("<td>");
                                out.println(vi[1].replace(juzgadoClaveJO.replace("-", ""), "") 
                                        + "<input type='hidden' name='proRela' value='" + vi[1] + "'>");
                                out.println("</td>");
                                out.println("<td>");
                                lista = cat.findRelacionImputado();
                                for (String[] lis : lista) {
                                    out.println("<div class='chkCat'>");
                                    viPro.clear();//limpiamos el array para poder llenar de manera correcta todos los check
                                    //Recuperamos el dato de la bd, si existe lo checheamos si no se encuentra vacio
                                    if(!edicion.equals("")){//Si edicion viene diferente de vacio traemos JO
                                        viPro = sVictima.findViRelProcesadoJO(causaClaveJO, victiClaveJO + juzgadoClaveJO.replace("-", ""), vi[1], lis[0]);
                                    }else{
                                        viPro = sVictima.findViRelProcesadoJC(causaClaveJC, victiClaveJC + juzgadoClaveJC.replace("-", ""), vi[0], lis[0]);
                                    }
                                    if(viPro.size() != 0){
                                        out.println("<input type='checkbox' class='RelaProceChk' name='chkRelaProce" + i + "' id='chkRelaProce" + i + lis[0] + "' value=" + lis[0] + " checked>");
                                    }else{
                                        out.println("<input type='checkbox' class='RelaProceChk' name='chkRelaProce" + i + "' id='chkRelaProce" + i + lis[0] + "' value=" + lis[0] + ">");
                                    }
                                    out.println("<label>" + lis[1] + "</label>");
                                    out.println("</div>");
                                }
                                out.println("</td>");
                                out.println("</tr>");
                                i++;
                            }
                        %>
                        </tbody>
                    </table>
                </fieldset>
                <fieldset class="oculto" id="victiFisicas">
                    <legend>Características especificas para víctimas personas físicas</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <label for="sexoV">Sexo</label>
                                <select name="sexoV" id="sexoV">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findSexo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(sexoVic)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="fnacimientoV">Fecha de Nacimiento</label>
                                <input type="date" name="fnacimientoV" id="fnacimientoV" value="<%=fechaNaciV%>" max="<%=fechas%>" onchange="ValFechaNacVic('#fnacimientoV','#edadVi')" required>
                                <div class="noIdentificada" id="dFechaNaciV">
                                    <input type="checkbox" id="chkFechaNaciV" onchange="fechaNoIdent('#chkFechaNaciV', '#fnacimientoV')">
                                    <label>No identificada</label>
                                </div>
                            </td>
                            <td>
                                <label for="edadVi">Edad</label>
                                <select name="edadVi" id="edadVi">
                                    <option value="">--Seleccione--</option>
                                    <option value="-2">-2</option>
                                    <%
                                        for (int m = 0; m <= 99; m++) {
                                            out.println("<option value='" + m + "'");
                                            if(Integer.toString(m).equals(edadV)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + m + "</option>");        
                                        }
                                    %>
                                    <option value="-9">No identificado</option>
                                </select>
                            </td>
                            <td>
                                <label for="tvic_moral">Condición de vulnerabilidad</label>
                                <select name="vulnera" id="vulnera">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findVulnerabilidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(vulnera)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>   
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar de nacimiento</legend>
                                    <div class="cols" id="paisNaci">
                                        <label for="Pnacimiento">País</label>
                                        <select name="Pnacimiento" id="Pnacimiento" onchange="lugarNacimiento('#Pnacimiento', '#estaNaci', '#munNaci', '#Enacimiento', '#Mnacimiento');" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(paisNaci)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>  
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="estaNaci">       
                                        <label for="Enacimiento">Entidad</label>
                                        <select name="Enacimiento" id="Enacimiento" name="Enacimiento" onchange="llenaMun('#Enacimiento', '#Mnacimiento')">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(entiNaci)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>     
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="munNaci"> 
                                        <label for="Mnacimiento">Municipio</label>
                                        <select name="Mnacimiento" id="Mnacimiento">
                                            <%
                                                if(!paisNaci.equals("1")){//Si es diferente de mexico se muestra vacio para ser llenado con jquery
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                }else{//Si el pais es mexico entonces se llena el catalogo con municipios del estado
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                    lista = cat.findMunicipios(Integer.parseInt(entiNaci));
                                                    for (String[] ls : lista) {
                                                        out.println("<option value='" + ls[0] + "'");
                                                        if(ls[0].equals(munNaci)){
                                                            out.println(" selected ");
                                                        }
                                                        out.println(">" + ls[1] + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="naciona">Nacionalidad</label>
                                <select name="naciona" id="naciona">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findNacionalidad();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(nacionalidad)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>     
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <fieldset>
                                    <legend>Lugar habitual de residencia</legend>
                                    <div class="cols" id="paisResi"> 
                                        <label for="Preside">País</label>
                                        <select name="Preside" id="Preside" onchange="lugarNacimiento('#Preside', '#estaResi', '#munResi', '#Ereside', '#Mreside');" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findPais();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(resiPaisV)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>    
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="estaResi">   
                                        <label for="Ereside">Entidad</label>
                                        <select name="Ereside" id="Ereside" name="Ereside" onchange="llenaMun('#Ereside', '#Mreside')">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findEntidades();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(resiEntiV)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>      
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="munResi"> 
                                        <label for="Mreside">Municipio</label>
                                        <select name="Mreside" id="Mreside" name="Mreside">
                                            <%
                                                if(!resiPaisV.equals("1")){//Si es diferente de mexico se muestra vacio para ser llenado con jquery
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                }else{//Si el pais es mexico entonces se llena el catalogo con municipios del estado
                                                    out.println("<option value=''>--Seleccione--</option>");
                                                    lista = cat.findMunicipios(Integer.parseInt(resiEntiV));
                                                    for (String[] ls : lista) {
                                                        out.println("<option value='" + ls[0] + "'");
                                                        if(ls[0].equals(resiMuniV)){
                                                            out.println(" selected ");
                                                        }
                                                        out.println(">" + ls[1] + "</option>");
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="conyugal">Situación conyugal</label>
                                <select name="conyugal" id="conyugal" >
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findEstadoCivil();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(edoCivilV)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>     
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="alfabetismo">Condición de alfabetismo</label>
                                <select name="alfabetismo" id="alfabetismo">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findAlfabetismo();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(condAlfaV)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>  
                                </select>
                            </td>
                            <td>
                                <label for="estudios">Grado de estudios </label>
                                <select name="estudios" id="estudios">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findGradoEstudios();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(gdoEstudioV)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>   
                                </select>
                            </td>
                            <td>
                                <label for="hablaesp">Dominio del español</label>
                                <select name="hablaesp" id="hablaesp">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findDominioEspanol();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(hablaEspa)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="interprete">¿Habla alguna lengua extranjera?</label>
                                <select name="extrangera" id="extrangera">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(hablaExtra)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <fieldset>
                                    <div class="cols">
                                        <label for="indigena">Habla lengua indígena o dialecto </label>
                                        <select name="indigena" id="indigena" onchange="respuestaSimpleSelect('#indigena', '#famLingui', '#familia');" required>
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(hablaIndigena)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="famLingui">
                                        <label for="familia"> Familia lingüísticas</label>
                                        <select name="familia" id="familia">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findLinguisticas();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(lenguaIndigena)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %>   
                                        </select>
                                    </div>
                                </fieldset>
                            </td>
                            <td>
                                <label for="interprete">¿Requirió de intérprete?</label>
                                <select name="interprete" id="interprete">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findRespuestaSimple();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(interprete)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %> 
                                </select>
                            </td>
                            <td>
                                <label for="ocupa">Ocupación</label>
                                <select name="ocupa" id="ocupa">
                                    <option value="">--Seleccione--</option>
                                    <%
                                        lista = cat.findOcupacion();
                                        for (String[] ls : lista) {
                                            out.println("<option value='" + ls[0] + "'");
                                            if(ls[0].equals(ocupa)){
                                                out.println(" selected ");
                                            }
                                            out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                        }
                                    %>   
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan=4>
                                <fieldset>
                                    <div class="cols">
                                        <label for="ingresos">¿Percibe algún tipo de ingresos? </label>
                                        <select name="ingresos" id="ingresos">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRespuestaSimple();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(ingresos)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <div class="cols oculto" id="rangoInge">
                                        <label for="indigena">Rango de ingresos </label>
                                        <select name="rangoIngresos" id="rangoIngresos">
                                            <option value="">--Seleccione--</option>
                                            <%
                                                lista = cat.findRangoIngresos();
                                                for (String[] ls : lista) {
                                                    out.println("<option value='" + ls[0] + "'");
                                                    if(ls[0].equals(rangoIngre)){
                                                        out.println(" selected ");
                                                    }
                                                    out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                                                }
                                            %> 
                                        </select>
                                    </div>
                                    <table class="tablasRegis oculto" id="fuenteIngre">
                                        <tr>
                                            <th>ID</th>
                                            <th>Fuente de ingresos</th>
                                            <th>Aplica</th>
                                        </tr>
                                        <%
                                            lista = cat.findFuenteIngresos();
                                            for (String[] ls : lista) {
                                                out.println("<tr>");
                                                out.println("<td>" + ls[0] + "</td>");
                                                out.println("<td>" + ls[1] + "</td>");
                                                out.println("<td>");
                                                if(!edicion.equals("")){//Si ediciion viene diferente de vacio entonces tremos datos de JO
                                                    viIngre = sVictima.findVIngresosJO(causaClaveJO, victiClaveJO + juzgadoClaveJO.replace("-", ""), ls[0]);
                                                    if(viIngre.size() != 0){
                                                        out.println("<input type='checkbox' name='chkIngresos' id='chkIngresos" + ls[0] + "' value=" + ls[0] + " checked>");
                                                    }else{
                                                        out.println("<input type='checkbox' name='chkIngresos' id='chkIngresos" + ls[0] + "' value=" + ls[0] + "  >");
                                                    }
                                                }else{//Si edicion viene vacio entonces recuperamos datos de JC
                                                    viIngre = sVictima.findVIngresosJC(causaClaveJC, victiClaveJC + juzgadoClaveJC.replace("-", ""), ls[0]);
                                                    if(viIngre.size() != 0){
                                                        out.println("<input type='checkbox' name='chkIngresos' id='chkIngresos" + ls[0] + "' value=" + ls[0] + " checked>");
                                                    }else{
                                                        out.println("<input type='checkbox' name='chkIngresos' id='chkIngresos" + ls[0] + "' value=" + ls[0] + "  >");
                                                    }
                                                }
                                                out.println("</td>");
                                                out.println("</tr>");
                                            }
                                        %>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="Comentavic" id="Comentavic"><%=comen %></textarea>
                </div>
                <br>
                <input type="submit" name="guardarvic" id="guardarvic" value="Guardar">
            </form>
        </section>
                    
    </body>
</html>
