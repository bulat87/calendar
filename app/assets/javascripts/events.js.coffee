# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#event_event_start').datepicker
    dateFormat: 'dd-mm-yy'
  $('#event_event_end').datepicker
    dateFormat: 'dd-mm-yy'
