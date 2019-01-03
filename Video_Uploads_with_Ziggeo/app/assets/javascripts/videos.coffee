jQuery(document).on 'turbolinks:load', ->
  $('#video_title').keyup ->
    console.log($(this).val())

  ZiggeoApi.Events.on "submitted", ( data ) -> window.location.href = '/'

  ZiggeoApi.Events.on "upload_progress", ( uploaded, total, data ) ->
    $('progress').removeClass('hidden-xs-up').attr 'value', (uploaded / total) * 100