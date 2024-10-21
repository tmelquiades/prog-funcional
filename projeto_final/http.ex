defmodule Http do
	def servidor(porta) do
		# criar o socket
		{ :ok, socket } = :gen_tcp.listen(porta, active: false)
    
		# esperar conexões dos clientes
    IO.puts "=== Esperando conexão na porta #{porta}"
    recebe_conexao(socket)
    
    # fechar socket
    :gen_tcp.close(socket)
  end
  
  def recebe_conexao(socket) do
    IO.puts "Esperando por conexão na porta #{porta}"
		{ :ok, cliente } = :gen_tcp.accept(socket)

		# receber o pacote com a requisição
		{ :ok, pacote } = :gen_tcp.recv(cliente, 0)
		resposta = Servidor.gera_resposta(pacote)
    
    # enviar a resposta
    :gen_tcp.send(cliente, resposta)
    IO.puts("=== Resposta enviada, fechando conexão")
    
    :gen_tcp.close(cliente)
  end
end
