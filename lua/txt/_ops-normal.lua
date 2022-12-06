local send_txt_location = require("txt/lib/txt-engine");
local config = require("txt/config");

send_txt_location.send({
    message = {
        glider = config.glider,
        status = "ops normal",
        format = config.format
    },
    phone = config.opsnormal_phone,
    unit = config.unit,
    gsm_modem_config = config.gsm_modem_config,
});
