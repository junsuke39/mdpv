# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $window = $(window)
  $main = $('div.main-area')
  adjustHeight = ->
    $main.css('height', $window.height() - $main.position().top - 15)
  $window.on('resize', adjustHeight)
  adjustHeight()

$ ->
  $form = $('#input-form')
  $text = $('#text')
  $preview = $('div.markdown')
  val = $text.val()
  wait = false
  next = false

  $form.bind 'ajax:success', (e, data)->
    $last = $preview.find('>:last-child')
    scrollBottom = false
    if $last && $last.offset()
      scrollBottom = ($last.offset().top - $preview.offset().top + $last.outerHeight()) <= $preview.height()
    $preview.html data
    if scrollBottom
      $preview.scrollTop($preview.scrollTop() + 500)

  $form.bind 'ajax:complete', ()->
    wait = false
    if next
      next = false
      wait = true
      $form.submit()

  $text.on 'change keyup', ->
    if $text.val() != val
      val = $text.val()
      if wait
        next = true
      else
        wait = true
        $form.submit()

  wait = true
  $form.submit()

