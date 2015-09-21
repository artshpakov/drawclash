#= require jquery
#= require jquery_ujs
#= require analytics
#= require_tree .


$ ->
  window.DrawClash = window.DrawClash || {}

  DrawClash.like = (condition) ->
    $.post '/likes', condition, (reply) -> window.location.reload()

  DrawClash.dislike = (condition) ->
    $.ajax '/likes',
      type: 'DELETE'
      data: condition,
      success: (reply) -> window.location.reload()



  buildGrid = ($container) ->
    $cards      = $container.children()
    columnCount = $container.data('elaborate-grid')
    index       = 0

    $container.append('<div class="elaborate-grid"></div>')
    $('.elaborate-grid', $container).append('<div class="elaborate-column"></div>') for [0..columnCount-1]
    $('.elaborate-grid .elaborate-column').css({float: 'left', width: "#{100/columnCount}%"})

    $columns = $('.elaborate-grid .elaborate-column')
    for card in $cards
      $columns.eq(index).append(card)
      index = if index is $columns.size()-1 then 0 else index+1


  buildGrid $('[data-elaborate-grid]')
