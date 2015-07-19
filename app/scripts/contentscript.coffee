get_favicon = ->
  link = document.getElementsByTagName("head")[0].getElementsByTagName("link")
  l = link.length
  i = (l - 1)

  while i >= 0
    return link[i]  if (/(^|\s)icon(\s|$)/i).test(link[i].getAttribute("rel"))
    i--
  false

favicon_elemnt = get_favicon()
favicon_elemnt.href = 'https://twitter.com/favicons/favicon.ico' # hack

count = 0
favicon= new Favico
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