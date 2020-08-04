<%-- 
    Document   : victimas
    Created on : 27/09/2019, 10:10:38 AM
    Author     : CESAR.OSORIO
--%>

<%@page import="clasesAuxiliar.showDelitos"%>
<%@page import="clasesAuxiliar.showVictimas"%>
<%@page import="clasesAuxiliar.catalogos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clasesAuxiliar.FechaMax"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Víctimas</title>
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="js/funcionesVic.js"></script>
        <script type="text/javascript" src="js/fnVictimaDelito.js"></script>
        <%
            catalogos cat = new catalogos();
            showDelitos sDelitos = new showDelitos();
            showVictimas sVicti = new showVictimas();
            FechaMax fecha =new FechaMax();
            String fechas= fecha.FechaValida();
            ArrayList<String[]> lista, victima, vic;
            ArrayList<String> viDel = new ArrayList();
            ArrayList<String> viPro = new ArrayList();
            ArrayList<String> viIngre = new ArrayList();
            ArrayList<String> vimedida = new ArrayList();
            
            String victiClave = "", posicion = "", edicion = "";
            if (request.getParameter("victiClave") != null || request.getParameter("posicion") != null) {
                victiClave = request.getParameter("victiClave");
                posicion = request.getParameter("posicion");//Variable de control para saber la fila de la tabla que pertenece
            }
            
            String juzgadoClave = (String) session.getAttribute("juzgadoClave");
            String causaClave = (String) session.getAttribute("causaClave");
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
            String medidaProte = "";
            String medidaMujer = "";
            String justificacion = "";
            String comen = "";
            if(request.getParameter("edita") != null){//Sabremos si es para edicion de datos o captura de datos
                edicion = request.getParameter("edita");
                if(edicion.equals("Si")){
                    victima = sVicti.findVictimas(causaClave, victiClave + juzgadoClave.replace("-", ""));
                    if(victima.size() > 0){
                        operacion = "actualizar";
                        tipoVicti = victima.get(0)[0];
                        victiMoral = victima.get(0)[1];
                        contoAsesor = victima.get(0)[2];
                        asesor = victima.get(0)[3];
                        sexoVic = victima.get(0)[4];
                        fechaNaciV = victima.get(0)[5];
                        edadV = victima.get(0)[6];
                        vulnera = victima.get(0)[7];
                        paisNaci = victima.get(0)[8];
                        entiNaci = victima.get(0)[9];
                        munNaci = victima.get(0)[10];
                        nacionalidad = victima.get(0)[11];
                        resiPaisV = victima.get(0)[12];
                        resiEntiV = victima.get(0)[13];
                        resiMuniV = victima.get(0)[14];
                        edoCivilV = victima.get(0)[15];
                        condAlfaV = victima.get(0)[16];
                        gdoEstudioV = victima.get(0)[17];
                        hablaEspa = victima.get(0)[18];
                        hablaExtra = victima.get(0)[19];
                        hablaIndigena = victima.get(0)[20];
                        lenguaIndigena = victima.get(0)[21];
                        interprete = victima.get(0)[22];
                        ocupa = victima.get(0)[23];
                        ingresos = victima.get(0)[24];
                        rangoIngre = victima.get(0)[25];
                        medidaProte = victima.get(0)[26];
                        medidaMujer = victima.get(0)[27];
                        justificacion = victima.get(0)[28];
                        comen = victima.get(0)[29];
                    }else{
                        out.println("<script>alert('Victima " + victiClave + " no encontrada dentro de la Causa Penal "  + causaClave + "'); "
                                + "window.location.href = 'elementosPrincipales.jsp'</script>");
                    }
                }
            }
        %>
    </head>
    <body style="zoom: .9;">
        <%--<%@include file="cabecera.jsp"%>--%>
        <section class="contenedor">
            <h1>Víctimas</h1>
            <form action="insrtVictimas" method="post" name="formVictimas" id="formVictimas">
                <fieldset>
                    <legend>Caracteristicas Generales</legend>
                    <table class="tablaFormu">
                        <tr>
                            <td>
                                <div class="cols">
                                    <label for="victima_clave">Víctima Clave</label>
                                    <input type="text" name="victiClave" id="victiClave" value="<%=victiClave%>" readonly/>
                                    <input type="hidden" name="posicion" id="posicion" value="<%=posicion%>"/>
                                    <input type="hidden" name="opera" id="opera" value="<%=operacion%>"/>
                                </div>
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
                        <tr>
                            <th>Procesado Clave</th>
                            <th>Nombre</th>
                            <th>Delito Clave</th>
                            <th>Delito</th>
                            <th>Delito cometido</th>
                        </tr>
                        <%
                            vic = sVicti.findProcesados(causaClave);
                            for (String[] pro : vic) {
                                int idx=0;
                                vic = sDelitos.findDelitosCausa(causaClave);
                                out.println("<tr>");
                                out.println("<td rowspan='"+ vic.size() +"'>"+ pro[0].replace(juzgadoClave.replace("-", ""), "") +"</td>");
                                out.println("<td rowspan='"+ vic.size() +"'>"+ pro[1] +"</td>");
                                for (String[] ls : vic) {
                                    if(idx!=0){
                                        out.println("<tr>");
                                    }
                                    out.println("<td>" + ls[0].replace(juzgadoClave.replace("-", ""), "") + "</td>");
                                    out.println("<td>" + ls[1] + "</td>");
                                    out.println("<td>");
                                    viDel = sVicti.findVDelito(causaClave, pro[0], victiClave + juzgadoClave.replace("-", ""), ls[0]);
                                    if(viDel.size() != 0){
                                        out.println("<input type='checkbox' name='deliCometido' id='deliCometido' class='chkAplica' value='"+ pro[0] +"@@@"+ ls[0] +"' normaT="+ls[2]+" onclick='victimaDelito(this)' checked/>");
                                    }else{
                                        out.println("<input type='checkbox' name='deliCometido' id='deliCometido' class='chkAplica' value='"+ pro[0] +"@@@"+ ls[0] +"' normaT="+ls[2]+" onclick='victimaDelito(this)' />");
                                    }
                                    out.println("</td>");
                                    out.println("</tr>");
                                    idx++;
                                }
                            }
                        %>
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
                    <table class="tablasRegis" id="tblVictiProce">
                        <thead>
                            <tr>
                                <th>Procesado Clave</th>
                                <th width="750">Relación</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            vic = sVicti.findProcesados(causaClave);
                            int i = 0;
                            for (String[] ls : vic) {
                                out.println("<tr>");
                                out.println("<td>");
                                out.println(ls[0].replace(juzgadoClave.replace("-", ""), "") + "<input type='hidden' name='proRela' value='" + ls[0] + "'>");
                                out.println("</td>");
                                out.println("<td>");
                                lista = cat.findRelacionImputado();
                                for (String[] los : lista) {
                                    out.println("<div class='chkCat'>");
                                    viPro.clear();//limpiamos el array para poder llenar de manera correcta todos los check
                                    //Recuperamos el dato de la bd, si existe lo checheamos si no se encuentra vacio
                                    viPro = sVicti.findVProcesado(causaClave, victiClave + juzgadoClave.replace("-", ""), ls[0], los[0]);
                                    if(viPro.size() != 0){
                                        out.println("<input type='checkbox' class='RelaProceChk' name='chkRelaProce" + i + "' id='chkRelaProce" + i + los[0] + "' value=" + los[0] + " checked>");
                                    }else{
                                        out.println("<input type='checkbox' class='RelaProceChk' name='chkRelaProce" + i + "' id='chkRelaProce" + i + los[0] + "' value=" + los[0] + ">");
                                    }
                                    out.println("<label>" + los[1] + "</label>");
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
                                <select name="edadVi" id="edadVi" required>
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
                                                viIngre = sVicti.findVIngresos(causaClave, victiClave + juzgadoClave.replace("-", ""), ls[0]);
                                                if(viIngre.size() != 0){
                                                    out.println("<input type='checkbox' name='chkIngresos' id='chkIngresos" + ls[0] + "' value=" + ls[0] + " checked>");
                                                }else{
                                                    out.println("<input type='checkbox' name='chkIngresos' id='chkIngresos" + ls[0] + "' value=" + ls[0] + "  >");
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
                <fieldset class="oculto" id="mediProtec">
                    <legend>Medidas Protección</legend>
                    <label for="mProtect" class="lblExBig">¿Se le dictaron medidas de protección?</label>
                    <select name="mProtect" id="mProtect">
                        <option value="">--Seleccione--</option>
                        <%
                            lista = cat.findRespuestaSimple();
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "'");
                                if(ls[0].equals(medidaProte)){
                                    out.println(" selected ");
                                }
                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                            }
                        %>  
                    </select>
                    <table id="MedidasPro" class="tablasRegis oculto">
                        <tr>
                            <th>ID</th>
                            <th>Tipo de medidas de protección</th>
                            <th>¿Aplicó la medida de protección?</th>
                        </tr>
                        <%
                            lista = cat.findMedidasProteccion();
                            for (String[] ls : lista) {
                                out.println("<tr>");
                                out.println("<td>" + ls[0] + "</td>");
                                out.println("<td>" + ls[1] + "</td>");
                                out.println("<td>");
                                vimedida = sVicti.findVMedidas(causaClave, victiClave + juzgadoClave.replace("-", ""), ls[0]);
                                if(vimedida.size() != 0){
                                    out.println("<input type='checkbox' name='aplicaMedida' id='aplicaMedida" + ls[0] + "' value='" + ls[0] + "' checked>");
                                }else{
                                    out.println("<input type='checkbox' name='aplicaMedida' id='aplicaMedida" + ls[0] + "' value='" + ls[0] + "'>");
                                }
                                out.println("</td>");
                                out.println("</tr>");
                            }
                        %>
                    </table>
                </fieldset>
                <fieldset class="oculto" id="mediProtecMuj">
                    <legend>Medidas de Protección Violencia Mujeres</legend>
                    <label for="mujProtect" class="lblExBig">¿Se le dictaron medidas de protección por delitos que impliquen violencia contra las mujeres?</label>
                    <select name="mujProtect" id="mujProtect">
                        <option value="">--Seleccione--</option>
                        <%
                            lista = cat.findRespuestaSimple();
                            for (String[] ls : lista) {
                                out.println("<option value='" + ls[0] + "'");
                                if(ls[0].equals(medidaMujer)){
                                    out.println(" selected ");
                                }
                                out.println(">" + ls[0] + ".- " + ls[1] + "</option>");
                            }
                        %>  
                    </select>
                    <table id="MujPro" class="tablasRegis oculto">
                        <tr>
                            <th>ID</th>
                            <th>Tipo de medidas de protección por delitos que impliquen violencia contra las mujeres</th>
                            <th>¿Aplicó la medida de protección?</th>
                        </tr>
                        <%
                            lista = cat.findMedidasMujer();
                            for (String[] ls : lista) {
                                out.println("<tr>");
                                out.println("<td>" + ls[0] + "</td>");
                                out.println("<td>" + ls[1] + "</td>");
                                out.println("<td>");
                                vimedida = sVicti.findVMedidasMuj(causaClave, victiClave + juzgadoClave.replace("-", ""), ls[0]);
                                if(vimedida.size() != 0){
                                    out.println("<input type='checkbox' name='aplicaMedidaMuj' id='aplicaMedidaMuj" + ls[0] + "' value='" + ls[0] + "' checked>");
                                }else{
                                    out.println("<input type='checkbox' name='aplicaMedidaMuj' id='aplicaMedidaMuj" + ls[0] + "' value='" + ls[0] + "'>");
                                }
                                out.println("</td>");
                                out.println("</tr>");
                            }
                        %> 
                    </table>
                </fieldset>
                <div class="comentarios">
                    <h2>Comentarios</h2>
                    <textarea name="Comentavic" id="Comentavic"><%=comen%></textarea>
                </div>
                <br>
                <input type="submit" name="guardarvic" id="guardarvic" value="Guardar">
            </form>
        </section>
    </body>
</html>
