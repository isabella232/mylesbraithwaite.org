# coffeelint: disable=max_line_length

#= require jquery
#= require iconic

#= require analytics

$(document).ready ->
  GoogleAnalytics.init 'UA-1642439-40'
  
  if MylesLabPageDetails.date
    date_year = MylesLabPageDetails.date.substring(0, 4)
    date_month = MylesLabPageDetails.date.substring(0, 7)
    date_day = MylesLabPageDetails.date.substring(0, 10)
    
    GoogleAnalytics.trackEvent 'year', date_year, 'Year'
  
  if MylesLabPageDetails.tags
    for tag in MylesLabPageDetails.tags
      GoogleAnalytics.trackEvent 'tag', tag, 'Tag'
  
  if MylesLabPageDetails.category
    for category in MylesLabPageDetails.category
      title = ''
      if category.short
        title = category.short
      else
        title = category.title
      GoogleAnalytics.trackEvent category.slug, category.slug, title
  
  menuToggle = $('#js-mobile-menu').unbind()
  
  $('#js-navigation-menu').removeClass 'show'
  
  $("#js-elsewhere-menu").removeClass 'show'
  
  menuToggle.on 'click', (e) ->
    e.preventDefault()
    $('#js-navigation-menu').slideToggle ->
      if $('#js-navigation-menu').is(':hidden')
        $('#js-navigation-menu').removeAttr 'style'
      if $("#js-elsewhere-menu").is(':hidden')
        $("#js-elsewhere-menu").removeAttr 'style'
      return
    return
  
  $('.demo-link').on 'click', ->
    window.open $(this).attr('href'), $(this).attr('title'), 'width=800,height=600,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0'
    return false
  
  return
