prog func

defmodule Http do
	def servidor(porta) do
		# criar o socket
		{ :ok, socket } = :gen_tcp.listen(porta, active: false)
		# esperar conexões dos clientes
		IO.puts "Esperando por conexão na porta #{porta}"
		{ :ok, cliente } = :gen_tcp.accept(socket)

		# receber o pacote com a requisição
		{ :ok, pacote } = :gen_tcp.recv(cliente, 0)
		IO.puts("=== Dados recebidos :")
		IO.inspect(analisa_req(pacote))

		# enviar a resposta
		resposta(cliente)
		IO.puts("=== Resposta enviada, fechando conexão")
		# fechar sockets
		:gen_tcp.close(cliente)
		:gen_tcp.close(socket)
	end

	defp analisa_req(pacote) do
		String.split(to_string(pacote), "\r\n")
		|> List.first
		|> String.split
		|> Enum.take(2)
		|> List.to_tuple
  end

	@resp [ "HTTP/1.1 200 OK",
		"Content-Type: text/html; charset=utf-8",
		"Content-Length: 0",
		""]
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

	def cria_resposta(conteudo) do
		corpo = Enum.join(conteudo, "\r\n")
		conlen = "Content-Length: #{byte_size corpo}"
		Enum.join(@resp, "\r\n") <> conlen <> "\r\n\r\n" <> corpo
	end

	def resposta(cliente) do
		resp = Enum.join(@resp, "\r\n")
		:gen_tcp.send(cliente, resp)
	end
end
		
