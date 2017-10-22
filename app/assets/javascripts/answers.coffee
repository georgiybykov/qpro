# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('create_answer').on 'click', ->
    question_id = $('#question_id').val()
    answer_body = $('#answer_body').val()
    $.ajax
      type: 'POST'
      url: "/questions/#{question_id}/answers"
      data: { answer: { body: answer_body } }
      dataType: "json"
      success: (data) ->
        $('.answers').append("<a href='' class='list-group-item'>#{answer_body}</a>")

