/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    if($('#opera').val() !== ''){
        $('#proceClave').css('background-color', 'rgba(80,255,120,.6)');
    }
    
    //Se usa para la recuperacion de BD
    if($('#audiInicial').val() === '1'){
        $('#dCtrlDetencion').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#ctrlDetencion').val() === '1'){
        $('#dLegalDeten').show();
    }else if($('#ctrlDetencion').val() === '2'){
        $('#dFormuImputa').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#legalDeten').val() === '1'){
        $('#dFormuImputa').show();
    }else if($('#legalDeten').val() === '2'){
        $('#dFechaAutoLiber').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#formuImputa').val() === '1'){
        $('#tblimputacion').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaAutoLiber').val() === '1899-09-09'){
        $('#fechaAutoLiber').prop("readonly", true);
        $('#chkFechaAutoLiber').prop("checked", true);
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaFormuImpu').val() === '1899-09-09'){
        $('#fechaFormuImpu').prop("readonly", true);
        $('#chkFechaFormuImpu').prop("checked", true);
    }
    
    //Se usa para la recuperacion de BD
    if($('#declaro').val() === '1'){
        $('#lbfechDeclara1').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechDeclara').val() === '1899-09-09'){
        $('#fechDeclara').prop("readonly", true);
        $('#chkFechDeclara').prop("checked", true);
    }
    
    //Se usa para la recuperacion de BD
    if($('#huboPlazo').val() === '1'){
        $('#lbPlazo1').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#autoVin').val() === '1'){
        $('#dfechAuto,#fMedidaCaute,#fPlazo,#dCierre,#consePlazo').show();
    }else if($('#autoVin').val() === '2'){
        $('#dfechAuto').fadeIn('slow');
        $('#lblFechaAuto').text("Fecha en que se dicto el auto de libertad por no vinculacion a proceso");
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechAuto').val() === '1899-09-09'){
        $('#fechAuto').prop("readonly", true);
        $('#chkFechaAuto').prop("checked", true);
    }
    
    //Se usa para la recuperacion de BD
    if($('#drecretaMC').val() === '1'){
        $('#tableMcau').show();
        $('input[name="chkDecretaMC"]').each(function(){
            var indi = $(this).val();
            if($(this).is(':checked')){
                $('#soliMedida' + indi).prop({'disabled': false, 'required' : true});
                $('#duraMedida' + indi).prop({'disabled': false, 'required' : true});
            }
        });
    }
    
    //Se usa para la recuperacion de BD
    if($('#soliPlazo').val() === '1'){
        $('#dfechSoliPlazo1').show();
        $('#dsoliProrroga').show();
        $('#dplazoFijadoC').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechSoliPlazo').val() === '1899-09-09'){
        $('#fechSoliPlazo').prop("readonly", true);
        $('#chkFechSoliPlazo').prop("checked", true);
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechCierreI').val() === '1899-09-09'){
        $('#fechCierreI').prop("readonly", true);
        $('#chkFechCierreI').prop("checked", true);
        $('#chkEnProceso').prop("disabled", true);
    }else if($('#fechCierreI').val() === '1699-09-09'){
        $('#fechCierreI').prop("readonly", true);
        $('#chkFechCierreI').prop("checked", true);
        $('#chkFechCierreI').prop("disabled", true);
    }
    
    //Se usa para la recuperacion de BD
    if($('#dictoSobresei').val() === '2'){
        $('#fSuspencion').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#suspenProceso').val() === '1'){
        $('#dcausasSuspension').show();
        $('#dReapertura').show();
    }else if($('#suspenProceso').val() === '2'){
        $('#dAcusacion').show();
    }
    
    //Se usa para la recuperacion de BD
    if($('#huboReapertura').val() === '1'){
        $('#dfechaReapertura').show();
        $('#dquienSoliApertura').show();
        $('#dAcusacion').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaReapertura').val() === '1899-09-09'){
        $('#fechaReapertura').prop("readonly", true);
        $('#chkFechaReapertura').prop("checked", true);
    }
    
    $('#audiInicial').change(function () {
        if ($(this).val() === '1') {
            $('#dCtrlDetencion').fadeIn('slow');
            $('#ctrlDetencion').val('').prop('required', true);
        } else {
            $('#dCtrlDetencion,#dFormuImputa,#dLegalDeten,#dFechaAutoLiber,#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').fadeOut('slow');
            $('#ctrlDetencion,#formuImputa,#legalDeten,#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaAutoLiber,#fechaFormuImpu,#fechDeclara,#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAutoLiber,#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
        }
    });

    $('#ctrlDetencion').change(function () {
        if ($(this).val() === '1') {
            $('#dLegalDeten').fadeIn('slow');
            $('#legalDeten').val('').prop('required', true);
            $('#dFechaAutoLiber,#dFormuImputa,#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').hide();
            $('#formuImputa,#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaAutoLiber,#fechaFormuImpu,#fechDeclara,#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAutoLiber,#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
        } else {
            $('#dFormuImputa').fadeIn('slow');
            $('#formuImputa').val('').prop('required', true);
            $('#dLegalDeten,#dFechaAutoLiber,#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').hide();
            $('#legalDeten,#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaAutoLiber,#fechaFormuImpu,#fechDeclara,#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAutoLiber,#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
        }
    });

    $('#legalDeten').change(function () {
        if ($(this).val() === '1') {
            $('#dFormuImputa').fadeIn('slow');
            $('#formuImputa').val('').prop('required', true);
            $('#dFechaAutoLiber,#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').hide();
            $('#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaAutoLiber,#fechaFormuImpu,#fechDeclara,#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAutoLiber,#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
        } else {
            $('#dFechaAutoLiber').fadeIn('slow');
            $('#fechaAutoLiber,#formuImputa').val('').prop({'required': true, 'readonly': false});
            $('#dFormuImputa,#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').hide();
            $('#formuImputa,#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#chkFechaAutoLiber,#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
            alert("Esta Causa Penal debe ser registrada en Resoluciones o Tramite segun corresponda");
        }
    });

    $('#formuImputa').change(function () {
        if ($(this).val() === '1') {
            $('#tblimputacion').fadeIn('slow');
            $('#fechaFormuImpu,#declaro,#fechDeclara,#huboPlazo,#plazo,#autoVin,#fechAuto,#drecretaMC,#soliPlazo,\n\
                #fechSoliPlazo,#soliProrroga,#plazoFijadoC,#fechCierreI,#dictoSobresei,#suspenProceso,\n\
                #causasSuspension,#huboReapertura,#fechaReapertura,#quienSoliApertura,#formulaAcusacion').val('').prop({'required': true, 'readonly': false});
            $('#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura').prop("checked", false);
            $('#lbfechDeclara1,#lbPlazo1,#dfechAuto,#dfechSoliPlazo1,#dsoliProrroga,#dplazoFijadoC,#fSuspencion,#dReapertura,#dAcusacion').fadeOut('slow');
            $('#chkFechaFormuImpu,#chkFechDeclara,#chkFechaAuto,#tableMcau input').prop("checked", false);
        } else {
            $('#tblimputacion,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').fadeOut('slow');
            $('#declaro,#huboPlazo,#plazo,#autoVin,#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaAutoLiber,#fechaFormuImpu,#fechDeclara,#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura,#tableMcau input').prop("checked", false);
            alert("Esta Causa Penal debe ser registrada en Resoluciones o Tramite segun corresponda");
        }
    });

    $('#autoVin').change(function () {
        if ($(this).val() === '1') {
            $('#dfechAuto,#fMedidaCaute,#fPlazo,#dCierre,#consePlazo').fadeIn('slow');
            $('#fechAuto,#drecretaMC,#soliPlazo,#fechSoliPlazo,#soliProrroga,#plazoFijadoC,#fechCierreI,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#fechaReapertura,#quienSoliApertura,#formulaAcusacion').val('').prop({'required': true, 'readonly': false});
            $('#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura').prop({"checked": false, "disabled": false});
            $('#dfechSoliPlazo1,#dsoliProrroga,#dplazoFijadoC,#fSuspencion,#dReapertura,#dAcusacion').hide();
            $('#lblFechaAuto').text("Fecha en que se dicto el auto de vinculacion a proceso");
            $('#tableMcau input').prop("checked", false);
        } else if ($(this).val() === '2') {
            $('#dfechAuto').fadeIn('slow');
            $('#fechAuto').val('').prop({'required': true, 'readonly': false});
            ;
            $('#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').hide();
            $('#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura').prop("checked", false);
            $('#lblFechaAuto').text("Fecha en que se dicto el auto de libertad por no vinculacion a proceso");
            $('#tableMcau input').prop("checked", false);
            alert("Esta Causa Penal debe ser registrada en Resoluciones o Tramite segun corresponda");
        } else {
            $('#dfechAuto,#fMedidaCaute,#tableMcau,#fPlazo,#dCierre,#consePlazo').hide();
            $('#drecretaMC,#MCespecificar,#soliPlazo,#soliProrroga,#plazoFijadoC,#dictoSobresei,#suspenProceso,\n\
                   #causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechAuto,#fechSoliPlazo,#fechCierreI,#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaAuto,#chkFechSoliPlazo,#chkFechCierreI,#chkEnProceso,#chkFechaReapertura').prop("checked", false);
            $('#lblFechaAuto').text("Fecha en que se dictÃ³ el auto de libertad por no vinculaciÃ³n a proceso");
            $('#tableMcau input').prop("checked", false);
            alert("Esta Causa Penal debe ser registrada en Resoluciones o Tramite segun corresponda");
        }
    });
    
    $('#drecretaMC').change(function () {
        if ($(this).val() === '1') {
            $('#tableMcau').fadeIn('slow');
        } else {
            $('#tableMcau').fadeOut('slow');
            $('input[name="chkDecretoMC"]').prop('checked',false);
            $('.duraMedi').val('').prop({disabled: true, required: false});
        }
    });
    
    //Para cada td que tenga esta clase validamos el tamaño de texto y le agregamos imagen de info
    $('.descMedi').each(function(){
        var text = $(this).text();//Obtenemos el texto del td para validarlo
        var coord = $(this).data('coord');//Obtenemos el data coord del td para asignarcelos al id de la imagen
        if(text.length > 55){
            //Si es mayor a 55 el texto del catalogo, entonces lo cortamos y mostramos la imagen de info para mostrar el texto completo
            //en un div 
            $(this).html(text.substring(0,'50') + ' ... <img src="img/info.png" class="infoMC" id="' + coord + '"/>');
        }
    });
    
    //Mostramos los divs de los catalogos de Medidas Cautelares
    $('.infoMC').hover(function(){
        var id = $(this).attr('id');//obtenemos el id de la imagen donde se encuentra el mouse
        $('#divMC' + id).fadeIn();
    }, function(){
        var id = $(this).attr('id');//obtenemos el id de la imagen donde se encuentra el mouse
        $('#divMC' + id).fadeOut();
    });
    
    $('input[name="chkDecretaMC"]').change(function(){
        var indi = $(this).val();
        if($(this).is(':checked')){
            $('#soliMedida' + indi).prop({'disabled': false, 'required': true});
            $('#duraMedida' + indi).prop({'disabled': false, 'required': true});
        }else{
            $('#soliMedida' + indi).val('');
            $('#duraMedida' + indi).val('');
            $('#soliMedida' + indi).prop({'disabled': true, 'required': false});
            $('#duraMedida' + indi).prop({'disabled': true, 'required': false});
        }
        
        //validamos el indice de Otra para mostrar el campo especifique
        if(indi === '13'){
            if($(this).is(':checked')){
                $('#especiMC').fadeIn();
                $('#especiMC').val('').prop('required', true);
            }else{
                $('#especiMC').fadeOut();
                $('#especiMC').val('').prop('required', false);
            }
        }
    });

    $('#soliPlazo').change(function () {
        if ($(this).val() === '1') {
            $('#dfechSoliPlazo1,#dsoliProrroga,#dplazoFijadoC').fadeIn('slow');
            $('#fechSoliPlazo,#soliProrroga,#plazoFijadoC').val('').prop({'required': true, 'readonly': false});
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
        if ($(this).val() === '2' || $(this).val() === '9') {
            $('#fSuspencion').fadeIn('slow');
            $('#suspenProceso').val('').prop('required', true);
        } else {
            $('#fSuspencion,#dReapertura,#dAcusacion').fadeOut('slow');
            $('#suspenProceso,#causasSuspension,#huboReapertura,#quienSoliApertura,#formulaAcusacion').val('-2').prop('required', false);
            $('#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaReapertura').prop("checked", false);
            alert("Causa Penal Concluida. Registre la informacion complementaria en el apartado de resoluciones");
        }
    });
    
    $('#suspenProceso').change(function () {
        if ($(this).val() === '1') {
            $('#dcausasSuspension, #dReapertura').fadeIn('slow');
            $('#dfechaReapertura, #dquienSoliApertura, #dAcusacion').fadeOut('slow');
            $('#causasSuspension,#fechaReapertura,#quienSoliApertura,#huboReapertura').val('').prop('required', true);
            $('#formulaAcusacion').val('-2').prop('required', false);
            $('#chkFechaReapertura').prop("checked", false);
        } else {
            $('#dAcusacion').fadeIn('slow');
            $('#formulaAcusacion').val('').prop('required', true);
            $('#dcausasSuspension, #dReapertura').fadeOut('slow');
            $('#causasSuspension,#quienSoliApertura,#huboReapertura').val('-2').prop('required', false);
            $('#fechaReapertura').val("1799-09-09").prop('required', false);
            $('#chkFechaReapertura').prop("checked", false);
        }
    });

    $('#formulaAcusacion').change(function () {
        if ($(this).val() === '1') {
            alert("Continua el procedimiento a Etapa Intermedia");
        }else{
            alert("Continua con la captura a partir de resoluciones");
        }
    });
    
    $("#formulaAcusacion > option[value=9]").hide();
    
    //Guarda Inicial
    $('#fromInicial').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation
        
        if($('#drecretaMC').val() === '1' && $('input[name="chkDecretaMC"]:checked').length === 0){
            alert('Selecciona al menos una Medida Cautelar');
            $('#drecretaMC').focus();
            return false;
        }
        
        if($('#opera').val() !== ''){
            var actual = confirm("Al actualizar datos en Etapa Inicial, se perderan los datos que se tengan guardados \n\
                        en posteriores etapas.\n seguro que desea continuar?");    
        }
        if(actual){
            $.ajax({
                type: 'post',
                url: 'insrtInicial',
                data: $('#fromInicial').serialize(),
                success: function (response) {
                    console.log("Respuesta del servidor Inicial: ", response);
                    alert("Guardado correctamente!!!");
                    var numProce = parseInt(parent.$('#Tadolescentes').val());
                    if (response !== null && $.isArray(response)) {
                        for (var i = 2; i <= 6; i++) {//pone filas correspondientes en la tabla de inicial
                            parent.$('#tablaInicial tbody').find('tr').eq(response[0]).children('td').eq(i-1).html(response[i]);
                        }
                        //editamos enlance para que pueda ser actualizado ya estando lleno
                        var enlace = parent.$('#tablaInicial tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                        parent.$('#tablaInicial tbody tr').eq(response[0]).find('a').attr('href',enlace);
                        //Control de banderas para saber a que etapa se manda el procesado
                        //Funcion para determinar si esta en otra tabla
                        buscaYremplaza(response[1], response[7]);//mandamos el nombre de procesado y la bandera nueva
                        console.log('Bandera: ' + response[7]);
                        if(response[7] === 1){//Condicion para mandar al procesado a etapa intermedia
                            parent.$('#tablaIntermedia tbody').append('<tr><td>' + response[1] + '</td><td>' + response[2] + '</td><td></td><td></td>\n\
                            <td></td><td><a class="pop" href="etapaIntermedia.jsp?proceClave=' + response[1] + '&posicion=' + parent.$('#tablaIntermedia tbody tr').length + '">\n\
                            <img src="img/editar.png" title="Modificar"/></a></td></tr>');
                            parent.$('#btn6').addClass(' activar');
                        }else if(response[7] === 2){//Condicion para mandar al procesado a etapa conclusiones
                            parent.$('#tablaConclu tbody').append('<tr><td>' + response[1] + '</td><td>' + response[2] + '</td><td></td><td></td>\n\
                            <td><a class="pop" href="conclusiones.jsp?proceClave=' + response[1] + '&posicion=' + parent.$('#tablaConclu tbody tr').length + '">\n\
                            <img src="img/editar.png" title="Modificar"/></a></td></tr>');
                            parent.$('#btn7').addClass(' activar');
                        }else if(response[7] === 3){//Condicion para mandar al procesado a etapa tramite
                            parent.$('#tablaTramite tbody').append('<tr><td>' + response[1] + '</td><td>' + response[2] + '</td><td></td><td></td>\n\
                            <td><a class="pop" href="tramite.jsp?proceClave=' + response[1] + '&posicion=' + parent.$('#tablaTramite tbody tr').length + '">\n\
                            <img src="img/editar.png" title="Modificar"/></a></td></tr>');
                            parent.$('#btn8').addClass(' activar');
                        }else if(response[7] === 5){//Condicion para mandar al procesado a etapa volando
                            parent.$('#tablaVolando tbody').append('<tr><td>' + response[1] + '</td><td>' + response[2] + '</td>\n\
                            <td><a class="pop" href=""><img src="img/editar.png" title="Modificar"/></a></td></tr>');
                            //Solo agregaremos en el texto los procesados que se necesitan capturar
                            parent.$('.indicador2').css('color', '#D60320');//Cambiamos el color a rojo para que se note
                            parent.$('.agregar').show();//Mosramos el boton de agregar
                            var totProceVola = parseInt(parent.$('#indicaVolando').text()) + 1;//Obtenemos el valor de procesados volando
                            parent.$('.indicador2 span').text(totProceVola);//Lo mostramos con la cantidad actualizada
                            //alert('procesado volando con: ' + totProceVola);
                            parent.$('#btn7').addClass(' activar');
                            parent.$('#btn8').addClass(' activar');
                        }
                        console.log('Captu: ' + response[8] + ' Existen: ' + numProce );
                        if (response[8] === numProce) {
                            for(var x = 6; x <= 8; x++){
                                //Validamos que pestañas activamos
                                if(parent.$('#btn' + x).hasClass('activar')){
                                    parent.openPestana('btn' + x, 'p' + x);
                                    parent.$('#btn' + x).removeClass('activar');
                                }
                            }
                        } else {
                            alert('Falta por capturar ' + (numProce - response[8]) + ' procesados');
                        }
                    }
                    parent.$.fancybox.close();
                },
                error: function (response) {
                    console.log("Respuesta del servidor Inicial: ", response);
                    alert('Error al guardar, cunsulte al administrador!');
                }
            });
        }
    });
    /*---------------------------- FIN FUNCIONES INICIAL JC----------------------------*/
});
