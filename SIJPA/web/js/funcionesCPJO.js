/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    
    //Se usa para la recuperacion de datos de DB
    if($('#expClaveJC').val() === ''){
        $('#TdelitosJO').prop('disabled', true);
        $('#TadolescentesJO').prop('disabled', true);
        $('#TvictimasJO').prop('disabled', true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#expClaveJO').val() !== ''){
        $('#formCausaPenalJO').find('input, textarea, button, select').attr('disabled', true);
        $("#guardarExpJO").prop("hidden", true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#fIngresoJC').val() === '1899-09-09'){
        $('#fIngresoJC').prop('readonly', true);
        $('#chkFechaIngreJC').prop('checked', true);
    }
    
    //Se usa para la recuperacion de datos de DB
    if($('#fIngresoJO').val() === '1899-09-09'){
        $('#fIngresoJO').prop('readonly', true);
        $('#chkFechaIngreJO').prop('checked', true);
    }
  
    //se usa para la recuperacion de BD
    var valor1 = $('#juezJO1').val(); 
    var valor2 = $('#juezJO2').val(); 
    var valor3 = $('#juezJO3').val(); 

    if(valor1!==""){
        $("#juezJO2 option[value=" + valor1 + "]").attr("disabled", true);
        $("#juezJO3 option[value=" + valor1 + "]").attr("disabled", true);
    }
    if(valor2!==""){
        $("#juezJO1 option[value=" + valor2 + "]").attr("disabled", true);
        $("#juezJO3 option[value=" + valor2 + "]").attr("disabled", true);
    }
    if(valor3!==""){
       $("#juezJO1 option[value=" + valor3 + "]").attr("disabled", true);
       $("#juezJO2 option[value=" + valor3 + "]").attr("disabled", true);
    }
   
    //se usa para la recuperacion de BD
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
    
    //Se usa para la recuperacion de BD
//    if($('#difeOrgano').val() === '1'){
//        $('#divOrgDif').show();
//        $('#cantJuez,#juezJO1,#juezJO2,#juezJO3').val('-2').prop('required', false);
//    }else if($('#difeOrgano').val() === '2'){
//            $('#regCantJuez').show();
//        //Si dice que NO en otro organo entonces le mostramos la cantidad de jueces y jueces
//        if($('#cantJuezHi').val() !== ''){
//            var cantiJuez = $('#cantJuezHi').val();
//            if(cantiJuez === '1'){
//                $('#divJuezJO1').show();
//            }else if(cantiJuez === '2'){
//                $('#divJuezJO1,#divJuezJO2').show();
//            }else{
//                $('#divJuezJO1,#divJuezJO2,#divJuezJO3').show();
//            }
//            $("#cantJuez option[value='" + cantiJuez + "']").prop('selected', true);
//        }
//    }
    
    //Solo entra si la causa penal JC se atendio en otro organo para llenar las causas
    $('#jClaveJC').change(function(){
        //Vaciamos las variables para que no exista confucion
        $('#fIngresoJC').val('');
        $('#chkFechaIngreJC').prop('checked', false);
        $('#TdelitosJO').val('');
        $('#TadolescentesJO').val('');
        $('#TvictimasJO').val('');
        var jClaveJC = $(this).val();//Recuperamos el valor de juzgado clave
        $.ajax({
            type: 'post',
            url: 'obtenCausasJC',
            data:{jClaveJC: jClaveJC},
            success: function (response) {
                console.log("Respuesta del obten Causas JC", response);
                $('#expClaveJC').html(response);
                $('#expClaveJC').prop('disabled', false);
            },
            error: function (response) {
                console.log("Respuesta del obten Causas JC", response);
            }
        });
    });
    
    //Solo entra si la causa penal JC se atendio en otro organo para llenar la fecha y totales ingreso de jc
    $('#expClaveJC').change(function(){
        var expClaveJC = $(this).val();
        var jClaveJC = $('#jClaveJC').val();
        $.ajax({
            type: 'post',
            url: 'obtenCausasJC',
            data:{
                expClaveJC: expClaveJC,
                jClaveJC: jClaveJC
            },
            success: function (response) {
                console.log("Respuesta del obten datos Causas JC", response);
                if(response.fechaJC === '1899-09-09'){
                    $('#chkFechaIngreJC').prop('checked', true);
                }else{
                    $('#chkFechaIngreJC').prop('checked', false);
                }
                
                $('#fIngresoJC').val(response.fechaJC);
                $('#TdelitosJO').val(response.totDelJC);
                $('#TdelitosJO').attr({'disabled': false, 'min': response.totDelJC});
                $('#TadolescentesJO').val(response.totProJC);
                $('#TadolescentesJO').attr({'disabled': false, 'min': response.totProJC});
                $('#TvictimasJO').val(response.totVicJC);
                $('#TvictimasJO').attr({'disabled': false, 'min': response.totVicJC});
                //Recuperamos datos JC por si los de JO son alterados
                $('#TdelitosJC').val(response.totDelJC);
                $('#TadolescentesJC').val(response.totProJC);
                $('#TvictimasJC').val(response.totVicJC);
                
                var x = 0;
                //Agregamos datos a la tabla de delitos
                for(x = 0; x <= response.del.length; x++){
                    $('#tablaDeliJO').append(response.del[x]);
                }
                //Agregamos datos a la tabla de procesados
                for(x = 0; x <= response.pro.length; x++){
                    $('#tablaProcesaJO').append(response.pro[x]);
                }
                //Agregamos datos a la tabla de procesados
                for(x = 0; x <= response.vic.length; x++){
                    $('#tablaVictimasJO').append(response.vic[x]);
                }
            },
            error: function (response) {
                console.log("Respuesta del obten Causas JC", response);
            }
        });
    });
    
    $('#cantJuez').change(function(){
        $("#juezJO1 option:not(:selected), #juezJO2 option:not(:selected),#juezJO3 option:not(:selected)").attr("disabled", false);
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
    
    $('#juezJO1, #juezJO2, #juezJO3').change(function(){
        if($(this).val() === '100'){
            alert('Favor de capturar el Juez y regresar a capturar el expediente');
            window.location.href = 'capturaJuez.jsp';
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
    
    //valida que el juez seleccionado de un select, no se repita en los otros 2 select
    $('#juezJO1').change(function (){
        var valor1 = $(this).val(); 
        var valor2 = $('#juezJO2').val(); 
        var valor3 = $('#juezJO3').val(); 
        
        $("#juezJO2 option:not(:selected)").attr("disabled", false);
        $("#juezJO2 option[value=" + valor1 + "]").attr("disabled", true);
        if(valor3!=="")
        $("#juezJO2 option[value=" + valor3 + "]").attr("disabled", true);
        
        $("#juezJO3 option:not(:selected)").attr("disabled", false);
        $("#juezJO3 option[value=" + valor1 + "]").attr("disabled", true);
        if(valor2!=="")
        $("#juezJO3 option[value=" + valor2 + "]").attr("disabled", true);
    });
    
    $('#juezJO2').change(function (){
        var valor2 = $(this).val(); 
        var valor1 = $('#juezJO1').val(); 
        var valor3 = $('#juezJO3').val(); 
        
        $("#juezJO1 option:not(:selected)").attr("disabled", false);
        $("#juezJO1 option[value=" + valor2 + "]").attr("disabled", true);
        if(valor3!=="")
        $("#juezJO1 option[value=" + valor3 + "]").attr("disabled", true);
        
        $("#juezJO3 option:not(:selected)").attr("disabled", false);
        $("#juezJO3 option[value=" + valor2 + "]").attr("disabled", true);
        if(valor1!=="")
        $("#juezJO3 option[value=" + valor1 + "]").attr("disabled", true);
    });
    
    $('#juezJO3').change(function (){
        var valor3 = $(this).val(); 
        var valor2 = $('#juezJO2').val(); 
        var valor1 = $('#juezJO1').val(); 
        
        $("#juezJO1 option:not(:selected)").attr("disabled", false);
        $("#juezJO1 option[value=" + valor3 + "]").attr("disabled", true);
        if(valor2!=="")
        $("#juezJO1 option[value=" + valor2 + "]").attr("disabled", true);
        
        $("#juezJO2 option:not(:selected)").attr("disabled", false);
        $("#juezJO2 option[value=" + valor3 + "]").attr("disabled", true);
        if(valor1!=="")
        $("#juezJO2 option[value=" + valor1 + "]").attr("disabled", true);
    });
    
    //Guarda Causa Penal
    $('#formCausaPenalJO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var resp = confirm("Una vez guardada la Causa Penal no podrá  hacer niingun cambio,\n"
                    + "Esta seguro que los datos son los correctos?");
        if(resp){
            $.ajax({
                type: 'post',
                url: 'insrtCausaPenalJO',
                data: $('#formCausaPenalJO').serialize(),
                success: function (response) {
                    console.log("Respuesta del servidor Causa Penal JO: ", response);
                    alert("Guardado correctamente!!!");
                    $('#formCausaPenalJO').find('input, textarea, button, select').attr('disabled', true);
                    $("#guardarExpJO").prop("hidden", true);
                    if (response !== null && $.isArray(response)) {
                        var expeJO = $('#expClaveJO').val().toUpperCase();
                        var x = 0;
                        var idJC = '';
                        var enlace = '';
                        //Delitos
                        for(x = 0; x < $('#tablaDeliJO tbody tr').length; x++){
                            //Le ponemos el enlace formando los dos delitos claves
                            idJC = $('#tablaDeliJO tbody tr').eq(x).find('td:eq(0)').html();
                            enlace = 'delitosJO.jsp?delitoClaveJC=' + idJC + '&delitoClaveJO=' + expeJO + '-D' + (x+1)
                            + '&posicion=' + x;
                            $('#tablaDeliJO tbody tr').eq(x).find('a').attr('href', enlace);
                            //le ponemos el nuevo texto con la nueva causaClave JO
                            $('#tablaDeliJO tbody tr').eq(x).find('td:eq(1)').html(expeJO + '-D' + (x+1));
                        }
                        //obtenemos el numero nuevo de delitos para agregar los nuevos registros a la tabla
                        var totDelJO = parseInt(response[1]);
                        for(x = parseInt($('#TdelitosJC').val()); x < totDelJO; x++){
                            $('#tablaDeliJO').append('<tr><td>' + expeJO + '-D' + (x+1) + '</td><td></td><td></td><td></td><td></td><td></td>\n\
                                    <td><a class="pop" href="delitosJO.jsp?delitoClaveJC=--&delitoClaveJO=' + expeJO + '-D' + (x+1) + '&posicion=' + x + '">\n\
                                    <img src="img/editar.png" title="Modificar"/></a></td>\n\
                                    </tr>');
                        }
                        
                        //Procesados y Etapa Oral
                        for(x = 0; x < $('#tablaProcesaJO tbody tr').length; x++){
                            //Le ponemos el enlace formando los dos procesados claves
                            idJC = $('#tablaProcesaJO tbody tr').eq(x).find('td:eq(0)').html();
                            enlace = 'procesadosJO.jsp?proceClaveJC=' + idJC + '&proceClaveJO=' + expeJO + '-P' + (x+1)
                            + '&posicion=' + x;
                            $('#tablaProcesaJO tbody tr').eq(x).find('a').attr('href', enlace);
                            //le ponemos el nuevo texto con la nueva causaClave JO
                            $('#tablaProcesaJO tbody tr').eq(x).find('td:eq(1)').html(expeJO + '-P' + (x+1));
                        }
                        //obtenemos el numero nuevo de procesados para agregar los nuevos registros a la tabla
                        var totProJO = parseInt(response[2]);
                        for(x = parseInt($('#TadolescentesJC').val()); x < totProJO; x++){
                            $('#tablaProcesaJO').append('<tr><td>' + expeJO + '-P' + (x+1) + '</td><td></td><td></td><td></td><td></td>\n\
                                    <td><a class="pop" href="procesadosJO.jsp?proceClaveJC=--&proceClaveJO=' + expeJO + '-P' + (x+1) + '&posicion=' + x + '">\n\
                                    <img src="img/editar.png" title="Modificar"/></a></td>\n\
                                    </tr>');
//                            $('#tablaJuicioJO').append('<tr><td>' + expeJO + '-P' + (x+1) + '</td><td></td><td></td><td></td><td></td>\n\
//                                    <td><a class="pop" href="etapaOral.jsp?proceClaveJC=--&proceClaveJO=' + expeJO + '-P' + (x+1) + '&posicion=' + x + '">\n\
//                                    <img src="img/editar.png" title="Modificar"/></a></td>\n\
//                                    </tr>');
                        }
                        
                        //Victimas
                        for(x = 0; x < $('#tablaVictimasJO tbody tr').length; x++){
                            //Le ponemos el enlace formando los dos delitos claves
                            idJC = $('#tablaVictimasJO tbody tr').eq(x).find('td:eq(0)').html();
                            enlace = 'victimasJO.jsp?victiClaveJC=' + idJC + '&victiClaveJO=' + expeJO + '-V' + (x+1)
                            + '&posicion=' + x;
                            $('#tablaVictimasJO tbody tr').eq(x).find('a').attr('href', enlace);
                            //le ponemos el nuevo texto con la nueva causaClave JO
                            $('#tablaVictimasJO tbody tr').eq(x).find('td:eq(1)').html(expeJO + '-V' + (x+1));
                        }
                        //obtenemos el numero nuevo de victimas para agregar los nuevos registros a la tabla
                        var totVicJO = parseInt(response[3]);
                        for(x = parseInt($('#TvictimasJC').val()); x < totVicJO; x++){
                            $('#tablaVictimasJO').append('<tr><td>' + expeJO + '-V' + (x+1) + '</td><td></td><td></td><td></td><td></td>\n\
                                    <td><a class="pop" href="victimasJO.jsp?victiClaveJC=--&victiClaveJO=' + expeJO + '-V' + (x+1) + '&posicion=' + x + '">\n\
                                    <img src="img/editar.png" title="Modificar"/></a></td>\n\
                                    </tr>');
                        }
                        
                        openPestana('btn2', 'p2');
                    }
                },
                error: function (response) {
                    console.log("Respuesta del servidor Causa Penal: ", response);
                    alert('Error al guardar, vuelva a intentarlo o cunsulte al administrador');
                }
            });
        }
    });
});
