function(page) {
    var regex = /&quot;path&quot;:&quot;(\S+ - Zak - De Morgen\.\S+)&quot;/;
    var match = regex.exec(page);
    var path1 = match[1].replace(/\\\//g, '/');
    return "https://admin.presscartoondev.eu/" + path1.replace(/ /g, '%20');
    // return match[1].replace(/&amp;/g, '&');
}
