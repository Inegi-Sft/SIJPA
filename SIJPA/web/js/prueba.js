/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    //Elementos delitos
    var totDeli = parseInt($('#Tdelitos').val());
    if (totDeli > 0) {
        var expediente = $('#expClave').val();//tomamos la causa clave
        var numFilasDel = $('#tablaDeli tbody tr').length;
        if (numFilasDel === 0) {
            for (var i = 0; i < totDeli; i++) {
                var delitoClave = expediente + '-D' + (i + 1);
                $('#tablaDeli tbody').append('<tr><td>' + delitoClave + '</td><td></td><td></td><td></td><td></td>\n\
                    <td></td><td><a class="pop" href="delitos.jsp?delitoClave=' + delitoClave + '&posicion=' + i + '">\n\
                    <img src="img/editar.png" title="Modificar"/></a></td></tr>');
            }
        }else{
            var filaInsert = totDeli - numFilasDel;
            var nombreDeli = $('#tablaDeli tbody').find("tr:last-child").find("td:eq(0)").text();
            var nombreNuevoDeli = parseInt(nombreDeli.substring(nombreDeli.indexOf('-D') + 2,nombreDeli.indexOf('-D') + 3));
            alert('Estamos en tabal delitos: ' + nombreDeli);
            for (var i = 0; i < filaInsert; i++) {
                var delitoClave = expediente + '-D' + (nombreNuevoDeli + (i + 1));
                $('#tablaDeli tbody').append('<tr><td>' + delitoClave + '</td><td></td><td></td><td></td><td></td>\n\
                    <td></td><td><a class="pop" href="delitos.jsp?delitoClave=' + delitoClave + '&posicion=' + (i + nombreNuevoDeli) + '">\n\
                    <img src="img/editar.png" title="Modificar"/></a></td></tr>');
            }
        }
    }
    
    //Elementos procesados e inicial
    var totProce = parseInt($('#Tadolescentes').val());
    if (totProce > 0) {
        var expediente = $('#expClave').val();//tomamos la causa clave
        //Procesados
        var numFilasProce = $('#tablaProcesa tbody tr').length;
        if (numFilasProce === 0) {
            for (var i = 0; i < totProce; i++) {
                var proceClave = expediente + '-P' + (i + 1);
                $('#tablaProcesa tbody').append('<tr><td>' + proceClave + '</td><td></td><td></td><td></td><td></td>\n\
                    <td><a class="pop" href="procesados.jsp?proceClave=' + proceClave + '&posicion=' + i + '">\n\
                    <img src="img/editar.png" title="Modificar"/></a></td></tr>');
            }
        }else{
            var filaInsert = totProce - numFilasProce;
            var nombreProce = $('#tablaProcesa tbody').find("tr:last-child").find("td:eq(0)").text();
            var nombreNuevoProce = parseInt(nombreProce.substring(nombreProce.indexOf('-P') + 2,nombreProce.indexOf('-P') + 3));
//            alert(totDeli + "-" + numFilasDel);
            for (var i = 0; i < filaInsert; i++) {
                var proceClave = expediente + '-P' + (nombreNuevoProce + (i + 1));
                $('#tablaProcesa tbody').append('<tr><td>' + proceClave + '</td><td></td><td></td><td></td><td></td>\n\
                    <td><a class="pop" href="procesados.jsp?proceClave=' + proceClave + '&posicion=' + (i + nombreNuevoProce) + '">\n\
                    <img src="img/editar.png" title="Modificar"/></a></td></tr>');
            }
        }
        //Inicial
        var numFilasInicial = $('#tablaInicial tbody tr').length;
        if (numFilasInicial === 0) {
            for (var i = 0; i < totProce; i++) {
                var proceClave = expediente + '-P' + (i + 1);
                $('#tablaInicial tbody').append('<tr><td>' + proceClave + '</td><td></td><td></td><td></td><td></td>\n\
                    <td><a class="pop" href="etapaInicial.jsp?proceClave=' + proceClave + '&posicion=' + i + '">\n\
                    <img src="img/editar.png" title="Modificar"/></a></td></tr>');
            }
        }else{
            var filaInsert = totProce - numFilasInicial;
            var nombreInicial = $('#tablaInicial tbody').find("tr:last-child").find("td:eq(0)").text();
            var nombreNuevoInicial = parseInt(nombreInicial.substring(nombreInicial.indexOf('-P') + 2,nombreInicial.indexOf('-P') + 3));
//            alert(filaInsert);
            for (var i = 0; i < filaInsert; i++) {
                var proceClave = expediente + '-P' + (nombreNuevoInicial + (i + 1));
                $('#tablaInicial tbody').append('<tr><td>' + proceClave + '</td><td></td><td></td><td></td><td></td>\n\
                    <td><a class="pop" href="etapaInicial.jsp?proceClave=' + proceClave + '&posicion=' + (i + nombreNuevoInicial) + '">\n\
                    <img src="img/editar.png" title="Modificar"/></a></td></tr>');
            }
        }
    }
    
    //Elementos victimas
    var totVictimas = parseInt($('#Tvictimas').val());
    if (totVictimas > 0) {
        var expediente = $('#expClave').val();//tomamos la causa clave
        var numFilasVicti = $('#tablaVictimas tbody tr').length;
        if (numFilasVicti === 0) {
            for (var i = 0; i < totVictimas; i++) {
                var victiClave = expediente + '-V' + (i + 1);
                $('#tablaVictimas tbody').append('<tr><td>' + victiClave + '</td><td></td><td></td><td></td><td></td>\n\
                    <td><a class="pop" href="victimas.jsp?victiClave=' + victiClave + '&posicion=' + i + '">\n\
                    <img src="img/editar.png" title="Modificar"/></a></td></tr>');
            }
        }else{
            var filaInsert = totVictimas - numFilasVicti;
            var nombreVicti = $('#tablaVictimas tbody').find("tr:last-child").find("td:eq(0)").text();
            var nombreNuevoVicti = parseInt(nombreVicti.substring(nombreVicti.indexOf('-V') + 2,nombreVicti.indexOf('-V') + 3));
//            alert(totDeli + "-" + numFilasDel);
            for (var i = 0; i < filaInsert; i++) {
                var victiClave = expediente + '-V' + (nombreNuevoVicti + (i + 1));
                $('#tablaVictimas tbody').append('<tr><td>' + victiClave + '</td><td></td><td></td><td></td><td></td>\n\
                    <td><a class="pop" href="victimas.jsp?victiClave=' + victiClave + '&posicion=' + (i + nombreNuevoVicti) + '">\n\
                    <img src="img/editar.png" title="Modificar"/></a></td></tr>');
            }
        }
    }
    
});