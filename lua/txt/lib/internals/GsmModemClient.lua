local str_utils = require("txt/lib/util/str-utils")
local url_utils = require("txt/lib/util/url-utils")
local json = require("txt/lib/util/json")

local GsmModemClient = {};

function GsmModemClient:new(o, options)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;

    local config = options.config;

    local requestObject = {
        phone = options.phone;
        path = "SendSMS",
        ip = config.ip,
        port = config.port,
        username = config.username,
        password = config.password
    }

    self.requestObject = requestObject;

    return o;
end

function GsmModemClient:send_message(message)
    local reqObject = self.requestObject;
    reqObject.message = url_utils.encode(message);
    local request = xcsoar.http.Request:new(
        str_utils.interpolate_table("http://${ip}:${port}/${path}?username=${username}&password=${password}&phone=${phone}&message=${message}", reqObject)
    );
    local httpResponse = request:perform()
    local response = json.decode(httpResponse.body);
    local status = tonumber(response.status);
    if      status <= 199 then return "Informational?! Something is wrong."
    elseif  status <= 299 then return "OK, message sent."
    elseif  status <= 399 then return "Redirection?! Something is wrong."
    elseif  status <= 499 then return "Client Error. Check phone config."
    elseif  status <= 599 then return "Server Error. Check phone config."
    end
end

return GsmModemClient;