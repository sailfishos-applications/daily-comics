function(page) {
    var regex = /<source[^>]*srcset="([^"]*)"[^>]*type="image\/jpeg">/;
    var match = regex.exec(page);
    // return match[1].replace('&amp;', '&');
    return match[1]
}
