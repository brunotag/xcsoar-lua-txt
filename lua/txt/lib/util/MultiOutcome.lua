local MultiOutcome = {}

local str_utils = require("txt/lib/util/str-utils")

function MultiOutcome:new(o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;

    self.successCount = 0;
    self.errorCount = 0;

    return o;
end

function MultiOutcome:increment_success_count()
    self.successCount = self.successCount + 1
end

function MultiOutcome:increment_error_count()
    self.errorCount = self.errorCount + 1
end

function MultiOutcome:get_outcome_message()
    if self.errorCount == 0 then
        return "OK.";
    elseif self.successCount == 0 then
        return "Error.";
    else
        return (str_utils.interpolate_table("{success_count} OK, {error_count} errors.", self));
    end
end

return MultiOutcome;
