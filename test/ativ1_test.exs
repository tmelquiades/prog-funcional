defmodule Ativ2Test do
  use ExUnit.Case
  doctest Ativ1

  test "multiplica numeros por 5" do
    assert Ativ1.mult5(5) == 25
    assert Ativ1.mult5(0) == 0
    # como os tipos nao sao especificados, funciona para numeros de ponto-flutuante
    assert Ativ1.mult5(10.1) == 50.5
  end

  test "eleva um numero ao quadrado" do
    assert Ativ1.quadrado(0) == 0
    assert Ativ1.quadrado(1) == 1
    assert Ativ1.quadrado(2) == 4
    assert Ativ1.quadrado(12) == 144
  end

  test "soma de quadrados" do
    assert Ativ1.soma_quadrados(3, 4) == 25
    assert Ativ1.soma_quadrados(2, 0) == 4
    assert Ativ1.soma_quadrados(0, 7) == 49
    assert Ativ1.soma_quadrados(1, 1) == 2
  end

  test "concatena duas strings" do
    assert Ativ1.concat("hello, ", "world!") == "hello, world!"
    # cadeia vazia e' o elemento neutro da concatenacao
    assert Ativ1.concat("", "world") == "world"
    assert Ativ1.concat("hello", "") == "hello"
  end

  test "negacao de valores booleanos" do
    assert Ativ1.negacao(true) == false
    assert Ativ1.negacao(false) == true

    # dupla negacao, usando a notacao de "pipe"
    assert true |> Ativ1.negacao |> Ativ1.negacao == true
  end

  test "conjuncao de dois valores booleanos" do
    assert Ativ1.e_logico(true, true) == true
    assert Ativ1.e_logico(true, false) == false
    assert Ativ1.e_logico(false, true) == false
    assert Ativ1.e_logico(false, false) == false
  end

  test "centraliza uma string em um campo" do
    assert Ativ1.centraliza("abc", 9) == "   abc   "
    assert Ativ1.centraliza("abc", 10) == "    abc   "
    assert Ativ1.centraliza("a", 5) == "  a  "
    assert Ativ1.centraliza("", 4) == "    "
  end
end
