flashMessagesFunctions = () ->

  observerConfig = {
    childList: true
  }

  clearFlashMessages = () ->
    setTimeout( ()->
      $('.flash-messages').addClass('fadeOut')
    , 3000)
    setTimeout( ()->
      $('#flash-messages-container').html("")
    , 5000)

  flashMessagesObserver = new MutationObserver () ->
    clearFlashMessages()

  flashMessagesObserver.observe( $('#flash-messages-container')[0], observerConfig)

  if $('.flash-messages').length > 0
    clearFlashMessages()

$(document).on 'turbolinks:load', flashMessagesFunctions
