class ConvertReportTracker
  constructor: ->
    @bindClickEvents()

  bindClickEvents: ->
    links = @findLinks()

    for link in links
      do (link) =>
        if link.addEventListener
          link.addEventListener 'click', @trackClick, true
        else if link.attachEvent
          link.attachEvent 'onclick', @trackClick

  findLinks: ->
    document.querySelectorAll 'a[data-convert-report-id]'

  trackClick: (e)->
    id = e.target.attributes["data-convert-report-id"]?.value
    return unless id?

    request = new XMLHttpRequest
    request.open "post", "@@PROTOCOL://@@HOST/conversions", false
    request.setRequestHeader "Content-Type", "application/json;charset=UTF-8"
    request.send JSON.stringify { conversion: { tracker_id: id} }

window.onload = (e)->
  new ConvertReportTracker
