(function() {
  var count, favicon, favicon_elemnt, get_favicon, update_count;

  get_favicon = function() {
    var i, l, link;
    link = document.getElementsByTagName("head")[0].getElementsByTagName("link");
    l = link.length;
    i = l - 1;
    while (i >= 0) {
      if (/(^|\s)icon(\s|$)/i.test(link[i].getAttribute("rel"))) {
        return link[i];
      }
      i--;
    }
    return false;
  };

  favicon_elemnt = get_favicon();

  favicon_elemnt.href = 'https://twitter.com/favicons/favicon.ico';

  count = 0;

  favicon = new Favico({
    animation: 'popFade'
  });

  update_count = function() {
    var bar, data, new_count;
    bar = document.querySelector('.js-new-tweets-bar');
    if (bar) {
      data = bar.dataset;
      new_count = parseInt(data.itemCount, 10);
    } else {
      new_count = 0;
    }
    if (count !== new_count) {
      count = new_count;
      return favicon.badge(count);
    }
  };

  setInterval(update_count, 1000);

}).call(this);
