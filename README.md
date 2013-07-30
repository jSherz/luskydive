Boilerplate Project Code
=====================

Description goes here!

Project Layout
================

* config.rb - Compass configuration file
* README.md - Project description
* manage.py - Django project manage script
* boilerplate/ - Django main folder
    * settings_base.py - Base settings
    * settings_dev.py - Development machine settings
	* settings_prod.py - Production machine settings
    * urls.py - Django routing
    * wsgi.py - WSGI server file
* collected-static/ - Collected static file (output of ./manage.py collectstatic)
* media/ - User-uploaded content
* sass/ - Raw sass stylesheets
    * functions/ - Gumby functions (mixins)
    * mixins/ - Additional Gumby mixins
    * ui/ - Gumby UI styling
    * var/ - Gumby variables
    * _base.scss - Includes all Gumby
    * _custom.scss - Location for __our custom styles__
    * _fonts.scss - Font configuration
    * _grid.scss - Grid styling
    * ie.scss - IE only stylesheet
    * print.scss - Print stylesheet
    * screen.scss - Main stylesheet (compiles all others)
    * _typography.scss - Typography styling
* static/ - Static files
    * stylesheets/ - Compiles sass
    * fonts/ - Local font files (e.g. icon fonts)
    * images/ - Image files
    * javascripts/ - JavaScripts
        * libs/ - Third party produced JS (e.g. modernizr)
            * gumby.js - Raw Gumby JavaScript
            * gumby.min.js - Minified version
            * jquery-*.js - Local jQuery incase CDN fails
            * modernizr-*.js - Modernizr
            * ui/ - UI components
        * main.js - Our JavaScript
        * plugins.js - JS plugins
    * apple-touch-icon.png - Apple iPod / iPad icon
    * apple-touch-icon-precomposed.png - Apple iPod / iPad icon
    * facebook.jpg - Social media image
    * favicon.png - Fav icon for browser tab
    * humans.txt - About the team
