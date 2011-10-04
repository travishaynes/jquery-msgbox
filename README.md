jQuery.msgbox
=============

jQuery.msgbox is a lightweight plugin that simplifies using the jQuery UI
dialog() by creating a #msgbox div, and using some basic default options,
minifying the amount of HTML and scripting necessary to load a basic jQuery UI
dialog box.

All the documentation is in CoffeeScript, but you can easily convert it to
Javascript using the infinitely handy [js2coffee](http://js2coffee.org/).


Overview
--------

A call to

    $.msgbox "Title", "Contents"

will display a dialog with an "OK" button that closes the dialog, and an alert
icon in the title bar.

To use your own buttons:

    $.msgbox "Title", "Contents", buttons: 
      "Yes": (event) ->
        alert "You pressed Yes."
        $.msgbox "close"
      "No": (event) ->
        alert "You pressed No."
        $.msgbox "close"

Once msgbox has been initialized, you can reopen it without any changes by
making a call to

    $.msgbox()

and you can close it by calling

    $.msgbox "close"


Options
-------

Here are the default $.msgbox options:

    $.msgbox "Title", "Contents", 
      icon      : "alert"
      autoOpen  : true
      width     : undefined
      height    : 200
      modal     : true
      resizable : false
      buttons   : "OK": -> $.msgbox "close"

The icon can be any of the [jQuery UI CSS Framework icons](http://jqueryui.com/themeroller#icons).
The most commonly used for dialogs are

* alert
* info
* notice
* help

To hide the icon completely, set the icon option to null

    $.msgbox "Title", "Contents", icon: null

### Passing Additional jQueryUI Dialog Options

The options listed above are the only ones $.msgbox will recognize when you
first create it. After it has been initialized, however, you can pass any
additional jQueryUI Dialog options to $.msgbox by sending them as the first
parameter. For example:

    # Create the dialog; disabling autoOpen so we can
    # apply our changes before showing the dialog
    $.msgbox "Title", "Contents", autoOpen: false
    # Adjust width, height, and disable dragging
    $.msgbox
      width: 1000
      height: 500
      draggable: false
    # Show the dialog
    $.msgbox()

See [jQuery.dialog() Options](http://jqueryui.com/demos/dialog/#options)


Events
------

See [jQuery.dialog() Events](http://jqueryui.com/demos/dialog/#events).


Methods
-------

See [jQuery.dialog() Methods](http://jqueryui.com/demos/dialog/#methods).


Theming
-------

The jQuery.msgbox plugin uses the jQuery UI CSS Framework. The dialog itself has
the id "msgbox", the icon in the title bar has the id "msgbox-icon", and the
contents div has the id "msgbox-contents".

See [jQuery.dialog() Theming](http://jqueryui.com/demos/dialog/#theming).


Testing
-------

This library is tested with [Jasmine](http://pivotal.github.com/jasmine/). All
the tests are written in CoffeeScript. The specs for jquery.msgbox are in
[spec/public/specs/jquery.msgbox_spec.coffee](https://github.com/travishaynes/jquery-msgbox/blob/master/spec/public/specs/jquery.msgbox_spec.coffee).

To run the tests you will need a web server to serve files from that directory,
since CoffeeScript uses XHR to load the scripts, which cannot be done over a
local filesystem for security reasons.

I personally use [Passenger](http://www.modrails.com/install.html). It's easy to
install and use. Just run

    gem install passenger

And then navigate into the spec path, and run

    passenger start

Then point your browser to http://localhost:3000 to run the tests.


Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_jquery.msgbox`)
3. Commit your changes (`git commit -am "added some features"`)
4. Push to the branch (`git push origin my_jquery.msgbox`)
5. Create a Pull Request
