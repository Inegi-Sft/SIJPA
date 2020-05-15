/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    
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
    
});
