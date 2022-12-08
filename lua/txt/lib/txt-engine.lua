local txt_engine = {}

local xcsoar_utils = require("txt/lib/util/xcsoar-utils")
local GsmModemClient = require("txt/lib/internals/GsmModemClient")
local format_message = require("txt/lib/internals/format-message")
local MultiOutcome = require("txt/lib/util/MultiOutcome")

txt_engine.send = function(options)
    local position = xcsoar_utils.get_position(options.unit);
    local formattedMessage = format_message.format(options.message, position);

    local outcome = MultiOutcome:new(nil);
    for index,value in ipairs(options.phones) do
        local gsm_modem_options = {
            config = options.gsm_modem_config,
            phone = value,
        };
        local client = GsmModemClient:new(nil, gsm_modem_options);
        local clientOutcome = client:send_message(formattedMessage).outcome;
        if clientOutcome == "ok" then
            outcome:increment_success_count()
        else
            outcome:increment_error_count()
        end
    end

    xcsoar_utils.msg_box(outcome:get_outcome_message());
end

return txt_engine;
