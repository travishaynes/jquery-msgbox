# jQuery message box plugin
# @author Travis Haynes <travis.j.haynes@gmail.com>
# @homepage https://github.com/travishaynes/jquery.msgbox

$.msgbox = (title, contents, options) ->
  # if contents and options are left undefined, title becomes the jQuery.dialog
  # options
  if contents == undefined && options == undefined
    return $("#msgbox").dialog(title)
  
  # force options to be an object
  options = options || {}
  
  # default options
  options.icon = options.icon || "alert"
  
  # default dialog options
  dialog_options = 
    title     : title
    autoOpen  : options.autoOpen  || true
    width     : options.width     || undefined
    height    : options.height    || 200
    modal     : options.modal     || true
    resizable : options.resizable || false
    buttons   : options.buttons   || { "OK": () -> $.msgbox "close" }
  
  # if msgbox already exists, use it, and rebuild its html
  if $("#msgbox").length == 1
    $msgbox   = $("#msgbox")
    $contents = $msgbox.find("#msgbox-contents")
  else
    # no msgbox found, create a new one
    $msgbox   = $("<div/>")
    $contents = $("<div/>")
    
    $msgbox.attr    "id", "msgbox"
    $contents.attr  "id", "msgbox-contents"
    
    $contents.html  contents
  
  # update the contents  
  $msgbox.html $contents
  
  # create the icon
  if options.icon
    $icon = $("<span/>")
    $icon.css   "float",    "left"
    $icon.css   "margin",   "0 0.5em 0 0"
    $icon.attr  "id",       "msgbox-icon"
    $icon.attr  "class",    "ui-icon ui-icon-" + options.icon
    dialog_options.title = $icon[0].outerHTML + dialog_options.title
  
  ## display msgbox
  $msgbox.dialog dialog_options
