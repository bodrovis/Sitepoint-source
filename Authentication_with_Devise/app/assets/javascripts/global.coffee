jQuery ->
  displayHint = (strength, crack_time) ->
    msg = 'Password is ' + strength + ' (time to break it: ' + crack_time + ')'

    estimate_message = this.next('.estimate-message')
    if estimate_message.length > 0
      estimate_message.text msg
    else
      this.after '<span class="help-block estimate-message">' + msg + '</span>'

  $('form').on 'keyup', '.estimate-password', ->
    $this = $(this)
    estimation = zxcvbn($this.val())
    crack_time = estimation.crack_time_display

    switch estimation.score
      when 0 then displayHint.call($this, "very weak", crack_time)
      when 1 then displayHint.call($this, "weak", crack_time)
      when 2 then displayHint.call($this, "okay", crack_time)
      when 3 then displayHint.call($this, "strong", crack_time)
      when 4 then displayHint.call($this, "very strong", crack_time)

  return