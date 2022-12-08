local txt_engine = require("txt/lib/txt-engine");
local config = require("txt/config");

txt_engine.send({
    message = {
        glider = config.glider,
        status = "ops normal",
        format = config.format
    },
    phones = {
        config.opsnormal_phone,
        config.friend_you_like_to_brag_with_phone,
        config.retrieve_phone
    },
    unit = config.unit,
    gsm_modem_config = config.gsm_modem_config,
});
