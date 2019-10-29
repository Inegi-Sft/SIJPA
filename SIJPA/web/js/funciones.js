/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global selecChk */

$(document).ready(function () {
    $('select > option[value=-2]').hide();
    
//despliega ventana modal
    $('.pop').fancybox({
        'type': 'iframe',
        'overlayShow': true,
        'iframe': {
            'css': {
                'width': '1400px',
                'height': '560px'
            }
        }
    });
    $('.oculto').hide();
    $('.dependiente').val('-2');
    $('.depenFecha').val('1899-09-09');
    //Auto acompletado
    $('#delitoCP').selectize();
    //$('#municipioD').selectize();
    //$('#municipioJ').selectize();
    //$('#nMunicipio').selectize();
    //$('#rMunicipio').selectize();
    //$('#Mnacimiento').selectize();
    //$('#Mreside').selectize();
});

/***************************** PARA CAPTURA EXPEDIENTES ************************/
//Habilita text de Audiencias en Expedientes
/***
 * 
 * @param {type} obj
 * @param {type} idTxt
 * @returns {undefined}
 */
function comprobar(obj, idTxt) {
    if (obj.checked) {
        document.getElementById(idTxt).disabled = false;
    } else {
        document.getElementById(idTxt).disabled = true;
    }
}
function etapaInter(){
if($('#audiInterme').val()==='1'){
    $('#divfechaAudiinter,#divfechaEscrito').fadeIn("slow");
    $('#chkAudiinter,#chkEscrito').prop("checked", false);
    $('#fechaAudiinter,#fechaEscrito').val("").prop("disabled", false).prop("required", true);
} else {
     $('#divfechaAudiinter,#divfechaEscrito').fadeOut("slow");
    $('#chkAudiinter,#chkEscrito').prop("checked", false);
    $('#fechaAudiinter,#fechaEscrito').val("1899-09-09").prop("disabled", false).prop("required", false);
}
}
//Respuestas simples y fechas con NI
function respuestaSimpleFecha(idSelect, idDiv, idDate, idChk) {
    if ($(idSelect).val() === '1') {
        $(idDiv).fadeIn("slow");
        $(idChk).prop("checked", false);
        $(idDate).val("").prop("disabled", false).prop("required", true);
    } else {
        $(idDiv).fadeOut("slow");
        $(idChk).prop("checked", false);
        $(idDate).val("1899-09-09").prop("required", false);
    }
}

//Respuestas simples a esconder otra variable
function respuestaSelect(idSelect, idDiv, idResp) {
    if ($(idSelect).val() === '1') {
        $(idDiv).fadeIn("slow");
        $(idResp).val('').prop("required", true);
    } else {
        $(idDiv).fadeOut("slow");
        $(idResp).val('-2').prop("required", false);
    }
}
function respuestaSelectbis() {
    switch ($('#tipoMedidaPA').val()) {
        case '1':
            $('#dTipoMedidaPL').fadeIn("slow");
            $('#dTipoMedidaNPL').fadeOut("slow");
            $('#tipoMedidaPL').val('').prop("required", true);
            $('#tipoMedidaNPL').val('-2').prop("required", false);
            break;
        case '2':
            $('#dTipoMedidaPL').fadeOut("slow");
            $('#dTipoMedidaNPL').fadeIn("slow");
            $('#tipoMedidaNPL').val('').prop("required", true);
            $('#tipoMedidaPL').val('-2').prop("required", false);
            $('#Dinternamiento').hide();
            $('#internamiento').val('-2').prop("required", false);
            break;
        default:
            $('#dTipoMedidaPL,#dTipoMedidaNPL,#Dinternamiento').fadeOut("slow");
            $('#tipoMedidaPL,#tipoMedidaNPL,#internamiento').val('-2').prop("required", false);
            break;
    }
}
// Fechas No identificadas
function fechaNoIdent(idChk, idTxtDate) {
    if ($(idChk).is(":checked")) {
        $(idTxtDate).val("1899-09-09");
        $(idTxtDate).prop("disabled", true);
    } else {
        $(idTxtDate).val("");
        $(idTxtDate).prop("disabled", false);
    }
}
/*****************************FIN DE FUNCIONES ETAPA INTERMEDIA*****************/

/**************************FUNCION ETAPA INICIAL *******************************/
/***
 * 
 * @param {type} idChk
 * @param {type} idTable
 * @returns {undefined}
 */
function despliegaTabla(idChk, idTable) {
    if ($(idChk).val() === '1') {
        $(idTable).fadeIn("slow");
    } else {
        $(idTable).fadeOut("slow");
    }
}
function medidasCaute(idChk) {
    if ($(idChk).val() === '1') {
        var i = 0;
        if ($("#apliMedidaCau99").is(":checked")) {
            i = 1;
        }
        for (var x = 1; x < 14; x++) {
            if ($("#apliMedidaCau" + x).is(":checked")) {
                i = i + 1;
            }
        }
        if (i === 0) {
            alert("Selecciona por lo menos una Medida Cautelar");
            return false;
        } else {
            return true;
        }
    } else {
        return true;
    }
}
/*****************************FIN DE FUNCIONES ETAPA INICIAL********************/

/*****************************FUNCIONES LLENAR MUNICIPIOS***********************/
/***
 * 
 * @param {type} idEnt
 * @param {type} idMun
 * @returns {undefined}
 */
