function(page) {
    var regex = /<img[^>]+srcset="(\/\/[^ "]+)/;
    var match = regex.exec(page);
    return "https:" + match[1];
}
