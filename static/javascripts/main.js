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

    var bg = $('#background');
    var bg_swap = $('#background-swap');

    // Place bg in front of bg_swap
    //bg.css('z-index', '-10');
    //bg_swap.css('z-index', '-11');

    var images = [
        '/static/images/backgrounds/wingsuitrodeo.jpg',
        '/static/images/backgrounds/tonguesout.jpg',
        '/static/images/backgrounds/tube.jpg',
        '/static/images/backgrounds/woahhhh.jpg',
        '/static/images/backgrounds/canopy.jpg',
        '/static/images/backgrounds/wingsuitback.jpg',
    ];

    var current_image = 0;

    function swap_it_bro(active, make_active, next_image) {
        // Hide and load the new one
        active.css('z-index', -9).removeClass('activebg').fadeOut(4000);
        make_active.show().css('z-index', -10).css('background-image', 'url(' + next_image + ')').addClass('activebg');
    }

    function swap_backgrounds() {
        // Next image
        current_image++;
        if (current_image == images.length) {
            current_image = 0;
        }

        console.log('Next image is ' + images[current_image]);

        // Load the new image
        var loader = new Image();

        loader.onload = function () {
            console.log('Image loaded.');

            if (bg.hasClass('activebg')) {
                console.log('bg is active');

                swap_it_bro(bg, bg_swap, images[current_image]);
            } else {
                console.log('bg_swap is active');

                swap_it_bro(bg_swap, bg, images[current_image]);
            }
        }

        loader.src = images[current_image];
        $.cookie('last-bg', current_image);
    }

    setInterval(swap_backgrounds, 7000);

    // Load last seen BG
    var last_bg = $.cookie('last-bg');
    if (last_bg != undefined) {
        last_bg = parseInt(last_bg);

        if (!isNaN(last_bg) && last_bg >= 0 && last_bg <= images.length) {
            current_image = last_bg;

            // Update CSS
            $('#background').css('background', 'url(' + images[current_image] + ')');
        }
    }
});

