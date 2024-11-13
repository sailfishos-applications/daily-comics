function(page) {
    var regex = /<img\s+src="\/([^ "]+\.jpg)"\s+alt="Comic Strip"/;
    var match = regex.exec(page);
    return "https://www.kevinandkell.com/" + match[1];
}
