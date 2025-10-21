function(page) {
    // Thanks to Matti K. for giving me pointers to the api interface!
    var regex = /"url":\s*"([^"]+)/;
    var match = regex.exec(page);
    var url = match[1];
    return url.replace("WIDTH.EXT","1920.jpg");
}
