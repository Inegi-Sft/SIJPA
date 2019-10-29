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
    //Auto acompletado
    $('#delitoCP').selectize({
        render: {
            option: function (data, escape) {
                return '<div data-norma="' + data.norma + '">' + data.text + '</div>';
            }
        },
        onChange: function (value) {
            var vNorma = this.getOption(value).data('norma');
            llenaNormaT(vNorma);
        },
        onBlur: function () {
            this.clearCache();
        }
    });

    //oculta los divs con clase oculto (se utiliza en lugar de nacimiento y residencia)
    $('.oculto').hide();

    /***************************** FUNCIONES JUZGADOS *******************************/
    //select forma de organizacion
    $("#fOrganiza").change(function () {
        switch ($("#fOrganiza").val()) {
            case '1':
                $("#dRegJudicial").fadeIn("slow");
                $("#regJudicial").val("").prop("required", true);
                $("#dDistJudicial,#dPartJudicial").hide();
                $("#distJudicial,#partJudicial").val("-2").prop("required", false);
                break;
            case '2':
                $("#dRegJudicial,#dPartJudicial").hide();
                $("#regJudicial,#partJudicial").val("-2").prop("required", false);
                $("#dDistJudicial").fadeIn("slow");
                $("#distJudicial").val("").prop("required", true);
                break;
            case '3':
                $("#dRegJudicial,#dDistJudicial").hide();
                $("#regJudicial,#distJudicial").val("-2").prop("required", false);
                $("#dPartJudicial").fadeIn("slow");
                $("#partJudicial").val("").prop("required", true);
                break;
        }
        if ($("#fOrganiza").val() > 3 || $("#fOrganiza").val() === "") {
            $("#dRegJudicial,#dDistJudicial,#dPartJudicial").fadeOut("slow");
            $("#regJudicial,#distJudicial,#partJudicial").val("-2").prop("required", false);
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

/********************splash del inicio del sistema***********************/
function splashIn() {
    //despliega splash screen al principio del sistema
    $('body').css('overflow', 'hidden');
    setTimeout(function () {
        $('body').css('overflow', 'auto');
    }, 4500);
    $('#splash').delay(4000).slideUp('slow');
    //termina splash screen
}
/******************** fin splash del inicio del sistema***********************/

/***************************** PARA CAPTURA EXPEDIENTES *********************/
//Habilita text de Audiencias en Expedientes
/***
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
;
/*****************************FIN PARA CAPTURA EXPEDIENTES *********************/

/******************************FUNCIONES ETAPA INTERMEDIA***************************/
//Respuestas simples y fechas con NI
/***
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

function etapaInter() {
    if ($('#audiInterme').val() === '1') {
        $('#divfechaAudiinter,#divfechaEscrito').fadeIn("slow");
        $('#chkAudiinter,#chkEscrito').prop("checked", false);
        $('#fechaAudiinter,#fechaEscrito').val("").prop("disabled", false).prop("required", true);
    } else {
        $('#divfechaAudiinter,#divfechaEscrito').fadeOut("slow");
        $('#chkAudiinter,#chkEscrito').prop("checked", false);
        $('#fechaAudiinter,#fechaEscrito').val("1899-09-09").prop("disabled", false).prop("required", false);
    }
}
/*****************************FIN DE FUNCIONES ETAPA INTERMEDIA***************************/

/**************************FUNCION ETAPA INICIAL *******************************/
/***
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

function fechaEnProceso(idChkNi, idChkEP, idTxtDate) {
    if ($(idChkNi).is(":checked")) {
        $(idTxtDate).val("1899-09-09");
        $(idTxtDate).prop("disabled", true);
        $(idChkEP).prop("disabled", true);
    } else {
        $(idTxtDate).val("");
        $(idTxtDate).prop("disabled", false);
        $(idChkEP).prop("disabled", false);
    }

    if ($(idChkEP).is(":checked")) {
        $(idTxtDate).val("1699-09-09");
        $(idTxtDate).prop("disabled", true);
        $(idChkNi).prop("disabled", true);
    } else {
        $(idChkNi).prop("disabled", false);
    }
}
/*****************************FIN DE FUNCIONES ETAPA INICIAL***************************/


/*****************************FUNCIONES LLENAR MUNICIPIOS***************************/
/***
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

function proceAbreviado() {
    if ($('#huboProsedimto').val() === '1') {
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
        $(idSelOculta).prop("required", true);
        $(idSelOculta).val("");
    } else {
        $(idDiv).fadeOut("slow");
        $(idSelOculta).val("-2");
        $(idSelOculta).prop("required", false);
    }
}

function lugarNacimiento(idSelect, idDivE, idDivM, idSelEnti, idSelMuni) {
    if ($(idSelect).val() === '1') {
        $(idDivE).fadeIn("slow");
        $(idDivM).fadeIn("slow");
        $(idSelEnti).prop("required", true);
        $(idSelMuni).prop("required", true);
        $(idSelEnti).val("");
        $(idSelMuni).val("");
    } else {
        $(idDivE).fadeOut("slow");
        $(idDivM).fadeOut("slow");
        $(idSelEnti).prop("required", false);
        $(idSelMuni).prop("required", false);
        $(idSelEnti).val("-2");
        $(idSelMuni).val("-2");
    }
}

function lugarResidencia(idSelect, idDivE, idDivM, idSelEnti, idSelMuni) {
    if ($(idSelect).val() === '1' || $(idSelect).val() === '2') {
        $(idDivE).fadeIn("slow");
        $(idDivM).fadeIn("slow");
        $(idSelEnti).prop("required", true);
        $(idSelMuni).prop("required", true);
        $(idSelEnti).val("");
        $(idSelMuni).val("");
    } else {
        $(idDivE).fadeOut("slow");
        $(idDivM).fadeOut("slow");
        $(idSelEnti).prop("required", false);
        $(idSelMuni).prop("required", false);
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
/*---------------------------- FIN FUNCIONES PROCESADOS --------------------------*/

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

function expeAudiencia() {
    if ($('#compe').val() === 2)
        $('#expedientesF').submit(function (e) {
            if ($('#aplAudi:checked').length === 0) {
                e.preventDefault();
                alert("Selecciona por lo menos una Audiencia");
            }
        });
}
/*************************FIN DE FUNCIONES DE EXPEDIENTES***********************/

/***************************** FUNCIONES DELITOS *******************************/
/***
 * 
 * @param {type} idSelSimple
 * @param {type} idDiv
 * @param {type} idDateOculta
 * @param {type} idChk
 * @returns {undefined}
 */
function respuestaSimpleFecha(idSelSimple, idDiv, idDateOculta, idChk) {
    if ($(idSelSimple).val() === '1') {
        $(idDiv).fadeIn("slow");
        $(idChk).prop("checked", false);
        $(idDateOculta).val("").prop("disabled", false).prop("required", true);
    } else {
        $(idDiv).fadeOut("slow");
        $(idDateOculta).prop("required", false);
        $(idDateOculta).val("1799-09-09");
        $(idChk).prop("checked", false);
    }
}

//llena el select de norma tecnica de acuerdo con el select codigo penal
function llenaNormaT(vNorma) {
    if (vNorma !== '') {
        $.ajax({
            url: "obtenNormaTec.jsp",
            dataType: 'html',
            type: "post",
            data: {norma: vNorma},
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
            }
        }).done(function (data) {
            $('#delitoNT').html(data);
        });
    } else {
        $('#delitoNT').empty().append("<option value='0'>--Seleccione--</option>");
    }
}
/*---------------------------- FIN FUNCIONES DELITOS --------------------------*/
