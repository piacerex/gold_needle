defmodule Mix.Tasks.Needle.Sting do
	use Mix.Task
	import Mix.Generator

	@shortdoc "Replace templates/page/index.html.eex to SPA page"

	def run( _args ) do
		file_app_module = Mix.Project.config[ :app ] |> Atom.to_string
		# elixir_app_module = file_app_module |> Macro.camelize
		create_file Path.join( [ "lib", file_app_module <> "_web", "templates", "page", "index.html.eex" ] )
			|> Path.relative_to( Mix.Project.app_path ), 
			spa_template( app_module: file_app_module )
	end

	embed_template :spa, """
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.13/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<div class="row" id="view">
	<div class="columns large-8">
		<input type="text" v-model="query" @keydown.enter="myClickHandler" placeholder="文字列を入れてEnterキーを押すとQiitaを検索します">
	</div>
	<div class="columns large-4">
		<button class="button round" v-on:click="myClickHandler">送信</button>
	</div>
	<div>
	<p>Qiitaを検索： {{ query }}</p>
	</div>

	<div class="columns large-4" v-for="result in TopResults">
		<div class="card">
			<div class="card-divider">{{ result.title }}</div>
			<div class="card-section"><a v-bind:href="result.url" target="_blank">{{ result.url }}</a></div>
		</div>
	</div>
</div>

<script>
var myViewModel = new Vue
(
	{
		el: '#view',
		data: 
		{
			query: '', 
			results: []
		}, 
		computed: 
		{
			TopResults: function()
			{
				return this.results.slice( 0, 9 );
			}
		}, 
		methods: 
		{
			myClickHandler: function( dummy )
			{
				axios.get( "https://qiita.com/api/v2/items?query=" + this.query )
				.then( response => { this.results = response.data } )
			}
		}
	}
);
</script>
	"""
end
