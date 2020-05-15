$(document).ready(function () {
    /*----------------Cabecera despliega cerrar cesion------------------------*/
    $('#usu img').click(function () {
        $('#usu #enlace').animate({
            right: "0",
            width: "toggle",
            opacity: "toggle"
        }, 800);
    });
    
    $(".load").fadeOut("slow");//proceso de carga para causas penales

    //Establece am pata input time y no marque error en el submit
    $('.tiempo').prop({'min': '00:01', 'max': '11:59'});
    
    //auto acompletado para las causas penales
    $("#causaClaveJO").selectize({
        onBlur: function () {
            this.clearCache();
        }
    });
    
    //Guarda Audiencias
    $('#formAudienciasJO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        
        //valida que se seleccione por lo menos 1 juez
        if ($('input[name="chkJuez"]:checked').length === 0) {
            alert('Selecciona al menos 1 Juez y maximo 3 Jueces');
            $('input[name="chkJuez"]').focus();
            return false;
        
        //valida que se seleccione por lo menos 1 audiencia
        } else if ($('input[name="chkJO"]:checked').length === 0) {
            alert('Selecciona al menos una Audiencia celebrada');
            $('#chkJO1').focus();
            return false;
        }
        
        $.ajax({
            type: 'post',
            url: 'insrtAudienciasJO',
            data: $('#formAudienciasJO').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Audiencias guardar: ", response);
                alert("Guardado con exito!!!");
                window.location='audienciasJO.jsp';
            },
            error: function (response) {
                console.log("Respuesta del servidor Audiencias error: ", response);
                alert('Error al guardar, posible audiencia duplicada');
            }
        });
    });
    
});

// habilita las audiencias de acuaerdo si el checkbox esta checkeado
function habilitaTxt(obj, idTxt1, idTxt2, chkNi1, chkNi2) {
    if (obj.checked) {
        $(idTxt1).prop({"required": true, "disabled": false});
        $(idTxt2).prop({"required": true, "disabled": false});
        $(chkNi1).prop("disabled", false);
        $(chkNi2).prop("disabled", false);
    } else {
        $(idTxt1).prop({"required": false, "disabled": true, "readonly": false}).val("");
        $(idTxt2).prop({"required": false, "disabled": true, "readonly": false}).val("");
        $(chkNi1).prop({"disabled": true, "checked": false});
        $(chkNi2).prop({"disabled": true, "checked": false});
    }
}

//cuenta cuantos jueces se han seleccionado
function cuenta(obj) {
    if ($('input[name="chkJuez"]:checked').length > 3) {
        alert('Solo puedes seleccionar hasta 3 Jueces');
        $(obj).prop("checked", false);
    }
}

// Fechas No identificadas
function fechaNI(obj, idTxtDate) {
    if (obj.checked) {
        $(idTxtDate).prop("readonly", true).val("1899-09-09");
    } else {
        $(idTxtDate).prop("readonly", false).val("");
    }
}
//duracion no identificada
function duracionNI(obj, idTxtDate) {
    if (obj.checked) {
        $(idTxtDate).prop("readonly", true).val("09:09");
    } else {
        $(idTxtDate).prop("readonly", false).val("");
    }
}
//Comprueba que primero se haya seleccionado un juzgado clave antes de agregar audiencias
function validaAddAudienciasJO() {
    if ($("#juzgado").val() !== "") {
        window.location.href = "capturaAudienciasJO.jsp";
    } else {
        $(".msjAviso").fadeIn("slow");
    }
}

//Elimina Audiencias
function deleteAudienciasJO(causa) {
    var resp = confirm("Realmente deseas eliminar este resgistro?");
    if (resp) {
        $.ajax({
            type: 'post',
            url: 'insrtAudienciasJO',
            data: {causaClaveJO: causa, operacion: 'eliminar'},
            success: function (response) {
                console.log("Respuesta del servidor al borrar: ", response);
                if (response === "AudienciasDeleted") {
                    alert("Audiencias de la Causa Penal: " + causa + " Eliminadas!!!"); 
                    location.reload();
                }
            },
            error: function (response) {
                console.log("Respuesta del servidor error al borrar: ", response);
                alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    }
}