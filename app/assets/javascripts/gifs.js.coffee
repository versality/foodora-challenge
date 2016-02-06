$(document).on 'page:change', ->
  $gifsSearch = $("form.gifs-search")
  $gifsList   = $(".gifs-list")
  $gifsSave   = $("form.gifs-save")
  $errorArea  = $(".error")

  # Searching mechanism
  do ->
    $gifsSearch.on "ajax:success", (e, data, status, xhr) ->
      $gifsList.append xhr.responseText

    $gifsSearch.on "ajax:error", (e, xhr, status, error) ->
      $gifsSearch.append "<p class='error'>Oops, something went wrong.</p>"

    $gifsSearch.on "ajax:send", ->
      $gifsList.empty()
      $errorArea.remove()

  # Tagging mechanism
  do ->
    $gifsList.on "ajax:success", $gifsSave, (e, data, status, xhr) ->
      $(e.target).html('<h1>Yay! Success!</h1>')

    $gifsList.on "ajax:error", $gifsSave, (e, xhr, status, error) ->
      $(e.target).html('<h1>Huh? Already added!</h1>')
