local format_message = {};

local str_utils = require("txt/lib/util/str-utils")

format_message.format_for_google_maps = function (message, position)
    if position.latitude and position.longitude then
        message.locationURL = str_utils.interpolate_table("https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}", position);
    else
        message.locationURL = "| GPS position not available";
    end
    if position.altitude then
        message.altitude = position.altitude;
    else
        message.altitude = "| altitude not available";
    end
    return str_utils.interpolate_table("${glider} ${status} ${altitude} ${locationURL}", message)
end;

format_message.format_simple = function (message, position)
    if position.latitude and position.longitude then
        message.location = str_utils.interpolate_table("LAT:${latitude}, LONG:${longitude}", position);
    else 
        message.location = "| GPS position not available";
    end
    if position.altitude then
        message.altitude = str_utils.interpolate_table(", ALT: ${altitude}", position);
    else
        message.altitude = "| altitude not available";
    end
    return str_utils.interpolate_table("${glider} ${status} ${location} ${altitude}", message)
end;

format_message.format = function(message, position)
    if message.format == "g-maps" then
        return format_message.format_for_google_maps(message, position);
    else
        return format_message.format_simple(message, position);
    end
end;


return format_message;