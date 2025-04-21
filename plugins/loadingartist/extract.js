function(page) {
    var regex = /class=main-image-container.*<img[^>]+src=["']?(\/comic\/[^ "']+)/;
    var match = regex.exec(page);
    return "https://loadingartist.com" + match[1];
}
