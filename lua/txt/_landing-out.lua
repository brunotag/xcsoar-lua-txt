local txt_engine = require("txt/lib/txt-engine");
local config = require("txt/config");

txt_engine.send({
    message = {
        glider = config.glider,
        status = "landing out",
        format = config.format
    },
    phones = {config.retrieve_phone},
    unit = config.unit,
    gsm_modem_config = config.gsm_modem_config,
});
