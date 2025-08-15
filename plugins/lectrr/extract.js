function(page) { 
    var regex = /(https:[^"]+?[lectrr|vakantie][^"]+?\/BASE_WIDTH\/[^"]+?\.jpg)"/g;
    var match = regex.exec(page);
    match = regex.exec(page);
    return match[1];
}
