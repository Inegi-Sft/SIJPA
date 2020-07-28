/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    /*---------------------------- FUNCIONES CONCLUSIONES JC----------------------------*/
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaReso').val() === '1899-09-09'){
        $('#fechaReso').prop("readonly", true);
        $('#chkFechaReso').prop("checked", true);
    }
    
    //Se usa para la recuperacion de BD
    switch ($('#resolucion').val()){
        case '1':
            $('#flsSobreseimto').show();
            $('#tipoCondiSCP,#tipoMecanismoAR,#flsProceAbreviado select').val('-2');
            $('#fechaExtSCP,#fechaExtinAR').val('1799-09-09');
            break;
        case '2':
            $('#flsSuspCP').show();
            $('#flsSobreseimto select,#tipoMecanismoAR,#flsProceAbreviado select').val('-2');
            $('#fechaExtinAR').val('1799-09-09');
            break;
        case '3':
            $('#flsAcuerdoR').show();
            $('#flsSobreseimto select,#tipoCondiSCP,#flsProceAbreviado select').val('-2');
            $('#fechaExtSCP').val('1799-09-09');
            break;
        case '4':
            $('#flsProceAbreviado').show();
            $('#flsSobreseimto select,#tipoCondiSCP,#tipoMecanismoAR').val('-2');
            $('#fechaExtSCP,#fechaExtinAR').val('1799-09-09');
            break;
        case '5':
            $('#flsImpugnacion').show();
            $('#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').hide();

            $('#flsSobreseimto,#flsSuspCP,#flsAcuerdoR,#flsProceAbreviado,#flsReparaDanio').hide();
            $('#flsSobreseimto select,#tipoCondiSCP,#tipoMecanismoAR,#flsProceAbreviado select,#flsReparaDanio select').val('-2').prop("required", false);
            $('#fechaExtSCP,#fechaExtinAR').val('1799-09-09').prop("required", false);
            break;
        default :
            $('#flsReparaDanio,#flsImpugnacion').hide();
            $('#flsReparaDanio select,#flsImpugnacion select').val('-2').prop("required", false);
            $('#fechaImpugnacion').val('1799-09-09');
            break;
    }
    
    //Se usa para la recuperacion de BD
    if ($('#proceSobreseimto').val() === '6') {
        $('#dExcluAccion').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaExtSCP').val() === '1899-09-09'){
        $('#fechaExtSCP').prop("readonly", true);
        $('#chkFechaExtSCP').prop("checked", true);
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaExtinAR').val() === '1899-09-09'){
        $('#fechaExtinAR').prop("readonly", true);
        $('#chkFechaExtinAR').prop("checked", true);
    }
    
    //Se usa para la recuperacion de BD
    switch ($('#tipoResolucionPA').val()) {
        case '1':
            $('#dTipoMedidaPL').fadeIn("slow");
            $('#tblDConclusiones tr > *:nth-child(2)').fadeIn('slow');
            $('#tblDConclusiones tr > *:nth-child(3),#tblDConclusiones tr > *:nth-child(4)').hide();
            break;
        case '2':
            $('#dTipoMedidaNPL').fadeIn("slow");
            $('#tblDConclusiones tr > *:nth-child(3)').fadeIn('slow');
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(4)').hide();
            break;
        case '3':
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3)').show();
            $('#tblDConclusiones tr > *:nth-child(4)').hide();
            break;
        case '9':
            $('#tblDConclusiones tr > *:nth-child(4)').show();
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3)').hide();
            break;
        default:
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3),\n\
                #tblDConclusiones tr > *:nth-child(4)').hide();
            break;
    }
  
    //Se usa para la recuperacion de BD
    if (($('#tipoMedidaPL').val() === '2') || ($('#tipoMedidaPL').val() === '3')) {
        $('#Dinternamiento').show();
    }
    
    //Se usa para la recuperacion de BD
    if ($('#reparaDanio').val() === '1') {
        $('#dTipoRepara').show();
    }
    
    //Se usa para la recuperacion de BD
    if ($('#tipoReparaD').val() === '2') {
        $('#dMontoRepara').show();
    }
    
    //Se usa para la recuperacion de BD
    if ($('#impugnacion').val() === '1') {
        $('#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#fechaImpugnacion').val() === '1899-09-09'){
        $('#fechaImpugnacion').prop("readonly", true);
        $('#chkFechaImpugnacion').prop("checked", true);
    }
    
    $('#resolucion').change(function(){
        $('#tblDConclusiones input').prop("required", false);
        $('#tblDConclusiones input.radValCambia').val("-2").prop("checked", true);
        if ($('#resolucion').val() === '1') {
            $('#flsSobreseimto,#flsImpugnacion,#flsReparaDanio').fadeIn("slow");
            $('#flsSobreseimto select,#flsImpugnacion select,#flsReparaDanio select').val('').prop("required", true);
            $('#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
            $('#chkFechaImpugnacion').prop("checked", false);

            $('#dExcluAccion,#dTipoImpugna,#dFechaImpugna,#dQuienImpugna,\n\
                #flsSuspCP,#flsAcuerdoR,#flsProceAbreviado').hide();
            $('#tipoCondiSCP,#tipoMecanismoAR,#flsProceAbreviado select').val('-2').prop("required", false);
            $('#fechaExtSCP,#fechaExtinAR').val('1899-09-09').prop("required", false);

        } else if ($('#resolucion').val() === '2') {
            $('#flsSuspCP,#flsReparaDanio,#flsImpugnacion').fadeIn("slow");
            $('#tipoCondiSCP,#flsReparaDanio select,#flsImpugnacion select').val('').prop("required", true);
            $('#fechaExtSCP,#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
            $('#chkFechaExtSCP,#chkFechaImpugnacion').prop("checked", false);

            $('#flsSobreseimto,#flsAcuerdoR,#flsProceAbreviado,\n\
                #dTipoRepara,#dMontoRepara,#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').hide();
            $('#flsSobreseimto select,#tipoMecanismoAR,#flsProceAbreviado select').val('-2').prop("required", false);
            $('#fechaExtinAR').val('1799-09-09').prop("required", false);

        } else if ($('#resolucion').val() === '3') {
            $('#flsAcuerdoR,#flsReparaDanio,#flsImpugnacion').fadeIn("slow");
            $('#tipoMecanismoAR,#flsReparaDanio select,#flsImpugnacion select').val('').prop("required", true);
            $('#fechaExtinAR,#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
            $('#chkFechaExtinAR,#chkFechaImpugnacion').prop("checked", false);

            $('#flsSobreseimto,#flsSuspCP,#flsProceAbreviado,\n\
                #dTipoRepara,#dMontoRepara,#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').hide();
            $('#flsSobreseimto select,#tipoCondiSCP,#flsProceAbreviado select').val('-2').prop("required", false);
            $('#fechaExtSCP').val('1799-09-09').prop("required", false);

        } else if ($('#resolucion').val() === '4') {
            $('#flsProceAbreviado,#flsReparaDanio,#flsImpugnacion').fadeIn("slow");
            $('#flsProceAbreviado select,#flsReparaDanio select,#flsImpugnacion select').val('').prop("required", true);
            $('#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
            $('#chkFechaImpugnacion').prop("checked", false);
            $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3),#tblDConclusiones tr > *:nth-child(4)').hide();

            $('#flsSobreseimto,#flsSuspCP,#flsAcuerdoR,\n\
            #dTipoMedidaPL,#dTipoMedidaNPL,#Dinternamiento,#dTipoRepara,#dMontoRepara,#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').hide();
            $('#flsSobreseimto select,#tipoCondiSCP,#tipoMecanismoAR').val('-2').prop("required", false);
            $('#fechaExtSCP,#fechaExtinAR').val('1799-09-09').prop("required", false);
            
        } else if ($('#resolucion').val() === '5') {
            $('#flsImpugnacion').fadeIn("slow");
            $('#flsImpugnacion select').val('').prop("required", true);
            $('#fechaImpugnacion').val('').prop({"required": true, "readonly": false});
            $('#dTipoImpugna,#dFechaImpugna,#dQuienImpugna').hide();
            $('#flsSobreseimto,#flsSuspCP,#flsAcuerdoR,#flsProceAbreviado,#flsReparaDanio').hide();
            $('#flsSobreseimto select,#tipoCondiSCP,#tipoMecanismoAR,#flsProceAbreviado select,#flsReparaDanio select').val('-2').prop("required", false);
            $('#fechaExtSCP,#fechaExtinAR').val('1799-09-09').prop("required", false);

        } else {
            $('#flsSobreseimto,#flsSuspCP,#flsAcuerdoR,#flsProceAbreviado,#flsReparaDanio,#flsImpugnacion').fadeOut("slow");
            $('#flsSobreseimto select,#tipoCondiSCP,#tipoMecanismoAR,#flsProceAbreviado select,#flsReparaDanio select,#flsImpugnacion select').val('-2').prop("required", false);
            $('#fechaExtSCP,#fechaExtinAR,#fechaImpugnacion').val('1799-09-09').prop("required", false);
        }
    });
    
    $('#tipoResolucionPA').change(function(){
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
                if($('#tblDConclusiones tbody tr').length >2){ //se pone <=2 por el encabezado que tambien se cuenta, sino seria 1
                    $('#dTipoMedidaPL,#dTipoMedidaNPL,#Dinternamiento').fadeOut("slow");
                    $('#tipoMedidaPL,#tipoMedidaNPL,#internamiento').val('-2').prop("required", false);
                    $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3)').fadeIn('slow');
                    $('#tblDConclusiones tr > *:nth-child(4)').hide();
                    $('#tblDConclusiones input').prop({"checked": false, "required": true});
                }else{
                    alertify.alert('Mensaje Importante', 'Para el tipo de resoluci\u00F3n Mixta debe de haber por lo menos 2 delitos atribuidos al adolescente');
                    $('#tipoResolucionPA').val('');
                    $('#dTipoMedidaPL,#dTipoMedidaNPL,#Dinternamiento').fadeOut("slow");
                    $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3),#tblDConclusiones tr > *:nth-child(4)').hide();
                }
                break;
            default:
                $('#dTipoMedidaPL,#dTipoMedidaNPL,#Dinternamiento').fadeOut("slow");
                $('#tipoMedidaPL,#tipoMedidaNPL,#internamiento').val('-2').prop("required", false);
                $('#tblDConclusiones tr > *:nth-child(4)').fadeIn("slow");
                $('#tblDConclusiones tr > *:nth-child(4) input').prop("checked", true);
                $('#tblDConclusiones tr > *:nth-child(2),#tblDConclusiones tr > *:nth-child(3)').hide();

                break;
        }
    });
    
    $('#tipoMedidaPL').change(function(){
        if (($('#tipoMedidaPL').val() === '2') || ($('#tipoMedidaPL').val() === '3')) {
            $('#Dinternamiento').fadeIn("slow");
            $('#internamiento').val('').prop("required", true);
        } else {
            $('#Dinternamiento').fadeOut("slow");
            $('#internamiento').val('-2').prop("required", false);
        }
    });
    
    $('#reparaDanio').change(function(){
        if ($('#reparaDanio').val() === '1') {
            $('#dTipoRepara').fadeIn("slow");
            $('#tipoReparaD').val('').prop("required", true);
        } else {
            $('#dMontoRepara,#dTipoRepara').fadeOut("slow");
            $('#montoReparaD,#tipoReparaD').val('-2').prop("required", false);
        }
    });
    
    $('#tipoReparaD').change(function(){
        if ($('#tipoReparaD').val() === '2') {
            $('#dMontoRepara').fadeIn("slow");
            $('#montoReparaD').val('').prop("required", true);
        } else {
            $('#dMontoRepara').fadeOut("slow");
            $('#montoReparaD').val('-2').prop("required", false);
        }
    });
    
    $('#impugnacion').change(function(){
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
    });
    
    $('#proceSobreseimto').change(function(){
        if ($('#proceSobreseimto').val() === '6') {
            $('#dExcluAccion').fadeIn("slow");
            $('#excluAccion').val('').prop("required", true);
        } else {
            $('#dExcluAccion').fadeOut("slow");
            $('#excluAccion').val('-2').prop("required", false);
        }
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
                console.log("Respuesta del servidor Conclusiones: ", response);
                alert("Guardado correctamente!!!");
                if (response !== null && $.isArray(response)) {
                    if(response[0] === "null"){//No traemos posicion entonces agregamos la fila a la tabla por que se encuentra volando
                        //Si no tare posicion significa que esta volando y se resta de adol por asignar estatus
                        
                        buscaYremplaza(response[1], response[5]);//mandamos el nombre de procesado y la bandera nueva
                        parent.$('#tablaConclu tbody').append('<tr id="' + response[1].replace("/", "") + '"><td>' + response[1] + '</td>\n\
                            <td>' + response[2] + '</td><td>' + response[3] + '</td><td>' + response[4] + '</td>\n\
                            <td><a class="pop" href="conclusiones.jsp?proceClave=' + response[1] + '&posicion=' + parent.$('#tablaConclu tbody tr').length +
                            '&edita=Si"><img src="img/editar.png" title="Modificar"/></a></td></tr>');
                        if(parent.$('#tablaConclu tbody tr').length === 0){
                            parent.$('#btn7').prop('disabled', true);
                        }
                        if(parent.$('#tablaTramite tbody tr').length === 0){
                            parent.$('#btn8').prop('disabled', true);
                        }
                    }else{
                        for (var i = 2; i <= 4; i++) {//pone filas correspondientes en la tabla de conclusiones
                            parent.$('#tablaConclu tbody').find('tr').eq(response[0]).children('td').eq(i-1).html(response[i]);
                        }
                        //editamos enlance para que pueda ser actualizado ya estando lleno
                        var enlace = parent.$('#tablaConclu tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                        parent.$('#tablaConclu tbody tr').eq(response[0]).find('a').attr('href',enlace);
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor Conclusiones: ", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });
    /*---------------------------- FIN FUNCIONES CONCLUSIONES JC----------------------------*/
});
