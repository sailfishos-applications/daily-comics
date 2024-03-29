function(page) {
    var regex = /<img[^>]*src="(https://assets.amuniversal.com/[^"]*)"/;
    var match = regex.exec(page);
    return match[1];
}
