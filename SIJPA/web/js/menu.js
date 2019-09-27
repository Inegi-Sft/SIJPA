/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    // Normal Clicks
    $(function () {
        $('.toggle-nav').click(function () {
            $('body').toggleClass('show-nav');
            return false;
        });
    });
    
    $('.contenedor').click(function(){
        if($('body').hasClass('show-nav')){
            $('body').removeClass('show-nav');
            $('.toggle-nav').toggleClass('open');
        }else{
            
        }
    });

//    $(function () {
//        $(window).scroll(function () {
//            if ($(window).scrollTop() > 80) {
//                $("nav").css("top","0");
//            }else{
//                $("nav").css("top","72px");
//            }
//        });
//    });

    $('.toggle-nav').click(function () {
        $('.toggle-nav').toggleClass('open');
    });
});