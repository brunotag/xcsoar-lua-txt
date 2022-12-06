local send_txt_location = require("txt/lib/txt-engine");
local config = require("txt/config");

send_txt_location.send({
    message = {
        glider = config.glider,
        status = "landing out",
        format = config.format
    },
    phone = config.retrieve_phone,
    unit = config.unit,
    gsm_modem_config = config.gsm_modem_config,
});
