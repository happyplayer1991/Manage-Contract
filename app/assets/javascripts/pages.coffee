# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
    url = 
    
    type = $("select.change-action").data('user-type')
    $("select.change-action").on "change", (event) ->
        url = $(this).val()
        # check url contain 'suspend' or 'delete'
        if /suspend/.test url
            $("#action-confirm-model .modal-body h5").text('Are you going to suspend this ' + type + ' ?')
            # disable bootstrap modal outside close
            $("#action-confirm-model").modal({backdrop: 'static', keyboard: false})
        else if /delete/.test url
            $("#action-confirm-model .modal-body h5").text('Are you going to delete this ' + type + ' ?')
            $("#action-confirm-model").modal({backdrop: 'static', keyboard: false})

    $(".action-confirm-yes").on "click", (event) ->
        event.preventDefault()
        $.get(url)

    $(".action-confirm-no").on "click", (event) ->
        $("select.change-action").val("")
        # location.reload()
        

        