local send_txt_location = {}

local xcsoar_utils = require("txt/lib/util/xcsoar-utils")
local GsmModemClient = require("txt/lib/internals/GsmModemClient")
local format_message = require("txt/lib/internals/format-message")

send_txt_location.send = function(options)
    local position = xcsoar_utils.get_position(options.unit);

    local formattedMessage = format_message.format(options.message, position);

    local gsm_modem_options = {
        config = options.gsm_modem_config,
        phone = options.phone,
    };
    local client = GsmModemClient:new(nil, gsm_modem_options);
    local outcome = client:send_message(formattedMessage);

    xcsoar_utils.msg_box(outcome)
end

return send_txt_location;
