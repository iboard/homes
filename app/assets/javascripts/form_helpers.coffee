jQuery ->

  $('form').on 'click', '.add-fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before(($(this).data('fields').replace(regexp, time)))
    event.preventDefault()
  
  $('form').on 'click', '.remove-fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()
