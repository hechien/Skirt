# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  KEY_ENTER = 13
  BLANK     = 0

  $(document).on 'ajax:success', 'form#respond', (e, data, status, xhr) ->
    $('#url_url').val(data.surl).addClass('surl').select()
    changeStatus('show')

  $('#url_url.surl').keydown -> $(this).select() if event.keyCode is KEY_ENTER

  $('#url_url.surl').keyup -> changeStatus('hide') if $(this).val().length is BLANK

  $('#option').click ->

  $('#clear').click -> changeStatus('hide')

  changeStatus = (status) ->
    if status is 'hide'
      $('#url_url').val('').removeClass('surl')
      $('#clear').addClass('hide')
      $('#option').removeClass('hide')
    else if status is 'show'
      $('#clear').removeClass('hide')
      $('#option').addClass('hide')
      $('#url_url').addClass('surl')