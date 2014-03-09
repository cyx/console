console
=======

A little utility library for doing the best debugging strategy
of all: _print debugging_!

## Usage

```lua

local console = require("console")

console.log('hello')
-- hello

console.log({ 'a', 'b' })
-- 1) a
-- 2) b

console.log({ a = 'b', c = 'd' })
-- ["a"] = b
-- ["c"] = d
```

## License

MIT
