jQuery(document).on 'turbolinks:load', ->
  addresses = $('#addresses')
  count = addresses.find('.count > span')

  recount = -> count.text addresses.find('.nested-fields').size()

  addresses.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)

  addresses.on 'cocoon:after-insert', (e, added_el) ->
    added_el.effect('highlight', {}, 500)
    recount()

  addresses.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)

  addresses.on 'cocoon:after-remove', (e, removed_el) ->
    recount()