function llenaMun(idEnt, idMun) {
    var enti = $(idEnt).val();
    if (enti !== '') {
        $.ajax({
            url: "obtenMunicipios.jsp",
            dataType: 'html',
            type: "post",
            data: {enti: enti},
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
            }
        }).done(function (data) {
            $(idMun).html(data);
            //$('#municipioJ').selectize();
        });
    } else {
        $(idMun).empty().append("<option value='0'>--Seleccione--</option>");
    }
}
/***************************** FIN DE FUNCIONES LLENAR MUNICIPIOS***************/

/*******************FUNCIONES DE CONCLUSIONES***********************************/
function resSobreseimiento() {
    if ($('#tipoConclusion').val() === '1') {
        $('#idSobre,#proceSobre').fadeIn("slow");
        $('#tipoSobreseimto,#proceSobreseimto').val('').prop("required", true);
    } else {
        $('#idSobre,#proceSobre').fadeOut('slow');
        $('#tipoSobreseimto,#proceSobreseimto').val('-2').prop("required", false);
    }
}
function proceAbreviado(){
    if($('#huboProsedimto').val() === '1'){
        $('#dTipoMedidaPA').fadeIn("slow");
        $('#tipoMedidaPA').val('').prop("required", true);
    } else {
         $('#dTipoMedidaPA,#dTipoMedidaNPL,#dTipoMedidaPL,#Dinternamiento').fadeOut("slow");
        $('#tipoMedidaPA,#tipoMedidaPL,#internamiento,#tipoMedidaNPL').val('-2').prop("required", false);
    }
}
function rInternamiento() {
    if (($('#tipoMedidaPL').val() === '2') || ($('#tipoMedidaPL').val() === '3')) {
        $('#Dinternamiento').fadeIn("slow");
        $('#internamiento').val('').prop("required", true);
    } else {
        $('#Dinternamiento').fadeOut("slow");
        $('#internamiento').val('-2').prop("required", false);
    }
}
function respuestaRepara() {
    if ($('#reparaDanio').val() === '1') {
        $('#tipoRepara').fadeIn("slow");
        $('#tipoReparaD').val('').prop("required", true);
    } else {
        $('#montoRepara,#tipoRepara').fadeOut("slow");
        $('#montoReparaD,#tipoReparaD').val('-2').prop("required", false);        
    }
}
function pagoCosa() {
    if ($('#tipoReparaD').val() === '2') {
        $('#montoRepara').fadeIn("slow");
        $('#montoReparaD').val('').prop("required", true);
    } else {
        $('#montoRepara').fadeOut("slow");
        $('#montoReparaD').val('-2').prop("required", false);
    }
}
function impugna() {
    if ($('#impugnacion').val() === '1') {
        $('#tipoImpugna,#fechaImpugna,#quienImpugna').fadeIn("slow");
        $('#tipoImpugnacion,#personaImpugna').val('').prop("required", true);
        $('#fechaImpugnacion').val("").prop("disabled", false).prop("required", true);
        $('#chkFechaImpugnacion').prop("checked", false);
    } else {
        $('#tipoImpugna,#fechaImpugna,#quienImpugna').fadeOut("slow");
        $('#tipoImpugnacion,#personaImpugna').val('-2').prop("required", false);
        $('#fechaImpugnacion').val("1899-09-09").prop("required", false);
    }
}
/*******************FIN DE FUNCIONES DE CONCLUSIONES****************************/

/*******************FUNCIONES DE EXPEDIENTES************************************/
function competencia() {
    switch ($('#compe').val()) {
        case '1':
            $('#tipoIncopetencia').fadeOut("slow");
            $('#Tincompe').val('-2').prop('required', false);
            $('#expAcomulado, #idparticular, #divProcedimiento, #totalElementos, #totalAudiencias').fadeIn("slow");
            $('#Tdelitos, #Tadolescentes, #Tvictimas').val('').prop("required", true);
            $('#ExpAcomu, #Pparticular, #Tprocedi').val('').prop("required", true);
            break;
        case '2':
            $('#tipoIncopetencia').fadeIn("slow");
            $('#Tincompe').val('').prop("required", true);
            $('#expAcomulado, #idparticular, #divProcedimiento, #totalElementos, #totalAudiencias').fadeOut("slow");
            $('#ExpAcomu, #Pparticular, #Tprocedi, #Tdelitos, #Tadolescentes, #Tvictimas').val('-2').prop("required", false);
            break;
    }

}
function expacumula() {
    if ($('#ExpAcomu').val() === '1') {
        $('#expReferen').fadeIn("slow");
        $('#ExpRefe').val('').prop("required", true);
    } else {
        $('#expReferen').fadeOut("slow");
        $('#ExpRefe').val('-2').prop("required", false);
    }
}
//function audien(idChk) {
//    if ($(idChk).val() === '1') {
//        var i = 0;
//        for (var x = 1; x < 15; x++) {
//            if ($("#aplAudi" + x).is(":checked")) {
//                i = i + 1;
//            }
//        }
//    }
//    if (i === 0) {
//        alert("Selecciona por lo menos una Audiencia");
//        return false;
//    } else {
//        return true;
//    }
//}
function expeAudiencia() {
    if($('#compe').val()===2)
    $('#expedientesF').submit(function(e){
       if($('#aplAudi:checked').length===0){
           e.preventDefault();
           alert("Selecciona por lo menos una Audiencia");
       } 
    });
}
/*************************FIN DE FUNCIONES DE EXPEDIENTES***********************/
