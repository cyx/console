local console = require("console")

io = {
	write = function (...)
		local capture = ""

		for _,v in ipairs{...} do
			capture = capture .. v
		end

		return capture
	end
}

-- case 1: array with sub arrays
local out = console.log({'a', 'b', {'c', 'd'}})
assert(out == '{a, b, {c, d}}\n')

-- case 2: dict with sub dicts
local out = console.log({a = {b = {c = { d = 'e'}}}})
assert(out == '{["a"] = {["b"] = {["c"] = {["d"] = e}}}}\n')

-- case 3: string
local out = console.log('hello')
assert(out == 'hello\n')

-- case 4: number
local out = console.log(1)
assert(out == '1\n')

print('All tests passed.')
