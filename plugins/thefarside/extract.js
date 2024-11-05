function(page) {
    var regex = /class="tfs-comic__image">\s*<img\s+data-src="([^ "]+)/;
    var match = regex.exec(page);
    return match[1] + ".jpg";
}
