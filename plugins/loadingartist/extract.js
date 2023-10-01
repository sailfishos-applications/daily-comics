function(page) {
    var regex = /<img[^>]+src="(\/comic[^"]+\\.jpg)"/;
    var match = regex.exec(page);
    return "https://loadingartist.com" + match[1];
}
