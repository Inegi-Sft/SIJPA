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

    /***************************** FUNCIONES JUZGADOS *******************************/
    //select forma de organizacion
    $("#fOrganiza").change(function () {
        switch ($("#fOrganiza").val()) {
            case '1':
                $("#dRegJudicial").fadeIn("slow");
                $("#regJudicial").val("");
                $("#dDistJudicial").hide();
                $("#distJudicial").val("-2");
                $("#dPartJudicial").hide();
                $("#partJudicial").val("-2");
                break;
            case '2':
                $("#dRegJudicial").hide();
                $("#regJudicial").val("-2");
                $("#dDistJudicial").fadeIn("slow");
                $("#distJudicial").val("");
                $("#dPartJudicial").hide();
                $("#partJudicial").val("-2");
                break;
            case '3':
                $("#dRegJudicial").hide();
                $("#regJudicial").val("-2");
                $("#dDistJudicial").hide();
                $("#distJudicial").val("-2");
                $("#dPartJudicial").fadeIn("slow");
                $("#partJudicial").val("");
                break;
        }
        if ($("#fOrganiza").val() > 3 || $("#fOrganiza").val() === "") {
            $("#dRegJudicial").fadeOut("slow");
            $("#regJudicial").val("-2");
            $("#dDistJudicial").fadeOut("slow");
            $("#distJudicial").val("-2");
            $("#dPartJudicial").fadeOut("slow");
            $("#partJudicial").val("-2");
        }
    });
    /*---------------------------- FIN FUNCIONES JUZGADOS ----------------------------*/

    /*---------------------------- VICTIMAS ----------------------------*/
    $('#tipo_victima').change(function () {
        switch ($(this).val()) {
            case '1':
                $('#victiFisicas, #mediProtec, #mediProtecMuj').fadeIn('slow');
                $('#sexo, #fnacimiento, #edad, #vulnera, #Pnacimiento, #naciona, #Preside, #conyugal, #discapacidad, \n\
                    #alfabetismo, #estudios, #interprete, #hablaesp, #indigena, #ocupa, #mProtect, #mujProtect').val('').prop('required', true);
                break;
            case '2':
                $('#mediProtec').fadeIn('slow');
                $('#mProtect').val('').prop('required', true);

                $('#victiFisicas, #mediProtecMuj').fadeOut('slow');
                $('#sexo, #fnacimiento, #edad, #vulnera, #Pnacimiento, #naciona, #Preside, #conyugal, #discapacidad, \n\
                    #alfabetismo, #estudios, #interprete, #hablaesp, #indigena, #ocupa, #mujProtect').val('').prop('required', false);
                break;
            default:
                $('#victiFisicas, #mediProtec, #mediProtecMuj').fadeOut('slow');
                $('#sexo, #fnacimiento, #edad, #vulnera, #Pnacimiento, #naciona, #Preside, #conyugal, #discapacidad, \n\
                    #alfabetismo, #estudios, #interprete, #hablaesp, #indigena, #ocupa, #mProtect, #mujProtect').val('').prop('required', false);
                break;
        }
    });

    $('#Pnacimiento').change(function () {
        if ($(this).val() === '1') {
            $('#estaNaci, #munNaci').fadeIn('slow');
            $('#Enacimiento, #Mnacimiento').val('').prop('required', true);
        } else {
            $('#estaNaci, #munNaci').fadeOut('slow');
            $('#Enacimiento, #Mnacimiento').val().prop('required', true);
        }
    });

    $('#Preside').change(function () {
        if ($(this).val() === '1') {
            $('#estaResi, #munResi').fadeIn('slow');
            $('#Ereside, #Mreside').val('').prop('required', true);
        } else {
            $('#estaResi, #munResi').fadeOut('slow');
            $('#Ereside, #Mreside').val().prop('required', true);
        }
    });

    $('#indigena').change(function () {
        if ($(this).val() === '1') {
            $('#famLingui').fadeIn('slow');
            $('#familia').val('').prop('required', true);
        } else {
            $('#famLingui').fadeOut('slow');
            $('#familia').val('').prop('required', false);
        }
    });

    $('#con_asesor').change(function () {
        if ($(this).val() === '1') {
            $('#asesorJuri').fadeIn('slow');
            $('#asesor').val('').prop('required', true);
        } else {
            $('#asesorJuri').fadeOut('slow');
            $('#asesor').val('').prop('required', false);
        }
    });

    $('#victimasF').submit(function (e) {
        if ($('#chkFechaReclaDel:checked').length === 0) {
            e.preventDefault();
            alert('Selecciona al menos una opcion de Tipo de Relacion Victima con Procesado');
            $('#chkFechaReclaDel').focus();
        }
        
        if ($('#mProtect').val() === '1') {
            if ($('#aplicaMedida:checked').length === 0) {
                e.preventDefault();
                alert('Selecciona al menos una opcion de Medidas de Proteción');
                $('#mProtect').focus();
            }
        }
        
        if ($('#mujProtect').val() === '1') {
            if ($('#aplicaMedidaMuj:checked').length === 0) {
                e.preventDefault();
                alert('Selecciona al menos una opcion de Medidas de Proteción contra Mujeres');
                $('#mujProtect').focus();
            }
        }
    });
    /*---------------------------- FIN VICTIMAS ----------------------------*/
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
    if (obj.checked)
        document.getElementById(idTxt).disabled = false;
    else
        document.getElementById(idTxt).disabled = true;
}
;
/*****************************FIN PARA CAPTURA EXPEDIENTES *********************/

