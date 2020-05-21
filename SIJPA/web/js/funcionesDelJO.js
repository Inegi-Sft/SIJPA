/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    /*---------------------------- FUNCIONES DELITOS JC----------------------------*/
    //Se usa para la recuperacion de datos de DB
    if($('#reclasificaDel').val() === '1'){
        $('#dFechaReclaDel').show();
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#fechaReclaDel').val() === '1899-09-09'){
        $('#fechaReclaDel').prop('readonly', true);
        $('#chkFechaReclaDel').prop('checked', true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#ocurrencia').val() === '1899-09-09'){
        $('#ocurrencia').prop('readonly', true);
        $('#chkOcurrencia').prop('checked', true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#delitoNT').val() === '1' || $('#delitoNT').val() === '4' || $('#delitoNT').val() === '31'){
        var delitoNT = $('#delitoNT').val();
        $('#fldsAdicionales').show();
        if(delitoNT === '31'){
            $('#dCosaRobada').show();
        }else if(delitoNT === '1' || delitoNT === '4'){
            $('#dContextoSitua').show();
        }
    }
    
    //Si en la recuperacion de datos de BD viene activo el 99 entonces deshabilitamos las demas
    if ($('#cosaRobada99').is(":checked")) {
        for (var i = 1; i < 12; i++) {
            $('#cosaRobada' + i).prop("checked", false).prop("disabled", true);
        }
    }
    //Si mediante la captura sufre cambios el check, entonces se valida
    $('#cosaRobada99').change(function () {
        if ($(this).is(":checked")) {
            for (var i = 1; i < 12; i++) {
                $('#cosaRobada' + i).prop("checked", false).prop("disabled", true);
            }
        } else {
            for (var i = 1; i < 12; i++) {
                $('#cosaRobada' + i).prop("checked", false).prop("disabled", false);
            }
        }
    });
    
    //Si en la recuperacion de datos de BD viene activo el 99 entonces deshabilitamos las demas
    if ($('#contextoSitua99').is(":checked")) {
        for (var i = 1; i < 12; i++) {
            $('#contextoSitua' + i).prop("checked", false).prop("disabled", true);
        }
    }
    //Si mediante la captura sufre cambios el check, entonces se valida
    $('#contextoSitua99').change(function () {
        if ($(this).is(":checked")) {
            for (var i = 1; i < 12; i++) {
                $('#contextoSitua' + i).prop("checked", false).prop("disabled", true);
            }
        } else {
            for (var i = 1; i < 12; i++) {
                $('#contextoSitua' + i).prop("checked", false).prop("disabled", false);
            }
        }
    });
    
    //Auto acompletado
    $('#delitoCP').selectize({
        render: {
            option: function (data) {
                return '<div data-norma="' + data.norma + '">' + data.text + '</div>';
            }
        },
        onChange: function (value) {
            var vNorma = this.getOption(value).data('norma');
            llenaNormaT(vNorma);

            if (vNorma === 31) {//norma tecnica robo a casa habitacion
                $('#fldsAdicionales').fadeIn("slow");
                $('#dCosaRobada').fadeIn("slow");
                $('#dContextoSitua').fadeOut("slow");
            } else if (vNorma === 1 || vNorma === 4) {//norma tecnica homicidio o lesiones
                $('#fldsAdicionales').fadeIn("slow");
                $('#dContextoSitua').fadeIn("slow");
                $('#dCosaRobada').fadeOut("slow");
            } else {
                $('#fldsAdicionales').fadeOut("slow");
            }
        },
        onBlur: function () {
            this.clearCache();
        }
    });
    
  //Guarda DelitosJO
    $('#formDelitosJO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
     //   if ($('input[name="dCosaRobadaJO"]:checked').length === 0) {
       //     alert('Selecciona al menos una opcion de Caracteristicas Adicionales');
         //   $('input[name="dCosaRobadaJO"]').focus();
          //  return false;
        //}
        $.ajax({
            type: 'post',
            url: 'insrtDelitosJO',
            data: $('#formDelitosJO').serialize(),
            success: function (response) { 
                console.log("Respuesta del servidor Delitos JO: ", response);
                alert("Guardado con exito!!!");
                var numDeli = parseInt(parent.$('#TdelitosJO').val());
                if (response !== null && $.isArray(response)) {
                    for (var i = 1; i < 7; i++) {
                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaDeliJO tbody').find('tr').eq(response[0]).children('td').eq(i-1).html(response[i]);
   
                    }
                    //editamos enlance para que pueda ser actualizado ya estando lleno
                    var enlace = parent.$('#tablaDeliJO tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                    parent.$('#tablaDeliJO tbody tr').eq(response[0]).find('a').attr('href',enlace);
                    console.log('Captu: ' + response[7] + ' Existen: ' + numDeli);
                    if (response[7] === numDeli) {
                        parent.openPestana('btn3', 'p3');
                    } else {
                        alert('Falta por capturar ' + (numDeli - response[7]) + ' delitos');
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor Delitos: ", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });
    
    /*---------------------------- FIN FUNCIONES DELITOS JC----------------------------*/
});

//llena el select de norma tecnica de acuerdo con el select codigo penal
function llenaNormaT(vNorma) {
    if (vNorma !== '') {
        $.ajax({
            url: "obtenNormaTec",
            dataType: 'html',
            type: "post",
            data: {norma: vNorma},
            success: function (response) {
                console.log("Respuesta del servidor Llena Norma: ", response);
            }
        }).done(function (data) {
            $('#delitoNT').html(data);
        });
    } else {
        $('#delitoNT').empty().append("<option value='0'>--Seleccione--</option>");
    }
}
