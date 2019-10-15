/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global selecChk */

$(document).ready(function () {
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
    //Auto acompletado
    $('#delitoCP').selectize();
//    $('#municipioD').selectize();
//    $('#municipioJ').selectize();
//    $('#nMunicipio').selectize();
//    $('#rMunicipio').selectize();
    $('#Mnacimiento').selectize();
    $('#Mreside').selectize();
    $('.oculto').hide();
    

});
/********************FUNCIONES ETAPA INTERMEDIA***************************/

//Habilita text de Audiencias en Expedientes
function comprobar(obj, idTxt) {
    if (obj.checked)
        document.getElementById(idTxt).disabled = false;
    else
        document.getElementById(idTxt).disabled = true;
}

//Respuestas simples y fechas con NI
function respuestaSimple(idSelect, idLbl, idDate, idNI, idchk) {
    if ($(idSelect).val() !== '1') {
        $(idLbl).fadeOut("slow");
        $(idDate).val("1899-09-09").fadeOut("slow");
        $(idNI).fadeOut("slow");
    } else {
        $(idLbl).fadeIn("slow");
        $(idNI).fadeIn("slow");
        $(idchk).prop('checked', false);
        $(idDate).val("").prop("disabled", false).fadeIn("slow");
    }
}
//Respuestas simples a esconder otra variable
function respuestaSelect(idSelect, idLabel, idResp) {
    if ($(idSelect).val() !== '1') {
        $(idLabel).fadeOut("slow");
        $(idResp).val('-2');
        $(idResp).fadeOut("slow");
    } else {
        $(idLabel).fadeIn("slow");
        $(idResp).val('').fadeIn("slow");
    }
}

function respuestaSelectbis() {
    switch ($('#tipoMedidaPA').val()) {
        case '1':
            $('#dTipoMedidaPL').fadeIn("slow");
            $('#dTipoMedidaNPL').hide();
            $('#tipoMedidaPL').val('');
            break;
        case '2':
            $('#dTipoMedidaNPL').fadeIn("slow");
            $('#dTipoMedidaPL').hide();
            $('#Dinternamiento').hide();
            $('#tipoMedidaNPL').val('');
            $('#internamiento').val('');
            break;
        default:
            $('#tipoMedidaPL').val('-2');
            $('#tipoMedidaNPL').val('-2');
            $('#dTipoMedidaPL').fadeOut("slow");
            $('#dTipoMedidaNPL').fadeOut("slow");
            $('#Dinternamiento').hide();
            $('#internamiento').val('');
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

/*****************************FIN DE FUNCIONES ETAPA INTERMEDIA***************************/

/**************************FUNCION ETAPA INICIAL *****************************************/
function despliegaTabla(idChk, idTable) {
    if ($(idChk).val() !== '1') {
        $(idTable).fadeOut("slow");
    } else {
        $(idTable).fadeIn("slow");
    }
}


function medidasCaute(idChk) {
    if (($(idChk).val === 1) || $(idChk).val() === '') {
        return true;
    } else {
        var i = 0;
        if ($("#apliMedidaCau99").is(":checked")) {
            i = 1;
        }
        for (var x = 1; x < 14; x++) {
            if ($("#apliMedidaCau" + x).is(":checked")) {
                i = i + 1;
            }
        }
        if (i == 0) {
            alert("Selecciona por lo menos una Medida Cautelar");
            return false;
        } else {

            return true;
        }
    }
}


/*******************FUNCIONES DE CONCLUSIONES**********************************/
function resSobreseimiento() {
    if ($('#tipoConclusion').val() === '1') {
        $('#idSobre').fadeIn('slow');
        $('#proceSobre').fadeIn('slow');
        $('#tipoSobreseimto').val('');
        $('#proceSobreseimto').val('');
    } else {
        $('#idSobre').fadeOut('slow');
        $('#proceSobre').fadeOut('slow');
        $('#tipoSobreseimto').val('-2');
        $('#proceSobreseimto').val('-2');
    }
}
function rInternamiento() {
    if (($('#tipoMedidaPL').val() === '2') || ($('#tipoMedidaPL').val() === '3')) {
        $('#Dinternamiento').fadeIn("slow");
        $('#internamiento').val('').fadeIn("slow");
    } else {
        $('#Dinternamiento').fadeOut("slow");
        $('#internamiento').val('-2');
        $('#internamiento').fadeOut("slow");
    }
}
function respuestaRepara() {
    if ($('#reparaDanio').val() === '1') {
        $('#tipoRepara').fadeIn("slow");
        $('#tipoReparaD').val('');
    } else {
        $('#tipoRepara').fadeOut("slow");
        $('#tipoReparaD').val('-2');
        $('#montoRepara').fadeOut("slow");
        $('#montoReparaD').val('-2');
    }
}
function pagoCosa() {
    if ($('#tipoReparaD').val() === '2') {
        $('#montoRepara').fadeIn("slow");
        $('#montoReparaD').val('');
    } else {
        $('#montoRepara').fadeOut("slow");
        $('#montoReparaD').val('-2');
    }
}
function impugna() {
    if ($('#impugnacion').val() === '1') {
        $('#tipoImpugna').val('').fadeIn("slow");
        $('#fechaImpugna').val('').fadeIn("slow");
        $('#quienImpugna').val('').fadeIn("slow");
    } else {
        $('#tipoImpugna').val('-2').fadeOut("slow");
        $('#fechaImpugna').val("1899-09-09").fadeOut("slow");
        $('#quienImpugna').val('-2').fadeOut("slow");
    }
}