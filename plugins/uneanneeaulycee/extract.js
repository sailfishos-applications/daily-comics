function(page) {
    var regex = /class=["']?wp-block-image.*<img[^>]*src=["']?([^ "']*)/;
    var match = regex.exec(page);
    return match[1];
}
