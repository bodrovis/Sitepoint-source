template = (item) -> item.text

jQuery(document).on 'turbolinks:load', ->
  $('#city').select2
    ajax: {
      url: 'http://ws.geonames.org/searchJSON'
      data: (params) ->
        {
          name: params.term,
          username: 'freelancede',
          featureClass: 'p',
          cities: 'cities1000'
        }
      dataType: 'json'
      delay: 500
      processResults: (data, params) ->
        {
          results: _.map(data.geonames, (el) ->
            name = el.name + ' (' + el.adminName1 + ', ' + el.countryName + ')'
            {
              text: name
              id: name
            }
          )
        }
      cache: true
    }
    escapeMarkup: (markup) -> markup
    minimumInputLength: 2
    templateResult: template
    templateSelection: template