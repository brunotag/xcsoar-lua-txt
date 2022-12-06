local str_utils = {};

str_utils.interpolate_table = function(s, tab)
    return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end

return str_utils;
