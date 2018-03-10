defmodule Mix.Tasks.Needle.Sting do
	use Mix.Task

	@shortdoc "Create SPA pages"

	def run( _args ) do
		Mix.Project.config[ :app ] |> Atom.to_string |> Macro.camelize
#		args |> IO.inspect
	end
end
