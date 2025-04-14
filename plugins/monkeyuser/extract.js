function(page) {
    var regex = /<img [^>]*src=(\/\d{4}\/[^ >]+)/;
    var match = regex.exec(page);
    return match[1];
}
