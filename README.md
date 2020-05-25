# beautify

[![docs](https://img.shields.io/badge/docs-latest-green.svg)](https://daniel-worrall.github.io/beautify/)
[![Build Status](https://travis-ci.org/Daniel-Worrall/beautify.svg?branch=master)](https://travis-ci.org/Daniel-Worrall/beautify)
[![GitHub release](https://img.shields.io/github/release/Daniel-Worrall/beautify.svg)](https://github.com/Daniel-Worrall/beautify/releases)

beautify embeds the [js-beautify](https://github.com/beautify-web/js-beautify) package with [Crystal](http://crystal-lang.org) bindings via [duktape.cr](https://github.com/svaarala/duktape), inspired by [html-minifier](https://github.com/sam0x17/html-minifier).

It can be used to beautify HTML, JS or CSS content.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     beautify:
       github: Daniel-Worrall/beautify
   ```

2. Run `shards install`

## Beautify

```crystal
require "beautify"

Beautify.js(js_content)
Beautify.html(html_content)
Beautify.css(css_content)
```

By default, these run on a single runtime which lazily initialise each beautify package.

Runtimes can be created as needed and called in a similar fashion.

```crystal
require "beautify"

runtime = Beautify::Runtime.new

runtime.js(js_content)
runtime.html(html_content)
runtime.css(css_content)
```

Runtimes are not parallel safe. A mutex around runtime calls are appropriate.

## Contributing

There is a provided [githook](https://githooks.com/) that will check code formatting and specs before commiting. You can run `make init` or `git config core.hooksPath .githooks` to use this.

1. Fork it (<https://github.com/Daniel-Worrall/beautify/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Daniel Worrall](https://github.com/Daniel-Worrall) - creator and maintainer