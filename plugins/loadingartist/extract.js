function(page) {
    var regex = /<img[^>]+src="*(\/comic\/[^ "]+)/;
    var match = regex.exec(page);
    return match[2];
    // return "https://loadingartist.com" + match[1];
}
