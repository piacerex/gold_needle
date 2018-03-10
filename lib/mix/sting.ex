defmodule Mix.Tasks.Needle.Sting do
	use Mix.Task
	import Mix.Generator

	@shortdoc "Create SPA pages"

	def run( _args ) do
		file_app_module = Mix.Project.config[ :app ] |> Atom.to_string
		elixir_app_module = file_app_module |> Macro.camelize
		create_file Path.join( [ "lib", file_app_module <> "_web", "templates", "page", "spa.html.eex" ] )
			|> Path.relative_to( Mix.Project.app_path ), 
			spa_template( app_module: file_app_module )
	end

	embed_template :spa, """
	<h1>This is SPA page</h1>
	"""
end
