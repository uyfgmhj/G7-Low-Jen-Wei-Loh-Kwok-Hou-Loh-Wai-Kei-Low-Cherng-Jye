$(document).ready(function () {
    $(".bounce,.features").click(function () {
        $("html,body").animate({
            scrollTop: $("#flash2").offset().top - 40
        }
        , 1000);
    });
    $(".about").click(function () {
        $("html,body").animate({
            scrollTop: $("#flash3").offset().top - 40
        }
        , 1000);
    });
    $(".contact").click(function () {
        $("html,body").animate({
            scrollTop: $("#flash4").offset().top - 50
        }
        , 1000);
    });
    $(".home").click(function () {
        $("html,body").animate({
            scrollTop: $("#flash1").offset().top
        }
        , 1000);
    });
    $(window).scroll(function () {
        var scroll = $(window).scrollTop();
        if (scroll >= 659 - 40) {
            $("#header").addClass("changeBg");
            $("#header a:not(.login-btn").css('color', 'black');
        } else {
            $("#header").removeClass("changeBg");
            $("#header a:not(.login-btn").css('color', 'white');
        }
    });
});