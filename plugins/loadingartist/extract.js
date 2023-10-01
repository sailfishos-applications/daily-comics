function(page) {
    var regex = /<img[^>]+src="(\/comic[^"]+\\.jpg)"/;
    var match = regex.exec(page);
    return match[1];
    // return "https://loadingartist.com" + match[1];
}
