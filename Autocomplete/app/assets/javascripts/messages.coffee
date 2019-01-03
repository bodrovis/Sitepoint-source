jQuery(document).on 'turbolinks:load', ->
  $('#to').select2
    ajax: {
      url: '/users'
      data: (params) ->
        {
          term: params.term
        }
      dataType: 'json'
      delay: 500
      processResults: (data, params) ->
        {
          results: _.map(data, (el) ->
            {
              name_highlight: el.full_name
              id: el.id
              name: "#{el.surname}, #{el.name}"
            }
          )
        }
      cache: true
    }
    escapeMarkup: (markup) -> markup
    minimumInputLength: 2
    templateResult: (item) -> item.name_highlight
    templateSelection: (item) -> item.name