/******************************FUNCIONES ETAPA INTERMEDIA***************************/
//Respuestas simples y fechas con NI
/***
 * 
 * @param {type} idSelect
 * @param {type} idLbl
 * @param {type} idDate
 * @param {type} idNI
 * @param {type} idchk
 * @returns {undefined}
 */
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
;

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
;

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
;
/*****************************FIN DE FUNCIONES ETAPA INTERMEDIA***************************/

/**************************FUNCION ETAPA INICIAL *****************************************/
/***
 * 
 * @param {type} idChk
 * @param {type} idTable
 * @returns {undefined}
 */
function despliegaTabla(idChk, idTable) {
    if ($(idChk).val() !== '1') {
        $(idTable).fadeOut("slow");
    } else {
        $(idTable).fadeIn("slow");
    }
}
;

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
        if (i === 0) {
            alert("Selecciona por lo menos una Medida Cautelar");
            return false;
        } else {
            return true;
        }
    }
}
;
/*****************************FIN DE FUNCIONES ETAPA INICIAL***************************/

/*****************************FUNCIONES LLENAR MUNICIPIOS***************************/
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
;
/***************************** FIN DE FUNCIONES LLENAR MUNICIPIOS***************************/

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
;

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
;

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
;

function pagoCosa() {
    if ($('#tipoReparaD').val() === '2') {
        $('#montoRepara').fadeIn("slow");
        $('#montoReparaD').val('');
    } else {
        $('#montoRepara').fadeOut("slow");
        $('#montoReparaD').val('-2');
    }
}
;

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
;
/*******************FIN FUNCIONES DE CONCLUSIONES**********************************/

/****************************** FUNCIONES PROCESADOS ******************************/
//para respuesta simple, oculta el select contenido en un div
/***
 * 
 * @param {type} idSelSimple
 * @param {type} idDiv
 * @param {type} idSelOculta
 * @returns {undefined}
 */
function respuestaSimpleSelect(idSelSimple, idDiv, idSelOculta) {
    if ($(idSelSimple).val() === '1') {
        $(idDiv).fadeIn("slow");
        $(idSelOculta).val("");
    } else {
        $(idDiv).fadeOut("slow");
        $(idSelOculta).val("-2");
    }
}
;

function lugarNacimiento(idSelect, idDivE, idDivM, idSelEnti, idSelMuni) {
    if ($(idSelect).val() === '1') {
        $(idDivE).fadeIn("slow");
        $(idDivM).fadeIn("slow");
        $(idSelEnti).val("");
        $(idSelMuni).val("");
    } else {
        $(idDivE).fadeOut("slow");
        $(idDivM).fadeOut("slow");
        $(idSelEnti).val("-2");
        $(idSelMuni).val("-2");
    }
}
;

function lugarResidencia(idSelect, idDivE, idDivM, idSelEnti, idSelMuni) {
    if ($(idSelect).val() === '1' || $(idSelect).val() === '2') {
        $(idDivE).fadeIn("slow");
        $(idDivM).fadeIn("slow");
        $(idSelEnti).val("");
        $(idSelMuni).val("");
    } else {
        $(idDivE).fadeOut("slow");
        $(idDivM).fadeOut("slow");
        $(idSelEnti).val("-2");
        $(idSelMuni).val("-2");
    }
}
;

//numeral 10 indica no ejercia ninguna ocupacion
function ocupacionAdo(idSelect, idDiv, idSelOculta) {
    if ($(idSelect).val() === '10') {
        $(idDiv).fadeIn("slow");
        $(idSelOculta).val("");
    } else {
        $(idDiv).fadeOut("slow");
        $(idSelOculta).val("-2");
    }
}
;
/*---------------------------- FIN FUNCIONES PROCESADOS --------------------------*/

/***************************** FUNCIONES DELITOS *******************************/
/***
 * 
 * @param {type} idSelSimple
 * @param {type} idDiv
 * @param {type} idDateOculta
 * @returns {undefined}
 */
function respuestaSimpleFecha(idSelSimple, idDiv, idDateOculta) {
    if ($(idSelSimple).val() === '1') {
        $(idDiv).fadeIn("slow");
        $(idDateOculta).val("");
    } else {
        $(idDiv).fadeOut("slow");
        $(idDateOculta).val("1799-09-09");
    }
}
;
/*---------------------------- FIN FUNCIONES DELITOS --------------------------*/

/***************************** FUNCIONES GENERALES *********************************/
// Fechas No identificadas
/***
 * 
 * @param {type} idChk
 * @param {type} idTxtDate
 * @returns {undefined}
 */
function fechaNoIdent(idChk, idTxtDate) {
    if ($(idChk).is(":checked")) {
        $(idTxtDate).val("1899-09-09");
        $(idTxtDate).prop("disabled", true);
    } else {
        $(idTxtDate).val("");
        $(idTxtDate).prop("disabled", false);
    }
}
;
