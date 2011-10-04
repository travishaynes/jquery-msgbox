(function() {
  $.msgbox = function(title, contents, options) {
    var $contents, $icon, $msgbox, dialog_options;
    if (contents === void 0 && options === void 0) {
      return $("#msgbox").dialog(title);
    }
    options = options || {};
    if (options.icon === void 0) {
      options.icon = "alert";
    }
    dialog_options = {
      title: title,
      autoOpen: options.autoOpen || true,
      width: options.width || void 0,
      height: options.height || 200,
      modal: options.modal || true,
      resizable: options.resizable || false,
      buttons: options.buttons || {
        "OK": function() {
          return $.msgbox("close");
        }
      }
    };
    if ($("#msgbox").length === 1) {
      $msgbox = $("#msgbox");
      $contents = $msgbox.find("#msgbox-contents");
    } else {
      $msgbox = $("<div/>");
      $contents = $("<div/>");
      $msgbox.attr("id", "msgbox");
      $contents.attr("id", "msgbox-contents");
    }
    $msgbox.html($contents.html(contents));
    if (options.icon !== null) {
      $icon = $("<span/>");
      $icon.css("float", "left");
      $icon.css("margin", "0 0.5em 0 0");
      $icon.attr("id", "msgbox-icon");
      $icon.attr("class", "ui-icon ui-icon-" + options.icon);
      dialog_options.title = $icon.wrap("<div>").parent().html() + dialog_options.title;
    }
    return $msgbox.dialog(dialog_options);
  };
}).call(this);
