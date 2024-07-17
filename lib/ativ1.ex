defmodule Ativ1 do
  @moduledoc """
  Atividade 1 da disciplina Programação Funcional - 2024.1
  """

  # Exercícios com funções simples

  # Escreva o corpo das funções abaixo, seguindo o comportamento
  # especificado pela documentação. Para exemplos de cada
  # função, consulte o arquivo ativ2_test.exs no diretorio 'test'

    @doc "Multiplica o numero passado como parametro por 5."
    def mult5(x) do
      return x*5
    end

    @doc "Calcula o quadrado do numero x"
    def quadrado(x) do
      return x*x
    end

    @doc "Calcula a soma dos quadrados de x e y: x ao quadrado + y ao quadrado."
    def soma_quadrados(x, y) do
      return x*x + y*y
    end

    @doc "Concatena as duas strings a e b."
    def concat(a, b) do
      c = a <> b 
      return c
    end

    @doc "Efetua a negacao logica (NOT) do booleano a."
    def negacao(a) do
      return !a
    end

    @doc "Efetua o E-logico (AND) dos dois booleanos a e b."
    def e_logico(a, b) do
      return a && b
    end

    @doc """
    Centraliza a string str em um campo de tamanho largura,
    adicionando espacos antes e depois da string, dependendo
    do tamanho. Se não for possível dividir os espaços
    igualmente, colocar um espaço a mais do lado esquerdo
    (antes da string). Assuma que a largura sempre é maior
    que o tamanho da string.

    iex> Ativ1.centraliza("teste", 13)
    "    teste    "
    iex> Ativ1.centraliza("teste", 12)
    "    teste   "
    """
    def centraliza(str, largura) do
      tamanho = byte_size(str)
      total = largura - tamanho
      esquerda = div(total, 2)
      direita = total - esquerda

      String.duplicate(" ", esquerda) <> str <> String.duplicate(" ", direita)
      
    end
    # Dica: olhe a documentação para String.duplicate
    # A função Integer.floor_div também pode ser útil
end
