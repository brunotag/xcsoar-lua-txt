local xcsoar_utils = {}

xcsoar_utils.get_position = function(unit)
    local position = {};
    if xcsoar.blackboard.location then
        position.longitude = xcsoar.blackboard.location.longitude;
        position.latitude = xcsoar.blackboard.location.latitude;
    else
        xcsoar_utils.msg_box("!! NO GPS POSITION !!");
    end

    if xcsoar.blackboard.altitude then
        if unit == "metric" then
            position.altitude = math.floor(xcsoar.blackboard.altitude) .. "m";
        else
            position.altitude = math.floor(xcsoar.blackboard.altitude * 3.28084) .. "ft";
        end
    else
        xcsoar_utils.msg_box("!! NO ALTITUDE !!");
    end

    return position;
end

xcsoar_utils.msg_box = function (message)
    xcsoar.fire_legacy_event("StatusMessage", message);
end

return xcsoar_utils;