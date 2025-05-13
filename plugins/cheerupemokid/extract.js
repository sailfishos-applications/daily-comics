function(page) {
    var regex = /"url":"(https:\/\/featureassets.gocomics.com\/[^" ?]+)/;
    var match = regex.exec(page);
    return match[1];
}
