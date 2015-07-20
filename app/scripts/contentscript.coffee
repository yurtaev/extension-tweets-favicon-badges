# hack
# Uncaught SecurityError: Failed to execute 'toDataURL' on 'HTMLCanvasElement': tainted canvases may not be exported.

favicon_element = document.querySelector('link[rel="shortcut icon"]')

if favicon_element
  favicon_element.href = 'https://twitter.com/favicons/favicon.ico'


count = 0
window.favicon= new Favico
  animation: 'popFade'

update_count = ->
  bar = document.querySelector('.js-new-tweets-bar')
  if bar
    data = bar.dataset
    new_count = parseInt(data.itemCount, 10)
  else
    new_count = 0

  unless count == new_count
    count = new_count
    favicon.badge(count)

setInterval(update_count, 1000)
