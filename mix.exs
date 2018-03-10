defmodule GoldNeedle.Mixfile do
  use Mix.Project

  def project do
    [
      app: :gold_needle,
      version: "0.0.2",
      elixir: "~> 1.5",
		description: "Various web page generator in Phoenix(Elixir Web Framework) ", 
		package: 
		[
			maintainers: [ "piacere-ex" ], 
			licenses:    [ "Apache 2.0" ], 
			links:       %{ "GitHub" => "https://github.com/piacere-ex/gold_needle" }, 
		],
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
	defp deps do
		[
			{ :ex_doc,              "~> 0.18.1", only: :dev, runtime: false }, 
			{ :earmark,             "~> 1.2.4",  only: :dev }, 
			{ :power_assert,        "~> 0.1.1",  only: :test }, 
			{ :mix_test_watch,      "~> 0.5.0",  only: :dev, runtime: false }, 
			{ :dialyxir,            "~> 0.5.1",  only: :dev }, 
		]
	end
end
