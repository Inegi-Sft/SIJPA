/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    
    //Se usa para la recuperacion de datos de DB
    if($('#medidasDis').val() === '1'){
        $('#dTipoMedida').show();
    }
    //Se usa para la recuperacion de datos de DB
    if($('#incidentes').val() === '1'){
        $('#dResoIncidente, #dPromueveIncidente').show();
    }
    //Se usa para la recuperacion de datos de DB
    if($('#suspencionA').val() === '1'){
        $('#dFechaSuspencion, #dFechaReanudacion').show();
    }
    //Se usa para la recuperacion de datos de DB
    if($('#deliberacion').val() === '1'){
        $('#dFechaDeliberacion, #dSentidoFallo').show();
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#autoApertura').val() === '1899-09-09'){
        $('#autoApertura').prop('readonly', true);
        $('#chkAutoApertura').prop('checked', true);
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#celebracionA').val() === '1899-09-09'){
        $('#celebracionA').prop('readonly', true);
        $('#chkCelebracionA').prop('checked', true);
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#resoIncidente').val() === '1899-09-09'){
        $('#resoIncidente').prop('readonly', true);
        $('#chkResoIncidente').prop('checked', true);
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#fechaSuspencion').val() === '1899-09-09'){
        $('#fechaSuspencion').prop('readonly', true);
        $('#chkFechaSuspencion').prop('checked', true);
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#fechaReanudacion').val() === '1899-09-09'){
        $('#fechaReanudacion').prop('readonly', true);
        $('#chkFechaReanudacion').prop('checked', true);
    }
    //Se usa para la recuperacion de datos de DB FECHAS No identificadas
    if($('#fechaDeliberacion').val() === '1899-09-09'){
        $('#fechaDeliberacion').prop('readonly', true);
        $('#chkFechaDeliberacion').prop('checked', true);
    }
    
    
    $('#medidasDis').change(function(){
        if ($('#medidasDis').val() === '1') {
            $('#dTipoMedida').fadeIn("slow");
            $('#tipoMedida').val('').prop("required", true);
        } else {
            $('#dTipoMedida').fadeOut("slow");
            $('#tipoMedida').val('-2').prop("required", false);
        }
    });
    
    $('#incidentes').change(function(){
        if ($('#incidentes').val() === '1') {
            $('#dResoIncidente, #dPromueveIncidente').fadeIn("slow");
            $('#resoIncidente, #promueveIncidente').val('').prop({"required": true,"readonly":false});
            $('#chkResoIncidente').prop("checked", false);
        } else {
            $('#dResoIncidente, #dPromueveIncidente').fadeOut("slow");
            $('#resoIncidente').val('1799-09-09').prop("required", false);
            $('#promueveIncidente').val('-2').prop("required", false);
        }
    });
    
    $('#suspencionA').change(function(){
        if ($('#suspencionA').val() === '1') {
            $('#dFechaSuspencion, #dFechaReanudacion').fadeIn("slow");
            $('#fechaSuspencion, #fechaReanudacion').val('').prop({"required": true,"readonly":false});
            $('#chkFechaSuspencion, #chkFechaReanudacion').prop("checked", false);
        } else {
            $('#dFechaSuspencion, #dFechaReanudacion').fadeOut("slow");
            $('#fechaSuspencion, #fechaReanudacion').val('1799-09-09').prop("required", false);
        }
    });
    
    $('#deliberacion').change(function(){
        if ($('#deliberacion').val() === '1') {
            $('#dFechaDeliberacion, #dSentidoFallo').fadeIn("slow");
            $('#fechaDeliberacion, #sentidoFallo').val('').prop({"required": true,"readonly":false});
            $('#chkFechaDeliberacion').prop("checked", false);
        } else {
            $('#dFechaDeliberacion, #dSentidoFallo').fadeOut("slow");
            $('#fechaDeliberacion').val('1799-09-09').prop("required", false);
            $('#sentidoFallo').val('-2').prop("required", false);
        }
    });
    
    $('#sentidoFallo').change(function(){
        if ($('#sentidoFallo').val() === '1') {
            alert("Este procesado debe registrarse en Resoluciones bajo la sentencia Asolutoria");
        } else if ($('#sentidoFallo').val() === '2'){
            alert("Este procesado debe registrarse en Resoluciones bajo la sentencia Condenatoria");
        }
    });
    
    //Guarda Etapa Oral
    $('#fromJuicioO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        
        $.ajax({
            type: 'post',
            url: 'insrtEtapaOral',
            data: $('#fromJuicioO').serialize(),
            success: function (response) { 
                console.log("Respuesta del servidor Etapa Oral: ", response);
                alert("Guardado con exito!!!");
                var numProce = parseInt(parent.$('#TadolescentesJO').val());
                if (response !== null && $.isArray(response)) {
                    for (var i = 1; i < 7; i++) {
                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaJuicioJO tbody').find('tr').eq(response[0]).children('td').eq(i-1).html(response[i]);
                    }
                    //editamos enlance para que pueda ser actualizado ya estando lleno
                    var enlace = 'etapaOral.jsp?proceClave=' + response[1] + '&edita=Si';
                    parent.$('#tablaJuicioJO tbody tr').eq(response[0]).find('a').attr('href',enlace);
                    console.log('Captu: ' + response[7] + ' Existen: ' + numProce);
                    if (response[7] === numProce) {
                        parent.openPestana('btn7', 'p7');
                        parent.openPestana('btn6', 'p6');
                    } else {
                        alert('Falta por capturar ' + (numProce - response[7]) + ' adolescentes');
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor Etapa Oral: ", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });
    
});
