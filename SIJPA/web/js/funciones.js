$(document).ready(function () {
    $('select > option[value=-2]').hide();
    $(".load").fadeOut("slow");//proceso de carga para causas penales

    //despliega ventana modal
    $('#tablaVictimas, #tablaDeli, #tablaProcesa, #tablaInicial, #tablaIntermedia, #tablaConclu, .agregar').on('focusin', function () {
        $('a.pop').fancybox({
            'type': 'iframe',
            'overlayShow': true,
            'toolbar': false,
            'smallBtn': true,
            'iframe': {
                'css': {
                    'width': '1400px',
                    'height': '560px'
                }
            }
        });
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

            if (vNorma === 31) {//norma tecnica robo a casa habitacion
                $('#fldsAdicionales').fadeIn("slow");
                $('#dCosaRobada').fadeIn("slow");
                $('#dContextoSitua').fadeOut();
            } else if (vNorma === 1 || vNorma === 4) {//norma tecnica homicidio o lesiones
                $('#fldsAdicionales').fadeIn("slow");
                $('#dContextoSitua').fadeIn("slow");
                $('#dCosaRobada').fadeOut();
            } else {
                $('#fldsAdicionales').fadeOut("slow");
            }
        },
        onBlur: function () {
            this.clearCache();
        }
    });

    //oculta los divs con clase oculto (se utiliza en lugar de nacimiento y residencia)

    $('.oculto').hide();
    $('.dependiente').val('-2');

    /***************************** FUNCIONES JUZGADOS *******************************/
    //select forma de organizacion
    $("#fDivision").change(function () {
        switch ($("#fDivision").val()) {
            case '1':
                $("#dRegJudicial").fadeIn("slow");
                $("#regJudicial").val("").prop("required", true);
                $("#dDistJudicial,#dPartJudicial").hide();
                $("#distJudicial,#partJudicial").val("-2").prop("required", false);
                break;
            case '2':
                $("#dDistJudicial").fadeIn("slow");
                $("#distJudicial").val("").prop("required", true);
                $("#dRegJudicial,#dPartJudicial").hide();
                $("#regJudicial,#partJudicial").val("-2").prop("required", false);
                break;
            case '3':
                $("#dPartJudicial").fadeIn("slow");
                $("#partJudicial").val("").prop("required", true);
                $("#dRegJudicial,#dDistJudicial").hide();
                $("#regJudicial,#distJudicial").val("-2").prop("required", false);
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
                $('#tipoMoral').fadeOut('slow');
                $('#tvic_moral').val('-2').prop('required', false);
                break;
            case '2':
                $('#tipoMoral').fadeIn('slow');
                $('#tvic_moral').val('').prop('required', true);

                $('#victiFisicas, #mediProtec,  #mediProtecMuj').fadeOut('slow');
                $('#sexo, #edad, #vulnera, #Pnacimiento, #Enacimiento, #Mnacimiento, #naciona, #Preside, #Ereside, #Mreside, #conyugal, #discapacidad, \n\
                    #alfabetismo, #estudios,#indigena, #familia, #interprete, #hablaesp, #ocupa, #mProtect, #mujProtect').val('-2').prop('required', false);
                $('#fnacimiento').val("1899-09-09").prop('required', false);
                break;
            default:
                $('#tipoMoral, #victiFisicas, #mediProtec, #mediProtecMuj').fadeOut('slow');
                $('#tvic_moral, #sexo, #edad, #vulnera, #Pnacimiento, #Enacimiento, #Mnacimiento, #naciona, #Preside, #Ereside, #Mreside, #conyugal, #discapacidad, \n\
                    #alfabetismo, #estudios, #indigena, #familia, #interprete, #hablaesp, #ocupa, #mProtect, #mujProtect').val('-2').prop('required', false);
                $('#fnacimiento').val("1899-09-09").prop('required', false);
                break;
        }
    });

    $('#Pnacimiento').change(function () {
        if ($(this).val() === '1') {
            $('#estaNaci, #munNaci').fadeIn('slow');
            $('#Enacimiento, #Mnacimiento').val('').prop('required', true);
        } else {
            $('#estaNaci, #munNaci').fadeOut('slow');
            $('#Enacimiento, #Mnacimiento').val('-2').prop('required', false);
        }
    });

    $('#Preside').change(function () {
        if ($(this).val() === '1') {
            $('#estaResi, #munResi').fadeIn('slow');
            $('#Ereside, #Mreside').val('').prop('required', true);
        } else {
            $('#estaResi, #munResi').fadeOut('slow');
            $('#Ereside, #Mreside').val('-2').prop('required', false);
        }
    });

    $('#indigena').change(function () {
        if ($(this).val() === '1') {
            $('#famLingui').fadeIn('slow');
            $('#familia').val('').prop('required', true);
        } else {
            $('#famLingui').fadeOut('slow');
            $('#familia').val('-2').prop('required', false);
        }
    });

    $('#con_asesor').change(function () {
        if ($(this).val() === '1') {
            $('#asesorJuri').fadeIn('slow');
            $('#asesor').val('').prop('required', true);
        } else {
            $('#asesorJuri').fadeOut('slow');
            $('#asesor').val('-2').prop('required', false);
        }
    });

    $('#formVictimas').submit(function (e) {
        if ($('#deliCometido:checked').length === 0) {
            e.preventDefault();
            alert('Selecciona al menos una opcion de Delitos cometidos a la Victima');
            $('#deliCometido').focus();
        }

        if ($('#chkRelaProce:checked').length === 0) {
            e.preventDefault();
            alert('Selecciona al menos una opcion de Relacion de la Victima con el Procesado');
            $('#chkRelaProce').focus();
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

    $('#ingresos').change(function (e) {
        if ($(this).val() === '1') {
            $('#rangoInge, #fuenteInge').fadeIn('slow');
            $('#rangoIngresos, #fuenteIngresos').val('').prop('required', true);
        } else {
            $('#rangoInge, #fuenteInge').fadeOut('slow');
            $('#rangoIngresos, #fuenteIngresos').val('-2').prop('required', false);
        }
    });

    /*---------------------------- FIN VICTIMAS ----------------------------*/
    /*---------------------------------PROCESADOS-------------------------------*/
    $('#presentAdo').change(function (e) {
        switch ($(this).val()) {
            case '1':
                $('#dTipoDetencion').fadeIn('slow');
                $('#tipoDetencion').val('').prop('required', true);
                break;
            case '2':
                $('#formCondu').fadeIn('slow');
                $('#formaConduc').val('').prop('required', true);
                break;
            default:
                $('#dTipoDetencion, #formCondu').fadeOut('slow');
                $('#tipoDetencion, #formaConduc').val('-2').prop('required', false);
        }
    });

    $('#grupoDelictivo').change(function (e) {
        if ($(this).val() === '1') {
            $('#gruDeli').fadeIn('slow');
            $('#delictivo').val('').prop('required', true);
            $('#chkdelictivo').prop("checked", false);
        } else {
            $('#gruDeli').fadeOut('slow');
            $('#delictivo').val('-2').prop('required', true);
            $('#chkdelictivo').prop("checked", false);
        }
    });

    $('#chkdelictivo').change(function (e) {
        if ($(this).is(":checked")) {
            $('#delictivo').val("-9");
            $('#delictivo').prop("disabled", true);
        } else {
            $('#delictivo').val("");
            $('#delictivo').prop("disabled", false);
        }
    });
    $('#ingresosPro').change(function (e) {
        if ($(this).val() === '1') {
            $('#rangoIngePro, #fuenteIngePro').fadeIn('slow');
            $('#rangoIngresosPro, #fuenteIngresosPro').val('').prop('required', true);
        } else {
            $('#rangoIngePro, #fuenteIngePro').fadeOut('slow');
            $('#rangoIngresosPro, #fuenteIngresosPro').val('-2').prop('required', false);
        }
    });
    /*--------------------------FIN PROCESADOS------------------------------------*/
    /*--------------------------FUNCIONES PARA INICIAL-------------------------*/
    $('#audiInicial').change(function (e) {
        if ($(this).val() === '1') {
            $('#dCtrlDetencion').fadeIn('slow');
            $('#ctrlDetencion').val('').prop('required', true);
        } else {
            $('#dCtrlDetencion,#dFormuImputa,#dLegalDeten,#dFechaAutoLiber,#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').fadeOut('slow');
            $('#ctrlDetencion,#formuImputa,#legalDeten,#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaAutoLiber,#fechaFormuImpu,#fechDeclara,#fechAutoLib,#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAutoLiber,#chkFechaAutoLib,#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
        }
    });

    $('#ctrlDetencion').change(function (e) {
        if ($(this).val() === '1') {
            $('#dLegalDeten').fadeIn('slow');
            $('#legalDeten').val('').prop('required', true);
            $('#dFechaAutoLiber,#dFormuImputa,#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').hide();
            $('#formuImputa,#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaAutoLiber,#fechaFormuImpu,#fechDeclara,#fechAutoLib,#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAutoLiber,#chkFechaAutoLib,#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
        } else {
            $('#dFormuImputa').fadeIn('slow');
            $('#formuImputa').val('').prop('required', true);
            $('#dLegalDeten,#dFechaAutoLiber,#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').hide();
            $('#legalDeten,#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaAutoLiber,#fechaFormuImpu,#fechDeclara,#fechAutoLib,#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAutoLiber,#chkFechaAutoLib,#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
        }
    });

    $('#legalDeten').change(function (e) {
        if ($(this).val() === '2') {
            $('#dFechaAutoLiber').fadeIn('slow');
            $('#fechaAutoLiber,#formuImputa').val('').prop({'required':true,'readonly':false});
            $('#chkFechaAutoLib').prop("checked", false);
            $('#dFormuImputa,#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').hide();
            $('#formuImputa,#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#chkFechaAutoLiber,#chkFechaAutoLib,#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
            alert("Esta Causa Penal debe ser registrada en Resoluciones o Tramite segun corresponda");
        } else {
            $('#dFormuImputa').fadeIn('slow');
            $('#formuImputa').val('').prop('required', true);
            $('#dFechaAutoLiber,#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').hide();
            $('#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaAutoLiber,#fechaFormuImpu,#fechDeclara,#fechAutoLib,#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAutoLiber,#chkFechaAutoLib,#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
        }
    });

    $('#formuImputa').change(function (e) {
        if ($(this).val() === '1') {
            $('#tblimputacion').fadeIn('slow');
            $('#fechaFormuImpu,#declaro,#fechDeclara,#huboPlazo,#plazo,#autoVin,#fechAutoLib,#fechAuto,#drecretaMC,#soliPlazo,\n\
           #fechSoliPlazo,#soliProrroga,#plazoFijadoC,#fechCierreI,#dictoSobresei,#suspenProceso,\n\
           #causasSuspension,#huboReapertura,#fechaReapertura,#quienSoliApertura,#formulaAcusacion').val('').prop({'required': true,'readonly':false});
            $('#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura').prop("checked", false);
            $('#lbfechDeclara1,#lbPlazo1,#dfechAuto,#dfechAutoLib,#dfechSoliPlazo1,#dsoliProrroga,#dplazoFijadoC,#fSuspencion,#dReapertura,#dAcusacion').fadeOut('slow');
            $('#fechAutoLib').val("1799-09-09").prop('required', false);
            $('#chkFechaFormuImpu,#chkFechDeclara,#chkFechaAuto,#chkFechaAutoLib,#tableMcau input').prop("checked", false);
        } else {
            $('#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').fadeOut('slow');
            $('#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
           #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaAutoLiber,#fechaFormuImpu,#fechDeclara,#fechAutoLib,#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAutoLib,#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
            alert("Esta Causa Penal debe ser registrada en Resoluciones o Tramite segun corresponda");
        }
    });

    $('#autoVin').change(function (e) {
        if ($(this).val() === '1') {
            $('#dfechAuto,#fMedidaCaute,#fPlazo,#dCierre,#consePlazo').fadeIn('slow');
            $('#fechAuto,#drecretaMC,#soliPlazo,#fechSoliPlazo,#soliProrroga,#plazoFijadoC,#fechCierreI,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#fechaReapertura,#quienSoliApertura,#formulaAcusacion').val('').prop({'required': true, 'readonly':false});
            $('#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura').prop({"checked": false, "disabled": false});
            $('#dfechAutoLib,#dfechSoliPlazo1,#dsoliProrroga,#dplazoFijadoC,#fSuspencion,#dReapertura,#dAcusacion').hide();
            $('#fechAutoLib').val("1799-09-09").prop('required', false);
            $('#chkFechaAutoLib,#tableMcau input').prop("checked", false);
        } else {
            $('#dfechAuto,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').hide();
            $('#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura').prop("checked", false);
            $('#dfechAutoLib').fadeIn('slow');
            $('#fechAutoLib').val('').prop({'required': true,'readonly': false});
            $('#chkFechaAutoLib,#tableMcau input').prop("checked", false);
            alert("Esta Causa Penal debe ser registrada en Resoluciones o Tramite segun corresponda");
        }
    });

    $('#drecretaMC').change(function () {
        if ($(this).val() === '1') {
            $('#tableMcau').fadeIn('slow');
            $('#tableMcau input').prop("checked", false);
            
        } else {
            $('#tableMcau').fadeOut('slow');
            $('#especifiqueMC').fadeOut('slow');
        }
    });

    $('#soliPlazo').change(function () {
        if ($(this).val() === '1') {
            $('#dfechSoliPlazo1,#dsoliProrroga,#dplazoFijadoC').fadeIn('slow');
            $('#fechSoliPlazo,#soliProrroga,#plazoFijadoC').val('').prop({'required': true, 'readonly':false});
            $('#chkFechSoliPlazo').prop("checked", false);
        } else {
            $('#dfechSoliPlazo1,#dsoliProrroga,#dplazoFijadoC').fadeOut('slow');
            $('#soliProrroga,#plazoFijadoC').val('-2').prop('required', false);
            $('#fechSoliPlazo').val("1799-09-09").prop('required', false);
            $('#chkFechSoliPlazo').prop("checked", false);
        }
    });

    $('#soliProrroga').change(function () {
        if ($(this).val() === '1') {
            $('#plazoFijadoC').val('');
            $('#plazoFijadoC option[value="5"]').show();
        } else {
            $('#plazoFijadoC').val('');
            $('#plazoFijadoC option[value="5"]').hide();
        }
    });

    $('#suspenProceso').change(function () {
        if ($(this).val() === '1') {
            $('#dcausasSuspension, #dReapertura').fadeIn('slow');
            $('#dfechaReapertura, #dquienSoliApertura, #dAcusacion').hide();
            $('#causasSuspension,#fechaReapertura,#quienSoliApertura,#huboReapertura').val('').prop('required', true);
            $('#formulaAcusacion').val('-2').prop('required', false);
            $('#chkFechaReapertura').prop("checked", false);
        } else {
            $('#dAcusacion').fadeIn('slow');
            $('#formulaAcusacion').val('').prop('required', true);
            $('#dcausasSuspension, #dReapertura').hide();
            $('#causasSuspension,#quienSoliApertura,#huboReapertura').val('-2').prop('required', false);
            $('#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaReapertura').prop("checked", false);
        }
    });

    $('#huboReapertura').change(function () {
        if ($(this).val() === '1') {
            $('#dfechaReapertura,#dquienSoliApertura,#dAcusacion').fadeIn('slow');
            $('#fechaReapertura,#quienSoliApertura,#formulaAcusacion').val('').prop({'required': true, 'readonly': false});
            $('#chkFechaReapertura').prop("checked", false);
        } else {
            $('#dfechaReapertura,#dquienSoliApertura,#dAcusacion').fadeOut('slow');
            $('#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaReapertura').prop("checked", false);
            alert("Fin. La Causa Penal pasa a Tramite");
        }
    });

    $('#dictoSobresei').change(function () {
        if ($(this).val() !== '1') {
            $('#fSuspencion').fadeIn('slow');
            $('#suspenProceso,#causasSuspension,#huboReapertura,#fechaReapertura,#quienSoliApertura,#formulaAcusacion').val('').prop('required', true);
            $('#dcausasSuspension,#dfechaReapertura,#dquienSoliApertura').hide();
            $('#chkFechaReapertura').prop("checked", false);
        } else {
            $('#fSuspencion,#dReapertura,#dAcusacion').fadeOut('slow');
            $('#suspenProceso,#causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaReapertura').prop("checked", false);
            alert("Causa Penal Concluida. Registre la informacion complementaria en el apartado de resoluciones");
        }
    });

    $('#formulaAcusacion').change(function () {
        if ($(this).val() === '1') {
            alert("Continua el procedimiento a Etapa Intermedia");
        }else if ($(this).val() === '2') {
            alert("Continua con la captura a partir de resoluciones");
        }else if ($(this).val() === '9') {
            alert("No se puede continuar con el registro hasta saber si se formulo acusacion o no!");
        }
    });

    /*--------------------------FUNCIONES PARA INTERMEDIA-------------------------*/
    $('#audiInterme').change(function () {
        if ($(this).val() === '1') {
            $('#divfechaAudiinter,#dseparaAcusa,#fmediosPrueba, #dmediosPrueba,#dacuerdosProba,#daperturaJO').fadeIn('slow');
            $('#chkAudiinter').prop("checked", false);
            $('#fechaAudiinter').val("").prop("disabled", false).prop("required", true);
            $('#separaAcusa,#mediosPrueba,#pruebaMP,#pruebaAJ,#pruebaDefensa,#acuerdosProba,#aperturaJO,#tipoPruebaMP,#resolPruebaMP,#tipoPruebaJuri,\n\
#resolJuridico,#tipoPruebaDefen,#resolDefensa').val('').prop("required", true);
        } else {
            $('#divfechaAudiinter,#dseparaAcusa,#fmediosPrueba, #dmediosPrueba,#dacuerdosProba,#daperturaJO').fadeOut('slow');
            $('#chkAudiinter').prop("checked", false);
            $('#fechaAudiinter').val("1899-09-09").prop("disabled", false).prop("required", false);
            $('#separaAcusa,#mediosPrueba,#pruebaMP,#pruebaAJ,#pruebaDefensa,#acuerdosProba,#aperturaJO,#tipoPruebaMP,#resolPruebaMP,#tipoPruebaJuri,\n\
#resolJuridico,#tipoPruebaDefen,#resolDefensa').val('-2').prop("required", true);
        }
    });

    $('#mediosPrueba').change(function () {
        if ($(this).val() === '1') {
            $('#dpruebaMP, #dpruebaAJ, #dpruebaDefensa').fadeIn('slow');
            $('#pruebaMP, #pruebaAJ, #pruebaDefensa').val('').prop('required', true);
        } else {
            $('#dpruebaMP, #dpruebaAJ, #dpruebaDefensa,#dtipoPruebaMP, #dresolPruebaMP, #dtipoPruebaJuri,#dresolJuridico, #dtipoPruebaDefen, #dresolDefensa').fadeOut('slow');
            $('#pruebaMP, #pruebaAJ, #pruebaDefensa, #tipoPruebaMP, #resolPruebaMP,#tipoPruebaJuri,#resolJuridico,#tipoPruebaDefen, #resolDefensa').val('-2').prop('required', false);
        }
    });
    $('#pruebaMP').change(function () {
        if ($(this).val() === '1') {
            $('#dtipoPruebaMP, #dresolPruebaMP').fadeIn('slow');
            $('#tipoPruebaMP, #resolPruebaMP').val('').prop('required', true);
        } else {
            $('#dtipoPruebaMP, #dresolPruebaMP').fadeOut('slow');
            $('#tipoPruebaMP, #resolPruebaMP').val('-2').prop('required', false);
        }
    });
    $('#pruebaAJ').change(function () {
        if ($(this).val() === '1') {
            $('#dtipoPruebaJuri,#dresolJuridico').fadeIn('slow');
            $('#tipoPruebaJuri,#resolJuridico').val('').prop('required', true);
        } else {
            $('#dtipoPruebaJuri,#dresolJuridico').fadeOut('slow');
            $('#tipoPruebaJuri,#resolJuridico').val('-2').prop('required', false);
        }
    });
    $('#pruebaDefensa').change(function () {
        if ($(this).val() === '1') {
            $('#dtipoPruebaDefen, #dresolDefensa').fadeIn('slow');
            $('#tipoPruebaDefen, #resolDefensa').val('').prop('required', true);
        } else {
            $('#dtipoPruebaDefen, #dresolDefensa').fadeOut('slow');
            $('#tipoPruebaDefen, #resolDefensa').val('-2').prop('required', false);
        }
    });
    /*--------------------------FIN INTERMEDIA------------------------------------*/
    /*----------------------- FUNCIONES PARA INSERTS AJAX --------------------------*/

//Guarda Expedientes
    $('#formExpedientes').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        if($('#tAudiencias tbody tr').length === 0){
            alert('Necesita capturar al menos una audiencia');
            return false;
        }
        $.ajax({
            type: 'post',
            url: 'insrtExpediente',
            data: $('#formExpedientes').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor", response);
                alert("Guardado con exito!!!");
                $('#formExpedientes').find('input, textarea, button, select').attr('disabled', true);
                $("#guardarExp").prop("hidden", true);
                if (response === 1) {
                    parent.openPestana('btn2', 'p2');
                }
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
                alert('Error al guardar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    });

//Guarda Delitos
    $('#formDelitos').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtDelitos',
            data: $('#formDelitos').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor", response);
                alert("Guardado con exito!!!");
                var numDeli = parseInt(parent.$('#Tdelitos').val());
                if (response !== null && $.isArray(response)) {
                    for (var i = 1; i < 5; i++) {
                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaDeli tbody').find('tr').eq(response[0]).children('td').eq(i).html(response[i]);
                    }
                    console.log('Captu: ' + response[5] + ' Existen: ' + numDeli);
                    if (response[5] === numDeli) {
                        parent.openPestana('btn3', 'p3');
                    } else {
                        alert('Falta por capturar ' + (numDeli - response[5]) + ' delitos');
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });

//Guarda Procesados
    $('#formProcesados').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtProcesados',
            data: $('#formProcesados').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
                alert("Guardado con exito!!!");
                var numProce = parseInt(parent.$('#Tadolescentes').val());
                if (response !== null && $.isArray(response)) {
                    for (var i = 1; i < 5; i++) {
                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaProcesa tbody').find('tr').eq(response[0]).children('td').eq(i).html(response[i]);
                    }
                    console.log('Captu: ' + response[5] + ' Existen: ' + numProce);
                    if (response[5] === numProce) {
                        parent.openPestana('btn4', 'p4');
                    } else {
                        alert('Falta por capturar ' + (numProce - response[5]) + ' procesados');
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });

//Guarda Victimas
    $('#formVictimas').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtVictimas',
            data: $('#formVictimas').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
                alert("Guardado con exito!!!");
                var numProce = parseInt(parent.$('#Tvictimas').val());
                if (response !== null && $.isArray(response)) {
                    for (var i = 1; i < 5; i++) {
                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaVictimas tbody').find('tr').eq(response[0]).children('td').eq(i).html(response[i]);
                    }
                    console.log('Captu: ' + response[5] + ' Existen: ' + numProce);
                    if (response[5] === numProce) {
                        parent.openPestana('btn5', 'p5');
                    } else {
                        alert('Falta por capturar ' + (numProce - response[5]) + ' victimas');
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });

//Guarda Inicial
    $('#fromInicial').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtInicial',
            data: $('#fromInicial').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
                alert("Guardado con exito!!!");
                var numProce = parseInt(parent.$('#Tadolescentes').val());
                if (response !== null && $.isArray(response)) {
                    for (var i = 1; i < 5; i++) {
                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaInicial tbody').find('tr').eq(response[0]).children('td').eq(i).html(response[i]);
                    }
                    console.log('Captu: ' + response[5] + ' Existen: ' + numProce);
                    if (response[5] === numProce) {
                        parent.openPestana('btn6', 'p6');
                    } else {
                        alert('Falta por capturar ' + (numProce - response[5]) + ' procesados');
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });

//Guarda Intermedia
    $('#formuMedia').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtIntermedia',
            data: $('#formuMedia').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
                alert("Guardado con exito!!!");
                var numProce = parseInt(parent.$('#Tadolescentes').val());
                if (response !== null && $.isArray(response)) {
                    for (var i = 1; i < 5; i++) {
                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaIntermedia tbody').find('tr').eq(response[0]).children('td').eq(i).html(response[i]);
                    }
                    console.log('Captu: ' + response[5] + ' Existen: ' + numProce);
                    if (response[5] === numProce) {
                        parent.openPestana('btn7', 'p7');
                    } else {
                        alert('Falta por capturar ' + (numProce - response[5]) + ' procesados');
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });


//Guarda Conclusiones
    $('#formConclusiones').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtConclusiones',
            data: $('#formConclusiones').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
                alert("Guardado con exito!!!");
                var numProce = parseInt(parent.$('#Tadolescentes').val());
                if (response !== null && $.isArray(response)) {
                    parent.$('#tablaConclu tbody').append('<tr id="' + response[0].replace("/", "") + '"><td>' + response[0] + '</td><td>' + response[1] + '</td><td>' + response[2] + '</td><td>' + response[3] + '</td>\n\
                                                        <td><a class="pop" href="conclusiones.jsp?proce=' + response[0] + '"><img src="img/editar.png" title="Modificar"/></a></td>\n\
                                                        <td><a href="#" onclick="deleteConclusion(\'' + response[0].replace("/", "") + '\',\'' + response[0] + '\')"><img src="img/delete.png" title="Eliminar"/></a></td></tr>');
//                    console.log('Captu: ' + response[4] + ' Existen: '+numProce);
                    parent.$('#lblNumConclu').text("Resoluciones agregadas: " + response[4]);
                    var proPendientes = numProce - response[4] - parent.$('#tablaTramite tbody tr').length;
                    if (proPendientes === 0) {
                        parent.$('.proPendientes').text("Adolescentes completos").css({'color': '#00BD25', 'float': 'right'});
                        parent.$('.agregar').hide();
                    } else {
                        parent.$('.proPendientes').text("Faltan: " + proPendientes + " adolescentes por asignar estatus");
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });

//Guarda Tramite
    $('#formTramite').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtTramite',
            data: $('#formTramite').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
                alert("Guardado con exito!!!");
                var numProce = parseInt(parent.$('#Tadolescentes').val());
                if (response !== null && $.isArray(response)) {
                    parent.$('#tablaTramite tbody').append('<tr id="' + response[0].replace("/", "") + '"><td>' + response[0] + '</td><td>' + response[1] + '</td><td>' + response[2] + '</td><td>' + response[3] + '</td><td>' + response[4] + '</td>\n\
                                                        <td><a class="pop" href="tramite.jsp?proce=' + response[0] + '"><img src="img/editar.png" title="Modificar"/></a></td>\n\
                                                        <td><a href="#" onclick="deleteTramite(\'' + response[0].replace("/", "") + '\',\'' + response[0] + '\')"><img src="img/delete.png" title="Eliminar"/></a></td></tr>');
//                    console.log('Captu: ' + response[5] + ' Existen: '+numProce + ' En Conclu: '+$('#tablaConclu tbody tr').length);
                    parent.$('#lblNumTram').text("Tramites agregados: " + response[5]);
                    var proPendientes = numProce - response[5] - parent.$('#tablaConclu tbody tr').length;
                    if (proPendientes === 0) {
                        parent.$('.proPendientes').text("Adolescentes completos").css({'color': '#00BD25', 'float': 'right'});
                        parent.$('.agregar').hide();
                    } else {
                        parent.$('.proPendientes').text("Faltan: " + proPendientes + " adolescentes por asignar estatus");
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
                alert('Error al guardar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    });
    /*----------------------- FIN FUNCIONES PARA INSERTS AJAX --------------------------*/

    /*----------------------- FUNCIONES PARA EXPEDIENTES --------------------------*/
    $('#Tdelitos, #Tadolescentes, #Tvictimas').focus(function (e) {
        if ($('#expClave').val() === "") {
            e.stopImmediatePropagation();
            alert('Favor de capturar el expediente clave para poder agregar los datos siguientes');
            $('#expClave').focus();
        }
    });
    
    $('#totalAudiencias').on('focusin', function(){
        $('#tiAudi').keypress(function(){
           if($(this).val().length === 2){
               $(this).val($(this).val() + ':');
           }
        });
        
        $('#tiAudi').on('input', function () { 
            this.value = this.value.replace(/[^0-9]/g,':');
            this.value = this.value.slice(0,5);
        });
    });
    
    $('#addAudi').click(function(e){
        e.stopImmediatePropagation();
        var ultimoReg = $('#tAudiencias tbody tr').length;
        var tag = '<tr>\n\
                        <td>' + (ultimoReg + 1) + '</td>\n\
                        <td>\n\
                            <select name="tipoAudi" id="tipoAudi'+ultimoReg+'" class="txtLong" required>\n\
                                <option value="">--Seleccione--</option>\n\
                            </select></td>\n\
                        <td>\n\
                            <select name="juezAudi" id="juezAudi'+ultimoReg+'" class="txtLong" required>\n\
                                <option value="">--Seleccione--</option>\n\
                            </select></td>\n\
                        <td>\n\
                            <input type="date" name="fAudi" id="fAudi'+ultimoReg+'" class="txtMedia" required>\n\
                            <div class="noIdentificada" style="margin:0">\n\
                                <input type="checkbox" id="chkFechaCelebra'+ultimoReg+'" onclick="fechaNoIdent(\'#chkFechaCelebra'+ultimoReg+'\', \'#fAudi'+ultimoReg+'\')">\n\
                                <label>No identificada</label>\n\
                            </div>\n\
                        </td>\n\
                        <td>\n\
                            <input type="text" name="tiAudi" id="tiAudi'+ultimoReg+'" class="txtSmall" placeholder="hh/mm" required>\n\
                            <div class="noIdentificada" style="margin:0">\n\
                                <input type="checkbox" id="chkDuracion'+ultimoReg+'" onclick="DuraNoIdent(\'#chkDuracion'+ultimoReg+'\', \'#tiAudi'+ultimoReg+'\')">\n\
                                <label>No identificada</label>\n\
                            </div>\n\
                        </td>\n\
                    </tr>';
        $('#tAudiencias tbody').append(tag);
        var juzClave = $('#jClave').val();
        $.ajax({
            url : 'obtenCatalogo.jsp',
            dataType: 'html',
            type: 'post',
            data: {cat: 'tipoAudi'},
            succes: function(data){
                console.log('tipo Audiencias: ' + data);
            }
        }).done(function(d){
            $('#tipoAudi'+ultimoReg).html(d);
        });
        $.ajax({
            url : 'obtenCatalogo.jsp',
            dataType: 'html',
            type: 'post',
            data: {
                cat: 'jueces',
                juzClave: juzClave
                },
            succes: function(data){
                console.log('jueces: ' + data);
            }
        }).done(function(d){
            $('#juezAudi'+ultimoReg).html(d);
        });
    });
    /*----------------------- FIN FUNCIONES PARA EXPEDIENTES --------------------------*/

    /*-----------------------FUNCION PARA MEDIDAS CAUTELARES DE ETAPA INICIAL----------*/
    $('#apliMedidaCau13').change(function () {
        if ($('#apliMedidaCau13').is(":checked")) {
            $('#especifiqueMC').fadeIn('slow');
            $('#MCespecificar').val('').prop('required', true);
        } else {
            $('#especifiqueMC').fadeOut('slow');
            $('#MCespecificar').val('-2').prop('required', false);
        }
    });
    /*----------------------FIN DE FUNCION PARA MEDIDAS CAUTELARES DE ETAPA INICIAL----------*/
}
);

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
function competencia() {
    switch ($('#compe').val()) {
        case '1':
            $('#totalElementos, #totalAudiencias').fadeIn("slow");
            $('#Tdelitos, #Tadolescentes, #Tvictimas').val('').prop("required", true);
            $('#tipoIncopetencia').fadeOut("slow");
            $('#Tincompe').val('-2').prop('required', false);
            break;
        case '2':
            $('#tipoIncopetencia').fadeIn("slow");
            $('#Tincompe').val('').prop("required", true);
            $('#totalElementos, #totalAudiencias').fadeOut("slow");
            $('#Tdelitos, #Tadolescentes, #Tvictimas').val('-2').prop("required", false);
            break;
        default:
            $('#totalElementos, #totalAudiencias, #tipoIncopetencia').fadeOut("slow");
            $('#Tdelitos, #Tadolescentes, #Tvictimas, #Tincompe').val('-2').prop("required", false);
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

function tipoProcedimientoAbrev() {
    $('#tblDConclusiones input.radValCambia').val("9");
    switch ($('#tipoResolucionPA').val()) {
        case '1':
            $('#dTipoMedidaPL').fadeIn("slow");
            $('#dTipoMedidaNPL').hide();
            $('#tipoMedidaPL').val('').prop("required", true);
            $('#tipoMedidaNPL').val('-2').prop("required", false);
            $('#tblDConclusiones tr > *:nth-child(2)').fadeIn('slow');
            $('#tblDConclusiones tr > *:nth-child(3),#tblDConclusiones tr > *:nth-child(4)').hide();
            $('#tblDConclusiones tr > *:nth-child(2) input').prop("checked", true);
            
            break;
        case '2':
            $('#dTipoMedidaPL').hide();
            $('#dTipoMedidaNPL').fadeIn("slow");
            $('#tipoMedidaNPL').val('').prop("required", true);
            $('#tipoMedidaPL').val('-2').prop("required", false);
            $('#Dinternamiento').hide();
            $('#internamiento').val('-2').prop("required", false);
            $('#tblDConclusiones tr > *:nth-child(3)').fadeIn('slow');
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(4)').hide();
            $('#tblDConclusiones tr > *:nth-child(3) input').prop("checked", true);
            break;
        case '3':
            $('#dTipoMedidaPL,#dTipoMedidaNPL,#Dinternamiento').fadeOut("slow");
            $('#tipoMedidaPL,#tipoMedidaNPL,#internamiento').val('-2').prop("required", false);
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3)').fadeIn('slow');
            $('#tblDConclusiones tr > *:nth-child(4)').hide();
            $('#tblDConclusiones input').prop({"checked": false, "required":true});
            break;
        default:
            $('#dTipoMedidaPL,#dTipoMedidaNPL,#Dinternamiento').fadeOut("slow");
            $('#tipoMedidaPL,#tipoMedidaNPL,#internamiento').val('-2').prop("required", false);
            $('#tblDConclusiones tr > *:nth-child(4)').fadeIn("slow");
            $('#tblDConclusiones tr > *:nth-child(4) input').prop("checked", true);
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3)').hide();
            
            break;
    }
}

// Fechas No identificadas
function fechaNoIdent(idChk, idTxtDate) {
    if ($(idChk).is(":checked")) {
        $(idTxtDate).val("1899-09-09");
        $(idTxtDate).prop("readonly", true);
    } else {
        $(idTxtDate).val("");
        $(idTxtDate).prop("readonly", false);
    }
}

// Duracion No identificada
function DuraNoIdent(idChk, idTxtDura) {
    if ($(idChk).is(":checked")) {
        $(idTxtDura).val("00:00");
        $(idTxtDura).prop("readonly", true);
    } else {
        $(idTxtDura).val("");
        $(idTxtDura).prop("readonly", false);
    }
}


/*****************************FIN DE FUNCIONES ETAPA INTERMEDIA*****************/

/**************************FUNCION ETAPA INICIAL *******************************/
/***
 * @param {type} idChk
 * @param {type} idTable
 * @returns {undefined}
 */

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
        $(idTxtDate).prop("readonly", true);
        $(idChkEP).prop("disabled", true);
    } else {
        $(idTxtDate).val("");
        $(idTxtDate).prop("readonly", false);
        $(idChkEP).prop("disabled", false);
    }

    if ($(idChkEP).is(":checked")) {
        $(idTxtDate).val("1699-09-09");
        $(idTxtDate).prop("readonly", true);
        $(idChkNi).prop("disabled", true);
        
        alert("Fin. Esta Causa Penal pasa a Tramite");
        $('#consePlazo').fadeOut('slow');
        $('#consePlazo select').val('-2').prop('required', false);
        $('#fechaReapertura').val('1799-09-09').prop('required', false);
        $('#chkFechaReapertura').prop("checked", false);
    } else {
        $('#consePlazo').fadeIn('slow');
        $('#fSuspencion,#dReapertura,#dAcusacion').hide();
        $('#consePlazo select,#fechaReapertura').val('').prop('required', true);
        $('#chkFechaReapertura').prop("checked", false);
        $(idChkNi).prop("disabled", false);
    }
}
;





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
        });
    } else {
        $(idMun).empty().append("<option value='0'>--Seleccione--</option>");
    }
}
/***************************** FIN DE FUNCIONES LLENAR MUNICIPIOS***************/

/*******************FUNCIONES DE CONCLUSIONES***********************************/
function tipoResolucion() {
    $('#tblDConclusiones input').prop("required",false);
    $('#tblDConclusiones input.radValCambia').val("-2").prop("checked",true);
    if ($('#resolucion').val() === '1') {
        $('#flsSobreseimto,#flsImpugnacion').fadeIn("slow");
        $('#flsSobreseimto select,#flsImpugnacion select').val('').prop("required", true);
        $('#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
        $('#chkFechaImpugnacion').prop("checked", false);
        
        $('#dExcluAccion,#dTipoImpugna,#dFechaImpugna,#dQuienImpugna,\n\
            #flsSuspCP,#flsAcuerdoR,#flsProceAbreviado,#flsReparaDanio').hide();
        $('#tipoCondiSCP,#tipoMecanismoAR,#flsProceAbreviado select,#flsReparaDanio select').val('-2').prop("required", false);
        $('#fechaExtSCP,#fechaExtinAR').val('1799-09-09').prop("required", false);
        
    } else if ($('#resolucion').val() === '2'){
        $('#flsSuspCP,#flsReparaDanio,#flsImpugnacion').fadeIn("slow");
        $('#tipoCondiSCP,#flsReparaDanio select,#flsImpugnacion select').val('').prop("required", true);
        $('#fechaExtSCP,#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
        $('#chkFechaExtSCP,#chkFechaImpugnacion').prop("checked", false);
        
        $('#flsSobreseimto,#flsAcuerdoR,#flsProceAbreviado,\n\
            #dTipoRepara,#dMontoRepara,#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').hide();
        $('#flsSobreseimto select,#tipoMecanismoAR,#flsProceAbreviado select').val('-2').prop("required", false);
        $('#fechaExtinAR').val('1799-09-09').prop("required", false);
        
    }else if ($('#resolucion').val() === '3'){
        $('#flsAcuerdoR,#flsReparaDanio,#flsImpugnacion').fadeIn("slow");
        $('#tipoMecanismoAR,#flsReparaDanio select,#flsImpugnacion select').val('').prop("required", true);
        $('#fechaExtinAR,#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
        $('#chkFechaExtinAR,#chkFechaImpugnacion').prop("checked", false);
        
        $('#flsSobreseimto,#flsSuspCP,#flsProceAbreviado,\n\
            #dTipoRepara,#dMontoRepara,#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').hide();
        $('#flsSobreseimto select,#tipoCondiSCP,#flsProceAbreviado select').val('-2').prop("required", false);
        $('#fechaExtSCP').val('1799-09-09').prop("required", false);
    
    }else if ($('#resolucion').val() === '4'){
        $('#flsProceAbreviado,#flsReparaDanio,#flsImpugnacion').fadeIn("slow");
        $('#flsProceAbreviado select,#flsReparaDanio select,#flsImpugnacion select').val('').prop("required", true);
        $('#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
        $('#chkFechaImpugnacion').prop("checked", false);
        $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3),#tblDConclusiones tr > *:nth-child(4)').hide();
        
        $('#flsSobreseimto,#flsSuspCP,#flsAcuerdoR,\n\
        #dTipoMedidaPL,#dTipoMedidaNPL,#Dinternamiento,#dTipoRepara,#dMontoRepara,#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').hide();
        $('#flsSobreseimto select,#tipoCondiSCP,#tipoMecanismoAR').val('-2').prop("required", false);
        $('#fechaExtSCP,#fechaExtinAR').val('1799-09-09').prop("required", false);
    
    }else if ($('#resolucion').val() === '5'){
        $('#flsImpugnacion').fadeIn("slow");
        $('#flsImpugnacion select').val('').prop("required", true);
        $('#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
        $('#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').hide();
        
        $('#flsSobreseimto,#flsSuspCP,#flsAcuerdoR,#flsProceAbreviado,#flsReparaDanio').fadeOut("slow");
        $('#flsSobreseimto select,#tipoCondiSCP,#tipoMecanismoAR,#flsProceAbreviado select,#flsReparaDanio select').val('-2').prop("required", false);
        $('#fechaExtSCP,#fechaExtinAR').val('1799-09-09').prop("required", false);
    
    }else {
        $('#flsSobreseimto,#flsSuspCP,#flsAcuerdoR,#flsProceAbreviado,#flsReparaDanio,#flsImpugnacion').fadeOut("slow");
        $('#flsSobreseimto select,#tipoCondiSCP,#tipoMecanismoAR,#flsProceAbreviado select,#flsReparaDanio select,#flsImpugnacion select').val('-2').prop("required", false);
        $('#fechaExtSCP,#fechaExtinAR,#fechaImpugnacion').val('1799-09-09').prop("required", false);
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
        $('#dTipoRepara').fadeIn("slow");
        $('#tipoReparaD').val('').prop("required", true);
    } else {
        $('#dMontoRepara,#dTipoRepara').fadeOut("slow");
        $('#montoReparaD,#tipoReparaD').val('-2').prop("required", false);
    }
}

function pagoCosa() {
    if ($('#tipoReparaD').val() === '2') {
        $('#dMontoRepara').fadeIn("slow");
        $('#montoReparaD').val('').prop("required", true);
    } else {
        $('#dMontoRepara').fadeOut("slow");
        $('#montoReparaD').val('-2').prop("required", false);
    }
}

function impugna() {
    if ($('#impugnacion').val() === '1') {
        $('#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').fadeIn("slow");
        $('#tipoImpugnacion,#personaImpugna').val('').prop("required", true);
        $('#fechaImpugnacion').val("").prop("disabled", false).prop("required", true);
        $('#chkFechaImpugnacion').prop("checked", false);
    } else {
        $('#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').fadeOut("slow");
        $('#tipoImpugnacion,#personaImpugna').val('-2').prop("required", false);
        $('#fechaImpugnacion').val("1899-09-09").prop("required", false);
    }
}
function causasExclusion() {
    if ($('#proceSobreseimto').val() === '6') {
        $('#dExcluAccion').fadeIn("slow");
        $('#excluAccion').val('').prop("required", true);
    } else {
        $('#dExcluAccion').fadeOut("slow");
        $('#excluAccion').val('-2').prop("required", false);
    }
}
/*******************FIN FUNCIONES DE CONCLUSIONES**********************************/

/******************* FUNCIONES TRAMITE **********************************/
function etapaProcesal(){
   if ($('#eProcesal').val() === '1') {
        $('#dEstInvesti').fadeIn("slow");
        $('#estInvesti').val('').prop("required", true);
        $('#dEstIntermedia,#dEspecifique').hide();
        $('#estIntermedia,#especifique').val('-2').prop("required", false);
    } else if ($('#eProcesal').val() === '2'){
        $('#dEstIntermedia').fadeIn("slow");
        $('#estIntermedia').val('').prop("required", true);
        $('#dEstInvesti,#dEspecifique').hide();
        $('#estInvesti,#especifique').val('-2').prop("required", false);
    }else{
        $('#dEstInvesti,#dEstIntermedia,#dEspecifique').fadeOut("slow");
        $('#estInvesti,#estIntermedia,#especifique').val('-2').prop("required", false);
    }
}
function ocultaEspecifique(){
    if ($('#estInvesti').val() === '6' || $('#estIntermedia').val() === '4') {
        $('#dEspecifique').fadeIn('slow');
        $('#especifique').val('').prop("required", true);
    }else{
        $('#dEspecifique').fadeOut('slow');
        $('#especifique').val('-2').prop("required", false);
    }
}
/*------------------ FIN FUNCIONES TRAMITE ------------------------------/

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

//numeral 10 indica no ejercia ninguna ocupacion
function ocupacionAdo(idSelect, idDiv, idSelOculta) {
    if ($(idSelect).val() === '10') {
        $(idDiv).fadeIn("slow");
        $(idSelOculta).val("").prop("required", true);
    } else {
        $(idDiv).fadeOut("slow");
        $(idSelOculta).val("-2").prop("required", false);
        ;
    }
}
/*---------------------------- FIN FUNCIONES PROCESADOS --------------------------*/

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
        $(idDateOculta).val("").prop({"disabled": false,"required": true, "readonly":false});
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

//Funcion para Causas Penales: comprueba que primero se haya seleccionado un juzgado clave antes de agrecar una causa penal
function validaAddCausa() {
    if ($("#juzgado").val() !== "") {
        window.location.href = "elementosPrincipales.jsp";
    } else {
        $(".msjAviso").fadeIn("slow");
    }
}

//Funcion para Jueces: comprueba que primero se haya seleccionado un juzgado clave antes de agrecar una un juez
function validaAddJuez() {
    if ($("#juzgado").val() !== "") {
        window.location.href = "capturaJuez.jsp";
    } else {
        $(".msjAviso").fadeIn("slow");
    }
}

function numeroDelitos() {
    $('#tablaDeli tbody').empty();
    var expediente = $('#expClave').val();
    var delitos = $('#Tdelitos').val();
    for (var i = 1; i <= delitos; i++) {
        var delitoClave = expediente + '-D' + i;
        $('#tablaDeli tbody').append('<tr><td>' + delitoClave + '</td><td></td><td></td><td></td>\n\
        <td></td><td><a class="pop" href="delitos.jsp?delitoClave=' + delitoClave + '&posicion=' + (i - 1) + '"><img src="img/editar.png" title="Modificar"/>\n\
        </a></td></tr>');
    }
}

function numeroProcesados() {
    $('#tablaProcesa tbody').empty();
    var expediente = $('#expClave').val();
    var procesados = $('#Tadolescentes').val();
    for (var i = 1; i <= procesados; i++) {
        var proceClave = expediente + '-P' + i;
        $('#tablaProcesa tbody').append('<tr><td>' + proceClave + '</td><td></td><td></td><td></td>\n\
        <td></td><td><a class="pop" href="procesados.jsp?proceClave=' + proceClave + '&posicion=' + (i - 1) + '"><img src="img/editar.png" title="Modificar"/>\n\
        </a></td></tr>');
    }
    $('#tablaInicial tbody').empty();
    for (var i = 1; i <= procesados; i++) {
        var proceClave = expediente + '-P' + i;
        $('#tablaInicial tbody').append('<tr><td>' + proceClave + '</td><td></td><td></td><td></td><td></td>\n\
        <td></td><td><a class="pop" href="etapaInicial.jsp?proceClave=' + proceClave + '&posicion=' + (i - 1) + '"><img src="img/editar.png" title="Modificar"/>\n\
        </a></td></tr>');
    }
    $('#tablaIntermedia tbody').empty();
    for (var i = 1; i <= procesados; i++) {
        var proceClave = expediente + '-P' + i;
        $('#tablaIntermedia tbody').append('<tr><td>' + proceClave + '</td><td></td><td></td><td></td>\n\
        <td></td><td><a class="pop" href="etapaIntermedia.jsp?proceClave=' + proceClave + '&posicion=' + (i - 1) + '"><img src="img/editar.png" title="Modificar"/>\n\
        </a></td></tr>');
    }
    //pone contador de los porcesados que deben concluir o estar pendientes en su pestaña correspondiente
    $('#lblNumConclu').text("Resoluciones agregadas: " + $('#tablaConclu tbody tr').length);
    $('#lblNumTram').text("Tramites agregados: " + $('#tablaTramite tbody tr').length);
    $('.proPendientes').text("Faltan: " + $('#Tadolescentes').val() + " adolescentes por asignar estatus");
//    $('#btn7,#btn8').css('background-color','rgba(255, 0, 0, 0.6)');
}

function numeroVictimas() {
    $('#tablaVictimas tbody').empty();
    var expediente = $('#expClave').val();
    var victimas = $('#Tvictimas').val();
    for (var i = 1; i <= victimas; i++) {
        var victiClave = expediente + '-V' + i;
        $('#tablaVictimas').append('<tr><td>' + victiClave + '</td><td></td><td></td><td></td>\n\
        <td></td><td><a class="pop" href="victimas.jsp?victiClave=' + victiClave + '&posicion=' + (i - 1) + '"><img src="img/editar.png" title="Modificar"/>\n\
        </a></td></tr>');
    }
}

/************************ FUNCIONES PARA DELETE AJAX ******************************/
function deleteConclusion(fila, idProce) {
    var resp = confirm("Realmente deseas eliminar este resgistro?");
    if (resp) {
        $.ajax({
            type: 'post',
            url: 'deleteDatos',
            data: {proceConclusion: idProce},
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
                if (response === "conclusionDeleted") {
                    alert("Resolucion: " + idProce + " Registro eliminado!!!");
                    $('#tablaConclu tbody #' + fila).remove();//elimina fila de tabla por su id
                    var numProce = parseInt($('#Tadolescentes').val());
                    $('#lblNumConclu').text("Conclusiones agregadas: " + $('#tablaConclu tbody tr').length);//tramites agregados
                    var proPendientes = numProce - $('#tablaConclu tbody tr').length - $('#tablaTramite tbody tr').length;//procesados pendientes
                    $('.agregar').fadeIn("slow");//muestra boton agregar
                    $('.proPendientes').text("Faltan: " + proPendientes + " adolescentes por asignar estatus").css({'color': '#D60320', 'float': 'none'});
                }
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
                alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    }
}
function deleteTramite(fila, idProce) {
    var resp = confirm("Realmente deseas eliminar este registro?");
    if (resp) {
        $.ajax({
            type: 'post',
            url: 'deleteDatos',
            data: {proceTramite: idProce},
            success: function (response) {
                console.log("Respuesta del servidor: ", response);
                if (response === "tramiteDeleted") {
                    alert("Tramite: " + idProce + " Registro eliminado!!!");
                    $('#tablaTramite tbody #' + fila).remove();//elimina fila de tabla por su id
                    var numProce = parseInt($('#Tadolescentes').val());
                    $('#lblNumTram').text("Tramites agregados: " + $('#tablaTramite tbody tr').length);//tramites agregados
                    var proPendientes = numProce - $('#tablaConclu tbody tr').length - $('#tablaTramite tbody tr').length;//procesados pendientes
                    $('.agregar').fadeIn("slow");//muestra boton agregar
                    $('.proPendientes').text("Faltan: " + proPendientes + " adolescentes por asignar estatus").css({'color': '#D60320', 'float': 'none'});
                }
            },
            error: function (response) {
                console.log("Respuesta del servidor", response);
                alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    }
}
/*----------------------- FIN FUNCIONES PARA DELETE AJAX --------------------------*/

