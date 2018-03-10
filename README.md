# GooldNeedle

[GooldNeedle](https://hex.pm/packages/gold_needle) is a Various web page generator in Phoenix(Elixir Web Framework).

## Installation

Create Phoenix Project. Here is an example:

```
# mix phx.new sample
# cd sample
```

Add to your ```mix.exs``` file:

```elixir
def deps do
  [
    { :gold_needle, "~> 0.0.2" }
  ]
end
```

Then Replace index.html.eex to SPA and execute Phoenix.

```
# mix compile
# mix needle.sting
* creating lib/hoge_web/templates/page/index.html.eex
lib/hoge_web/templates/page/index.html.eex already exists, overwrite? [Yn] Y
# mix phx.server
```

Let's browse at the http://localhost:4000

## License
This project is licensed under the terms of the Apache 2.0 license, see LICENSE.
