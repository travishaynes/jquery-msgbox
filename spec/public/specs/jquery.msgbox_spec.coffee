describe "jquery.msgbox", ->
  
  it "should be defined", ->
    expect($.msgbox).not.toEqual undefined
  
  it "should not have a #msgbox div on the page before running $.msgbox", ->
    expect($("#msgbox").length).toEqual 0
  
  it "should create a new div with the id #msgbox", ->
    $.msgbox 'hello', 'world'
    $.msgbox 'close'
    expect($("#msgbox").length).toEqual 1
  
  it "should have created a .ui-dialog class", ->
    expect($(".ui-dialog").length).toEqual 1
  
  it "should default to 'alert' icon", ->
    expect($("#msgbox-icon").hasClass("ui-icon-alert")).toBeTruthy()
  
  it "should change the icon when options.icon is a string", ->
    $.msgbox 'hello', 'world', icon: 'info'
    expect($("#msgbox-icon").hasClass("ui-icon-alert")).toBeFalsy()
    expect($("#msgbox-icon").hasClass("ui-icon-info")).toBeTruthy()
    $.msgbox 'close'
  
  it "should have no icon when options.icon is null", ->
    $.msgbox 'hello','world', icon: null
    $.msgbox 'close'
    expect($("#msgbox-icon").length).toEqual 0
  
  it "should only have one #msgbox div after being reused", ->
    $.msgbox 'hello', 'again'
    expect($("#msgbox").length).toEqual 1
    $.msgbox 'close'
  
  it "should change the title after being reused", ->
    $.msgbox 'first', ''
    expect($(".ui-dialog-title").text()).toEqual 'first'
    $.msgbox 'second', ''
    expect($(".ui-dialog-title").text()).toEqual 'second'
    $.msgbox 'close'
  
  it "should change the contents after being reused", ->
    $.msgbox '', 'first'
    expect($("#msgbox-contents").text()).toEqual 'first'
    $.msgbox '', 'second'
    expect($("#msgbox-contents").text()).toEqual 'second'
    $.msgbox 'close'
