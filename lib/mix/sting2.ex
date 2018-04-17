defmodule Mix.Tasks.Needle.Sting2 do
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
<link rel="stylesheet" href="https://rebuildfm.freetls.fastly.net/assets/app-5c682d118880a53573f20fa74e5931ff.css">

<div id="container">
	<div id="contents">

		<div class="episode">
			<span class="date">Apr 15 <br />2018</span>
			<h2><a href="/205/">205: Going Postal (N)</a></h2>

			<div class="audio-player player-episode">
				<audio preload="none" controls src="http://cache.rebuild.fm/podcast-ep205.mp3" style="width: 100%; height: 100%;"></audio>
			</div>

			<div class="post">
				<div class="episode-description">
					<p>Naoki Hiroshima さんをゲストに迎えて、YouTube, Facebook, 漫画村、ポッドキャスト、将棋、Netflix などについて話しました。</p>
				</div>
			</div>
		</div>

		<div class="episode">
			<span class="date">Apr 15 <br />2018</span>
			<h2><a href="/205/">205: Going Postal (N)</a></h2>

			<div class="audio-player player-episode">
				<audio preload="none" controls src="http://cache.rebuild.fm/podcast-ep205.mp3" style="width: 100%; height: 100%;"></audio>
			</div>

			<div class="post">
				<div class="episode-description">
					<p>Naoki Hiroshima さんをゲストに迎えて、YouTube, Facebook, 漫画村、ポッドキャスト、将棋、Netflix などについて話しました。</p>
				</div>
			</div>
		</div>

		<div class="episode">
			<span class="date">Apr 15 <br />2018</span>
			<h2><a href="/205/">205: Going Postal (N)</a></h2>

			<div class="audio-player player-episode">
				<audio preload="none" controls src="http://cache.rebuild.fm/podcast-ep205.mp3" style="width: 100%; height: 100%;"></audio>
			</div>

			<div class="post">
				<div class="episode-description">
					<p>Naoki Hiroshima さんをゲストに迎えて、YouTube, Facebook, 漫画村、ポッドキャスト、将棋、Netflix などについて話しました。</p>
				</div>
			</div>
		</div>

	</div>
</div>
	"""
end
