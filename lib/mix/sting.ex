defmodule Mix.Tasks.Needle.Sting do
	use Mix.Task
	require Mix.Generator

	@shortdoc "Replace templates/page/index.html.eex to SPA page"

	def run( _args ) do
		file_app_module = Mix.Project.config[ :app ] |> Atom.to_string
		# elixir_app_module = file_app_module |> Macro.camelize
		Mix.Generator.create_file( 
			Path.join( [ "lib", file_app_module <> "_web", "templates", "page", "index.html.eex" ] ) |> Path.relative_to( Mix.Project.app_path ), 
			spa_text )
	end

	Mix.Generator.embed_text( :spa, from_file: "priv/templates/qiita_search.html.eex" )
end
