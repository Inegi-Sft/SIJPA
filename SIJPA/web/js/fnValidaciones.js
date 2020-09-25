/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    
    //recuperacion del tipo de sistema en el select
    if($('#sistema').val() !== ''){
        var sist = $('#sistema').val();
        $("#validaSistema option[value='" + sist + "']").prop('selected', true);
    }
    
    //validacion para deshabilitar los botones cuando no haya datos
    var estatus="";
    if($("#impFaltantes tbody tr").length===0){
        $('#btnIF').prop("disabled",true);
        $('#tblValidacion tbody tr').eq(1).css("color","#ccc");
        estatus+="S";
    }
    if($("#delFaltantes tbody tr").length===0){
        $('#btnDF').prop("disabled",true);
        $('#tblValidacion tbody tr').eq(2).css("color","#ccc");
        estatus+="I";
    }
    if($("#vicFaltantes tbody tr").length===0){
        $('#btnVF').prop("disabled",true);
        $('#tblValidacion tbody tr').eq(3).css("color","#ccc");
        estatus+="N";
    }
    if($("#impFaltaCT tbody tr").length===0){
        $('#btnIFCT').prop("disabled",true);
        $('#tblValidacion tbody tr').eq(4).css("color","#ccc");
        estatus+=" ";
    }
    if($("#vicDelito tbody tr").length===0){
        $('#btnVD').prop("disabled",true);
        $('#tblValidacion tbody tr').eq(5).css("color","#ccc");
        estatus+="E";
    }
    if($("#impDelito tbody tr").length===0){
        $('#btnID').prop("disabled",true);
        $('#tblValidacion tbody tr').eq(6).css("color","#ccc");
        estatus+="R";
    }
    if($("#fechaIngreso tbody tr").length===0){
        $('#btnFIngre').prop("disabled",true);
        $('#tblValidacion tbody tr').eq(7).css("color","#ccc");
        estatus+="R";
    }
    if($("#fechaOcurrencia tbody tr").length===0){
        $('#btnFO').prop("disabled",true);
        $('#tblValidacion tbody tr').eq(8).css("color","#ccc");
        estatus+="O";
    }
    if($("#fechaConclusion tbody tr").length===0){
        $('#btnFC').prop("disabled",true);
        $('#tblValidacion tbody tr').eq(9).css("color","#ccc");
        estatus+="R";
    }
    if($("#fechaTramite tbody tr").length===0){
        $('#btnFT').prop("disabled",true);
        $('#tblValidacion tbody tr').eq(10).css("color","#ccc");
        estatus+="E";
    }
    if($("#fechaImpugnacion tbody tr").length===0){
        $('#btnFImpug').prop("disabled",true);
        $('#tblValidacion tr').eq(11).css("color","#ccc");
        estatus+="S";
    }

    if(estatus==="SIN ERRORES"){
        $('#tblValidacion').hide();
        $('#validacionOK').show();
    }else{
        $('#tblValidacion').show();
        $('#validacionOK').hide();
    }
//    $('#formValidacion').submit(function (e) {
//        e.preventDefault();
//        e.stopImmediatePropagation();
//        var sistema= $('#validaSistema').val();
//        $.ajax({
//            type: 'post',
//            url: 'obtenValidacion',
//            data: {sistema: sistema},
//            success: function (response) {
//                console.log("Respuesta del obten Causas Validaciones", response);
//                $('#v1 tbody').append(response);
//
//            },
//            error: function (response) {
//                console.log("Respuesta del servidor Validaciones: ", response);
//                alert('Error al validar, vuelva a intentarlo o cunsulte al administrador');
//            }
//                
//        });    
//    }); 
});

function openValidacion(ventana){
    $.fancybox.open({
        'src'  : ventana,
        'modal': true,
        afterShow : function() {
            $('.fancybox-content').append('<button data-fancybox-close class="fancybox-button fancybox-close-small" title="Cerrar">\n\
            <svg version="1" viewBox="0 0 24 24"><path d="M13 12l5-5-1-1-5 5-5-5-1 1 5 5-5 5 1 1 5-5 5 5 1-1z"></path></svg></button>');
        }
    });
}