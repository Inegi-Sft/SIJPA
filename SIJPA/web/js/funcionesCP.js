/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    /*---------------------------- FUNCIONES CAUSA PENAL JC----------------------------*/
    //Se usa para la recuperacion de datos de DB
    if($('#expClave').val() !== ''){
        $('#formCausaPenal').find('input, textarea, button, select').attr('disabled', true);
        $("#guardarExp").prop("hidden", true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#carpInves').val() !== ''){
        $('#carpInves,#expClave').prop('readonly',true);
        $("#compe option:not(:selected)").attr("disabled", true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#fIngreso').val() === '1899-09-09'){
        $('#fIngreso').prop('readonly', true);
        $('#chkFechaIngre').prop('checked', true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#ExpAcomu').val() === '1'){
        $('#expReferen').show();
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#compe').val() === '1'){
        $('#totalElementos').show();
    }else if($('#compe').val() === '2'){
        $('#tipoIncopetencia').show(); 
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#opera').val() !== ''){
        $('#Tdelitos').attr('min',$('#Tdelitos').val());
        $('#Tadolescentes').attr('min',$('#Tadolescentes').val());
        $('#Tvictimas').attr('min',$('#Tvictimas').val());
    }
    
    $('#nomJuez').change(function(){
        if($(this).val() === '100'){
            //window.location.href = 'capturaJuez.jsp';
            alert('Favor de capturar el Juez y regresar a capturar el expediente');
            window.location.href = 'capturaJuez.jsp';
        }
    });
    
    $('#ExpAcomu').change(function (){
        if ($('#ExpAcomu').val() === '1') {
            $('#expReferen').fadeIn("slow");
            $('#ExpRefe').val('').prop("required", true);
        } else {
            $('#expReferen').fadeOut("slow");
            $('#ExpRefe').val('-2').prop("required", false);
        }
    });
    
    $('#compe').change(function (){
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
    });
    
    $('#Tdelitos, #Tadolescentes, #Tvictimas').change(function () {
    var Mnsj="LA CANTIDAD DEBE DE SER MAYOR A 0";
    if ( $('#Tdelitos').val()==="-1" || $('#Tdelitos').val()==="0" )
    {
      alert (Mnsj);
      $('#Tdelitos').val("1");
      $('#Tdelitos').focus();
    }else if ( $('#Tadolescentes').val()==="-1" || $('#Tadolescentes').val()==="0" )
    {
      alert (Mnsj);
      $('#Tadolescentes').val("1");
      $('#Tadolescentes').focus();
    }else if ( $('#Tvictimas').val()==="-1" || $('#Tvictimas').val()==="0" )
    {
      alert (Mnsj);
      $('#Tvictimas').val("1"); 
      $('#Tvictimas').focus();
    }
     });
  
   $('#Tdelitos, #Tadolescentes, #Tvictimas').focus(function (e) {
        if ($('#expClave').val() === "") {
            e.stopImmediatePropagation();
            alert('Favor de capturar el expediente clave para poder agregar los datos siguientes');
            $('#expClave').focus();
        }
    });
   
    
    $('#Tdelitos, #Tadolescentes, #Tvictimas').keydown(function(e){
        return false;
    });
    
    //Guarda Causa Penal
    $('#formCausaPenal').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var resp = confirm("Una vez guardada la Causa Penal no se podra editar,\n"
                        + "Esta seguro que los datos son los correctos?");
        if(resp){
            $.ajax({
                type: 'post',
                url: 'insrtCausaPenal',
                data: $('#formCausaPenal').serialize(),
                success: function (response) {
                    console.log("Respuesta del servidor Causa Penal: ", response);
                    alert("Guardado con exito!!!");
                    $('#formCausaPenal').find('input, textarea, button, select').attr('disabled', true);
                    $("#guardarExp").prop("hidden", true);
                    if (response !== null && $.isArray(response)) {
                        if(response[0] === '1'){//organo competente
                            var expe = $('#expClave').val();
                            console.log('Entramos  organo competente: ' , response[0]);
                            for(var x = 1; x <= response[2]; x++){
                                $('#tablaDeli tbody').append('<tr><td>' + expe + '-D' + x + '</td><td></td><td></td><td></td><td></td>\n\
                                <td></td><td><a class="pop" href="delitos.jsp?delitoClave=' + expe + '-D' + x + '&posicion=' + (x-1) + '">\n\
                                <img src="img/editar.png" title="Modificar"/></a></td>\n\
                                <td><a href="#"><img src="img/delete.png" title="Eliminar" \n\
                                    onclick="borraRegistro(\'' + expe + '-D' + x + response[1] + '\',' + (x-1) + ',\'tablaDeli\',\'#Tdelitos\')"/>\n\
                                </td></a></tr>');
                            }
                            for(var x = 1; x <= response[3]; x++){
                                $('#tablaProcesa tbody').append('<tr><td>' + expe + '-P' + x + '</td><td></td><td></td><td></td>\n\
                                <td></td><td><a class="pop" href="procesados.jsp?proceClave=' + expe + '-P' + x + '&posicion=' + (x-1) + '">\n\
                                <img src="img/editar.png" title="Modificar"/></a></td>\n\
                                <td><a href="#"><img src="img/delete.png" title="Eliminar" \n\
                                    onclick="borraRegistro(\'' + expe + '-P' + x + response[1] + '\',' + (x-1) + ',\'tablaProcesa\',\'#Tadolescentes\')"/>\n\
                                </td></a></tr>');

                                $('#tablaInicial tbody').append('<tr><td>' + expe + '-P' + x + '</td><td></td><td></td><td></td><td></td>\n\
                                <td></td><td><a class="pop" href="etapaInicial.jsp?proceClave=' + expe + '-P' + x + '&posicion=' + (x-1) + '">\n\
                                <img src="img/editar.png" title="Modificar"/></a></td></tr>');
                            }
                            for(var x = 1; x <= response[4]; x++){
                                $('#tablaVictimas tbody').append('<tr><td>' + expe + '-V' + x + '</td><td></td><td></td><td></td>\n\
                                <td></td><td><a class="pop" href="victimas.jsp?victiClave=' + expe + '-V' + x + '&posicion=' + (x-1) + '">\n\
                                <img src="img/editar.png" title="Modificar"/></a></td>\n\
                                <td><a href="#"><img src="img/delete.png" title="Eliminar" \n\
                                    onclick="borraRegistro(\'' + expe + '-V' + x + response[1] + '\',' + (x-1) + ',\'tablaVictimas\',\'#Tvictimas\')"/>\n\
                                </td></a></tr>');
                            }
                            console.log('Abrimos la segunda pestaña: ' , response[0]);
                            openPestana('btn2', 'p2');
                        }
                    }
                },
                error: function (response) {
                    console.log("Respuesta del servidor Causa Penal: ", response);
                    alert('Error al guardar, vuelva a intentarlo o cunsulte al administrador');
                }
            });
        }
        
    });
    /*---------------------------- FIN FUNCIONES CAUSA PENAL JC----------------------------*/
});
