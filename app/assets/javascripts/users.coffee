# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
bind_ajax = () ->
  $("#login_btn").unbind("click").click ->
    $.ajax
      type: "post"
      url: "/login"
      data: {
        username: $("#username_input").val(),
        password: $("#password_input").val()
      }
      dataType: "json"
      success: (data, status) ->'' +
        if data["error_code"] is -4
          alert "Invalid username and password combination. Please try again."
        else
          location.reload()
        
  $("#signup_btn").unbind("click").click ->
    $.ajax
      type: "post"
      url: "/signup"
      data: {
        username: $("#username_input").val(),
        password: $("#password_input").val()
      }
      dataType: "json"
      success: (data, status) ->
        if data["error_code"] is -1
          alert "The user name should be 5~20 characters long. Please try again."
        else if data["error_code"] is -2
          alert "The password should be 8~20 characters long. Please try again."
        else if data["error_code"] is -3
          alert "This user name already exists. Please try again."
        else
          location.reload()

$ -> bind_ajax()
$(window).bind "page:change", bind_ajax