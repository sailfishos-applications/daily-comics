function(page) {
    var regex = /<img[^>]+src="*(\/comic\/[^ "]+)/;
    var match = regex.exec(page);
    return "https://loadingartist.com" + match[2];
}
