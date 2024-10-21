defmodule Servidor do		
	@index ["<!DOCTYPE html>",
		"<html>",
		"<head>"
		"	<title>Oi</title>",
		"<meta charset=\"utf-8\"/>",
		"</head>",
		"<body>",
		"<h1>Olá</h1>",
		"</body>",
		"</html>"]
		
	@pag404 ["<!DOCTYPE html>",
		"<html>",
		"<head>"
		"	<title>Não encontrado</title>",
		"<meta charset=\"utf-8\"/>",
		"</head>",
		"<body>",
		"<h1>O conteúdo procurado não existe</h1>",
		"</body>",
		"</html>"]
	def gera_resposta(pacote) do
		analisa_req(pacote)
		|> resposta
		|> formata_resposta
	end
	
	def resposta({ "GET", "/" }), do: resp200(@index)
	
	# rota /ola/nome -> Olá, nome!
	def resposta( { "GET", "/ola/" <> nome}), do: resp200(ola(nome))
	def resposta(_), do: resp404(@pag404)
	
	defp analisa_req(pacote) do
		String.split(to_string(pacote), "\r\n")
		|> List.first
		|> String.split
		|> Enum.take(2)
		|> List.to_tuple
  	end
		
		def resp_inicial(codigo, msg), do: "HTTP/1.1 #{codigo} #{msg}"
		
		defp resp200(corpo), do: { 200, "OK", corpo}
		
		defp resp404(corpo), do: { 404, "Not found", corpo}
			
		defp resposta_http(codigo, msg, corpo) do
			[ resp_inicial(codigo, msg),
				"Content-Type: text/html; charset=utf-8",
				"Content-Length: #{byte_size corpo}",
				"",
				corpo]
		end
				
		def formata_resposta({ codigo, msg, corpo }) do
			resposta_http(codigo, msg, Enum.join(corpo, "\r\n"))
			|> Enum.join("\r\n")
		end
		
		defp ola(nome) do
			@index ["<!DOCTYPE html>",
			"<html>",
			"<head>"
			"	<title>Oi</title>",
			"<meta charset=\"utf-8\"/>",
			"</head>",
			"<body>",
			"<h1>Olá, #{nome}!</h1>",
			"</body>",
			"</html>"]

end
