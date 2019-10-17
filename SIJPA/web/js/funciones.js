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

    //oculta los divs con clase oculto (se utiliza en lugar de nacimiento y residencia)
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

/***************************** PARA CAPTURA EXPEDIENTES *********************/
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
//Respuestas simples y fechas con NI
function resSimpleFech(idSelect, idDiv, idDate, idChk) {
    if ($(idSelect).val() === '1') {
        $(idDiv).fadeIn("slow");
        $(idChk).prop("checked", false);
        $(idDate).val("").prop("disabled", false).prop("required", true);
    } else {
        $(idDiv).fadeOut("slow");
        $(idChk).prop("checked", false);
        $(idDate).val("1899-09-09").prop("required", false);
    }
};

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
            $('#dTipoMedidaPL').fadeOut("slow");
            $('#dTipoMedidaNPL').fadeOut("slow");
            $('#Dinternamiento').fadeOut("slow");
            $('#tipoMedidaPL').val('-2').prop("required", false);
            $('#tipoMedidaNPL').val('-2').prop("required", false);
            $('#internamiento').val('-2').prop("required", false);
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
};
/*****************************FIN DE FUNCIONES ETAPA INICIAL***************************/

/*****************************FUNCIONES LLENAR MUNICIPIOS***************************/
/***
 * 
 * @param {type} idEnt
 * @param {type} idMun
 * @returns {undefined}
 */
function llenaMun(idEnt,idMun) {
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
};
/***************************** FIN DE FUNCIONES LLENAR MUNICIPIOS***************************/

/*******************FUNCIONES DE CONCLUSIONES**********************************/
function resSobreseimiento() {
    if ($('#tipoConclusion').val() === '1') {
        $('#idSobre').fadeIn('slow');
        $('#proceSobre').fadeIn('slow');
        $('#tipoSobreseimto').val('').prop("required", true);
        $('#proceSobreseimto').val('').prop("required", true);
    } else {
        $('#idSobre').fadeOut('slow');
        $('#proceSobre').fadeOut('slow');
        $('#tipoSobreseimto').val('-2').prop("required", false);
        $('#proceSobreseimto').val('-2').prop("required", false);
    }
};

function rInternamiento() {
    if (($('#tipoMedidaPL').val() === '2') || ($('#tipoMedidaPL').val() === '3')) {
        $('#Dinternamiento').fadeIn("slow");
        $('#internamiento').val('').prop("required", true);
    } else {
        $('#Dinternamiento').fadeOut("slow");
        $('#internamiento').val('-2').prop("required", false);
    }
};

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
};

function pagoCosa() {
    if ($('#tipoReparaD').val() === '2') {
        $('#montoRepara').fadeIn("slow");
        $('#montoReparaD').val('').prop("required", true);
    } else {
        $('#montoRepara').fadeOut("slow");
        $('#montoReparaD').val('-2').prop("required", false);
    }
};

function impugna() {
    if ($('#impugnacion').val() === '1') {
        $('#tipoImpugna').fadeIn("slow");
        $('#fechaImpugna').fadeIn("slow");
        $('#quienImpugna').fadeIn("slow");
        $('#tipoImpugnacion').val('').prop("required", true);
        $('#fechaImpugnacion').val("").prop("disabled", false).prop("required", true);
        $('#chkFechaImpugnacion').prop("checked", false);
        $('#personaImpugna').val('').prop("required", true);
    } else {
        $('#tipoImpugna').fadeOut("slow");
        $('#fechaImpugna').fadeOut("slow");
        $('#quienImpugna').fadeOut("slow");
        $('#tipoImpugnacion').val('-2').prop("required", false);
        $('#fechaImpugnacion').val("1899-09-09").prop("required", false);
        $('#personaImpugna').val('-2').prop("required", false);
    }
}
/*******************FIN DE FUNCIONES DE CONCLUSIONES**********************************/

/*******************FUNCIONES DE EXPEDIENTES**********************************/
function competencia() {
    if ($('#compe').val() === '1') {
        $('#tipoIncopetencia').fadeOut("slow");
        $('#Tincompe').val('-2').prop('required', false);
        $('#expAcomulado').fadeIn("slow");
        $('#ExpAcomu').val('').prop("required", true);
        $('#idparticular').fadeIn("slow");
        $('#Pparticular').val('').prop("required", true);
        $('#divProcedimiento').fadeIn("slow");
        $('#Tprocedi').val('').prop("required", true);
        $('#totalElementos').fadeIn("slow");
        $('#Tdelitos').val('').prop("required", true);
        $('#Tadolescentes').val('').prop("required", true);
        $('#Tvictimas').val('').prop("required", true);
        $('#totalAudiencias').fadeIn("slow");
    } else {
        $('#tipoIncopetencia').fadeIn("slow");
        $('#Tincompe').val('').prop('required', true);
        $('#expAcomulado').fadeOut("slow");
        $('#ExpAcomu').val('-2').prop("required", false);
        $('#idparticular').fadeOut("slow");
        $('#Pparticular').val('-2').prop("required", false);
        $('#divProcedimiento').fadeOut("slow");
        $('#Tprocedi').val('-2').prop("required", false);
        $('#totalElementos').fadeOut("slow");
        $('#Tdelitos').val('-2').prop("required", false);
        $('#Tadolescentes').val('-2').prop("required", false);
        $('#Tvictimas').val('-2').prop("required", false);
        $('#totalAudiencias').fadeOut("slow");
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
function audien(idChk) {
    if ($(idChk).val() === '1') {
        var i = 0;
        for (var x = 1; x < 15; x++) {
            if ($("#aplAudi" + x).is(":checked")) {
                i = i + 1;
            }
        }
    }
    if (i === 0) {
        alert("Selecciona por lo menos una Audiencia");
        return false;
    } else {
        return true;
    }
}

