function(page) {
    var regex = /<a\sclass="ga-tracking\sjs-episode\s+"(.|\s)+?href="([^"]+)"/
    var match = regex.exec(page);
    var url = "https://tapas.io" + match[2]
    var xhr = new XMLHttpRequest();
    xhr.open("GET", url , false);
    xhr.send(null);
    if(xhr.status === 200)
    {
        var newPage = xhr.responseText;
        var regex2 = /<img\s*src="([^"]*)"\sclass="content__img"/
        var match2 = regex2.exec(newPage);
        return match2[1];
    }
}
