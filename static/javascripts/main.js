// Gumby is ready to go
Gumby.ready(function () {
    console.log('Gumby is ready to go...', Gumby.debug());

    // placeholder polyfil
    if (Gumby.isOldie || Gumby.$dom.find('html').hasClass('ie9')) {
        $('input, textarea').placeholder();
    }
});

// Oldie document loaded
Gumby.oldie(function () {
    console.log("This is an oldie browser...");
});

Gumby.touch(function () {
    console.log("This is a touch enabled device...");
});

// Document ready
$(function () {
    $('.control a').click(function (event) {
        event.preventDefault();

        var menu = $('#menu_items');

        if (menu.is(':visible')) {
            menu.slideUp();
            $(this).html($(this).html().replace('Hide', 'Show'));
        } else {
            menu.slideDown();
            $(this).html($(this).html().replace('Show', 'Hide'));
        }
    });
});

