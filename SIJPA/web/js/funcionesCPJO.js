/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    //Se usa para la recuperacion de datos de DB
    if($('#fIngresoJO').val() === '1899-09-09'){
        $('#fIngresoJO').prop('readonly', true);
        $('#chkFechaIngreJO').prop('checked', true);
    }
    
    //Se usa para la recuperacion de BD
    if($('#difeOrgano').val() === '1'){
        $('#divOrgDif').show();
    }else if($('#difeOrgano').val() === '2'){
        $('#regCantJuez').show();
        //Si dice que NO en otro organo entonces le mostramos la cantidad de jueces y jueces
        if($('#cantJuezHi').val() !== ''){
            var cantiJuez = $('#cantJuezHi').val();
            if(cantiJuez === '1'){
                $('#divJuezJO1').show();
            }else if(cantiJuez === '2'){
                $('#divJuezJO1,#divJuezJO2').show();
            }else{
                $('#divJuezJO1,#divJuezJO2,#divJuezJO3').show();
            }
            $("#cantJuez option[value='" + cantiJuez + "']").prop('selected', true);
        }
    }
    
    $('#difeOrgano').change(function(){
        if($(this).val() === '2'){
            $('#regCantJuez').fadeIn();
            $('#cantJuez').val('').prop('required', true);
            
            $('#divOrgDif').fadeOut();
            $('#orgDif').val('-2').prop('required', false);
        }else{
            $('#divOrgDif').fadeIn();
            $('#orgDif').val('').prop('required', true);
            
            $('#regCantJuez').fadeOut();
            $('#cantJuez').val('-2').prop('required', false);
            $('#divJuezJO1,#divJuezJO2,#divJuezJO3').fadeOut();
            $('#juezJO1,#juezJO2,#juezJO3').val('-2').prop('required', false);
        }
    });
    
    $('#cantJuez').change(function(){
        switch ($('#cantJuez').val()){
            case '1':
                $('#divJuezJO1').fadeIn();
                $('#juezJO1').val('').prop('required', true);
                
                $('#divJuezJO2,#divJuezJO3').fadeOut();
                $('#juezJO2,#juezJO3').val('-2').prop('required', false);
                break;
            case '2':
                $('#divJuezJO1,#divJuezJO2').fadeIn();
                $('#juezJO1,#juezJO2').val('').prop('required', true);
                
                $('#divJuezJO3').fadeOut();
                $('#juezJO3').val('-2').prop('required', false);
                break;
            case '3':
                $('#divJuezJO1, #divJuezJO2, #divJuezJO3').fadeIn();
                $('#juezJO1,#juezJO2,#juezJO3').val('').prop('required', true);
                break;
            default:
                $('#divJuezJO1,#divJuezJO2,#divJuezJO3').fadeOut();
                $('#juezJO1,#juezJO2,#juezJO3').val('-2').prop('required', false);
                break;
        }
    });
    
    $('#orgDif').change(function(){
        if($(this).val() === '100'){
            alert('Favor de capturar el Juez y regresar a capturar el expediente');
            window.location.href = 'capturaJuzgado.jsp';
            //hacer la funcion en un futuro para capturar desde fancybox
//            $.fancybox.open({
//                src  : 'capturaJuzgado.jsp',
//                type : 'iframe',
//                opts : {
//                    afterShow : function( instance, current ) {
//                            console.info( 'done!' );
//                    }
//                }
//            });
        }
    });
    
    //Guarda Causa Penal
    $('#formCausaPenalJO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtCausaPenalJO',
            data: $('#formCausaPenalJO').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Causa Penal JO: ", response);
                if(response === "Realizado"){
                    alert("Guardado con exito!!!");
                    $('#formCausaPenalJO').find('input, textarea, button, select').attr('disabled', true);
                    $("#guardarExpJO").prop("hidden", true);
                    openPestana('btn2', 'p2');
                }else{
                    alert("Ocurrio un error, favor de verificarlo");
                }
                /*if (response !== null && $.isArray(response)) {
                    if(response[0] === 1){//organo competente
                        var expe = $('#expClave').val();
                        for(var x = 1; x <= response[2]; x++){
                            $('#tablaDeli tbody').append('<tr><td>' + expe + "-D" + x + '</td><td></td><td></td><td></td><td></td>\n\
                            <td></td><td><a class="pop" href="delitos.jsp?delitoClave=' + expe + '-D' + x + '&posicion=' + (x-1) + '">\n\
                            <img src="img/editar.png" title="Modificar"/></a></td>\n\
                            <td><a href="#"><img src="img/delete.png" title="Eliminar" \n\
                                onclick="borraRegistro(\'' + expe + '-D' + x + response[1] + '\',' + (x-1) + ',\'tablaDeli\',\'#Tdelitos\')"/>\n\
                            </td></a></tr>');
                        }
                        for(var x = 1; x <= response[3]; x++){
                            $('#tablaProcesa tbody').append('<tr><td>' + expe + "-P" + x + '</td><td></td><td></td><td></td>\n\
                            <td></td><td><a class="pop" href="procesados.jsp?proceClave=' + expe + '-P' + x + '&posicion=' + (x-1) + '">\n\
                            <img src="img/editar.png" title="Modificar"/></a></td>\n\
                            <td><a href="#"><img src="img/delete.png" title="Eliminar" \n\
                                onclick="borraRegistro(\'' + expe + '-P' + x + response[1] + '\',' + (x-1) + ',\'tablaProcesa\',\'#Tadolescentes\')"/>\n\
                            </td></a></tr>');
                            
                            $('#tablaInicial tbody').append('<tr><td>' + expe + "-P" + x + '</td><td></td><td></td><td></td><td></td>\n\
                            <td></td><td><a class="pop" href="etapaInicial.jsp?proceClave=' + expe + '-P' + x + '&posicion=' + (x-1) + '">\n\
                            <img src="img/editar.png" title="Modificar"/></a></td></tr>');
                        }
                        for(var x = 1; x <= response[4]; x++){
                            $('#tablaVictimas tbody').append('<tr><td>' + expe + "-V" + x + '</td><td></td><td></td><td></td>\n\
                            <td></td><td><a class="pop" href="victimas.jsp?victiClave=' + expe + '-V' + x + '&posicion=' + (x-1) + '">\n\
                            <img src="img/editar.png" title="Modificar"/></a></td>\n\
                            <td><a href="#"><img src="img/delete.png" title="Eliminar" \n\
                                onclick="borraRegistro(\'' + expe + '-V' + x + response[1] + '\',' + (x-1) + ',\'tablaVictimas\',\'#Tvictimas\')"/>\n\
                            </td></a></tr>');
                        }
                        openPestana('btn2', 'p2');
                    }
                }*/
            },
            error: function (response) {
                console.log("Respuesta del servidor Causa Penal: ", response);
                alert('Error al guardar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    });
});
