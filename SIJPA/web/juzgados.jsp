<%-- 
    Document   : juzgados
    Created on : 20/09/2019, 10:55:04 AM
    Author     : FERMIN.GOMEZ
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" Content="text/html; charset=UTF-8">
        <title>SIJPA::Juzgados</title>
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/pestanas.js"></script>
    </head>
    <body >
        <%@include file="cabecera.jsp"%>
        <section class="contenedor">
            <h1>Juzgados</h1>
            <div class="pestana">
                <button class="pestanaLinks active" onclick="openPestana(event, 'p1')" id="btn1" style="display: block">Datos del Juez</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p2')">Datos Órgano Jurisdiccional</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p3')">Forma de Organizacion del Órgano</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p4')">Datos Geográficos</button>
                <button class="pestanaLinks" onclick="openPestana(event, 'p5')">Datos de quien captura</button>
            </div>

            <form action="#" method="post">
                <!-- Contenido pestañas -->
                <div id="p1" class="pestanaContent" style="display: block">
                    <h3>Datos del Juez</h3>
                    <table  class="tablaFormu">
                        <tr>
                            <td>
                                <label for="nombre">Nombre(s)</label>
                                <input type="text" name="nombre" id="nombre" required/>
                            </td>
                            <td>
                                <label for="apaterno">Apellido Paterno</label>
                                <input type="text" name="apaterno" id="apaterno" required/>
                            </td>
                            <td>
                                <label for="amaterno">Apellido Materno</label>
                                <input type="text" name="amaterno" id="amaterno" required/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <label for="fGestion">Fecha inicio gestion:</label>
                                <input type="date" class="txtMedia" name="fGestion" id="fGestion" />
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>

                <div id="p2" class="pestanaContent">
                    <h3>Datos Órgano Jurisdiccional</h3>
                    <table  class="tablaFormu">
                        <tr>
                            <td>
                                <label for="nomOrgano">Nombre Organo Jurisdiccional</label>
                                <input type="text" name="nomOrgano" id="nomOrgano"  required/>
                            </td>
                            <td>
                                <label for="numJuzgado">Número de Juzgado</label>
                                <input type="number" class="txtMedia" name="numJuzgado" id="numJuzgado" required/>
                            </td>
                            <td>
                                <label for="numDistrito">Número del Distrito Judicial</label>
                                <select name="numDistrito" class="txtMedia" id="numDistrito" required>
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        NumerosRomanos nRomanosR = new NumerosRomanos(1, 99);
                                        ArrayList<NumerosRomanos> alnRomanosR = nRomanosR.getNumerosRomanos();
                                        for (NumerosRomanos nR : alnRomanosR) {
                                            out.println("<option value='"+nR.nArabigo+"'>"+nR+"</option>");
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="">Lada y Teléfono del Juzgado</label>
                                <input type="number" class="txtSmall" name="lada" id="lada" placeholder="Lada"/>
                                <input type="tel" class="txtMedia" name="tel" id="tel" placeholder="Telefono"/>
                            </td>
                            <td>
                                <label for="correo">Correo del Juzgado:</label>
                                <input type="email" name="correo" id="correo" placeholder="nombre@dominio.com" />
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>

                <div id="p3" class="pestanaContent">
                    <h3>Forma de Organizacion del Órgano</h3>
                    <table  class="tablaFormu">
                        <tr>
                            <td></td>
                            <td>
                                <label for="fOrganiza">Forma de Organizacion</label>
                                <select name="fOrganiza" id="fOrganiza">
                                    <option value="0">--Seleccione--</option>
                                    <option value="1">Región judicial</option>
                                    <option value="2">Distrito judicial</option>
                                    <option value="3">Partido judicial</option>
                                    <option value="4">Cobertura estatal</option>
                                    <option value="5">Otro</option>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="regJudicial">Nombre de la Región Judicial</label>
                                <input type="text" name="regJudicial" id="regJudicial"/>
                            </td>
                            <td>
                                <label for="distJudicial">Nombre del Distrito Judicial</label>
                                <input type="text" name="distJudicial" id="distJudicial"/>
                            </td>
                            <td>
                                <label for="partJudicial">Nombre del Partido Judicial</label>
                                <input type="text" name="partJudicial" id="partJudicial" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="p4" class="pestanaContent">
                    <h3>Datos Geográficos</h3>
                    <table  class="tablaFormu" >
                        <tr>
                            <td>
                                <label for="entidad">Entidad Federativa</label>
                                <select name="entidad" id="entidad">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="municipio">Municipio o Delegacion</label>
                                <select name="municipio" id="municipio">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="vialidad">Vialidad</label>
                                <select name="vialidad" id="vialidad">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="nomVialidad">Nombre de la Vialidad</label>
                                <input type="text" name="nomVialidad" id="nomVialidad"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="asentamiento">Asentamiento Humano</label>
                                <select name="asentamiento" id="asentamiento">
                                    <option value="0">--Seleccione--</option>
                                    <%
                                        //conexion a base
                                    %>
                                </select>
                            </td>
                            <td>
                                <label for="nomAsentamiento">Nombre del Asentamiento Humano</label>
                                <input type="text" name="nomAsentamiento" id="nomAsentamiento"/>
                            </td>
                            <td>
                                <label for="">No. Exterior / No. Interiior</label>
                                <input type="text" class="txtSmall" name="noExterior" id="noExterior" />
                                <input type="text" class="txtSmall" name="noInterior" id="noInterior" />
                            </td>
                            <td>
                                <label for="cp">Codigo Postal</label>
                                <input type="number" class="txtMedia" name="cp" id="cp" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="p5" class="pestanaContent">
                    <h3>Datos de quien captura</h3>
                    <table  class="tablaFormu">
                        <tr>
                            <td>
                                <label for="nombreCap">Nombre(s)</label>
                                <input type="text" name="nombreCap" id="nombreCap" />
                            </td>
                            <td>
                                <label for="apaternoCap">Apellido Paterno</label>
                                <input type="text" name="apaternoCap" id="apaternoCap" />
                            </td>
                            <td>
                                <label for="amaternoCap">Apellido Materno</label>
                                <input type="text" name="amaternoCap" id="amaternoCap"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <label for="Cargo">Cargo</label>
                                <input type="text" name="cargo" id="cargo" />
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <br>
                <input type="submit" name="guardar" id="guardar" value="Guardar">
            </form>
        </section>
    </body>
</html>
<%!
    public class NumerosRomanos {

        private int nArabigo;
        private String nRomano;
        private int rango;
        ArrayList al = new ArrayList();

        public NumerosRomanos(int inicio, int rango) {
            String unidad;
            String decena;
            for (int i = inicio; i <= rango; i++) {
                int uni;

                int dec;
                if (i >= 10) {
                    uni = i % 10;
                    dec = i / 10;
                } else {
                    uni = i;
                    dec = i / 10;
                }
                unidad = "";
                decena = "";
                switch (uni) {
                    case 1:
                        unidad = "I";
                        break;
                    case 2:
                        unidad = "II";
                        break;
                    case 3:
                        unidad = "III";
                        break;
                    case 4:
                        unidad = "IV";
                        break;
                    case 5:
                        unidad = "V";
                        break;
                    case 6:
                        unidad = "VI";
                        break;
                    case 7:
                        unidad = "VII";
                        break;
                    case 8:
                        unidad = "VIII";
                        break;
                    case 9:
                        unidad = "IX";
                        break;
                }
                if (dec > 0) {
                    switch (dec) {
                        case 1:
                            decena = "X";
                            break;
                        case 2:
                            decena = "XX";
                            break;
                        case 3:
                            decena = "XXX";
                            break;
                        case 4:
                            decena = "XL";
                            break;
                        case 5:
                            decena = "L";
                            break;
                        case 6:
                            decena = "LX";
                            break;
                        case 7:
                            decena = "LXX";
                            break;
                        case 8:
                            decena = "LXXX";
                            break;
                        case 9:
                            decena = "XC";
                            break;
                    }
                } else {
                    decena = "";
                }
                nRomano = decena + "" + unidad;
                nArabigo = i;
                al.add(new NumerosRomanos(nArabigo, nRomano));
//                al.add(nArabigo, nRomano);
            }

        }

        public NumerosRomanos(int nArabigo, String nRomano) {
            this.nArabigo = nArabigo;
            this.nRomano = nRomano;
        }

        public ArrayList<NumerosRomanos> getNumerosRomanos() {
            ArrayList<NumerosRomanos> lista = al;
            return lista;
        }
        public int getnArabigo() {
            return nArabigo;
        }

        @Override
        public String toString(){
            if(nArabigo>0){
                return "(" + nArabigo + ") - " + nRomano ;
            }else{
                return nRomano;
            }
        }
    }
%>
