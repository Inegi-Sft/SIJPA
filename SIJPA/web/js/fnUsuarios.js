/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('#buttonAdmin').click(function () {
        $('#mensajeAdmin').animate({
            top: "-600"
        },
        1500);
    });
    
    if($('#usuarioId').val() === '1'){
        $('input').prop('disabled', true);
        alertify.alert('Mensaje Importante','¡¡ El Usuario ID 1-Administrador no puede ser editado !!');
    }

    $('#pass').focusout(function () {
        if ($('#pass').val() === "") {
            $('#confPass').val('');
        }
    });

    $('#correo').focusout(function () {
        var usuario = $('#correo').val();
        $.ajax({
            url: 'obtenUsuario',
            type: 'post',
            data: {usuario: usuario},
            succes: function (data) {
                console.log('Usuario ' + data);
            }
        }).done(function (d) {
            console.log(d);
            if (d === 1) {
                alert('Usuario ya registrado, verificar');
                $('#correo').val('');
            }
        });
    });

    $('#confPass').keyup(function () {
        if ($('#confPass').val() !== '') {
            if ($('#confPass').val() === $('#pass').val()) {
                $('#mesajePass').text('Los passwords coinciden');
                $('#mesajePass').css({'color': '#66cc00'});
                $('#guardar').fadeIn('slow');
            } else {
                $('#mesajePass').text('Los passwords no coinciden');
                $('#mesajePass').css({'color': '#ff0000'});
                $('#guardar').fadeOut('slow');
            }
        }
    });
    
//    //Guarda Causa Penal
//    $('#formUsuario').submit(function (e) {
//        e.preventDefault();
//        e.stopImmediatePropagation();
//        $.ajax({
//            type: 'post',
//            url: 'insrtUsuario',
//            data: $('#formUsuario').serialize(),
//            success: function (response) {
//                console.log("Respuesta del servidor Usuarios: ", response);
//                if (response === '0') {
//                    window.location.href = "index.jsp";
//                    alertify.success('Usuario Guardado Correctamente');
//                }else if (response === '1'){
//                    window.location.href = "usuario.jsp";
//                    alertify.success('Usuario Guardado Correctamente');
//                }
//            },
//            error: function (response) {
//                console.log("Respuesta del servidor Usuario: ", response);
//                alertify.error('Error al guradar usuario');
//            }
//        });
//    });
});
