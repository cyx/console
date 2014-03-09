-- module specific helper functions
local dump, dump_table, dump_dict, dump_array

-- @module console
local console = {}

-- @example:
--
--     console.log('hello')
--     console.log({ 'a', 'b', 'c' })
--     console.log({ c = 'd', e = 'f' })
--
function console.log(obj)
    io.write(dump(obj), "\n\n")
end

function dump(obj)
    local _type = type(obj)

    if _type == "table" then
        return dump_table(obj)
    else
        return tostring(obj)
    end
end

function dump_table(obj)
    -- let's favor speed over accuracy, given that
    -- this is mainly for debugging anyway.
    --
    -- we rely on the fact that a dictionary typically
    -- has string keys, and hence will yield a size of 0.
    if #obj == 0 then
        return dump_dict(obj)
    else
        return dump_array(obj)
    end
end

function dump_dict(dict)
    local ret = {}

    for k,v in pairs(dict) do
        table.insert(ret, string.format('["%s"] = %s', k, dump(v)))
    end

    return table.concat(ret, "\n")
end

function dump_array(array)
    local ret = {}

    for i,v in ipairs(array) do
        table.insert(ret, string.format('%d) %s', i, dump(v)))
    end

    return table.concat(ret, "\n")
end

return console
