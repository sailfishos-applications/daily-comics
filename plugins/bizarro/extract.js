function(page) {
    var regex = /"assets":\s*{\s*"featured":\s*{\s*"url":\s*"([^ "]+)/;
    var match = regex.exec(page);
    return match[1];
}
