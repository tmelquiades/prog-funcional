defmodule Eficiencia do 
    #Exercicio:
    #crie uma versao de uma lista com recursividade de causa
    #(tail recursion)

    def soma_lista([]), do: 0
    def soma_lista([x | r]), do: x + soma_lista(r)

    def soma_lista(l), do: soma_aux(l, 0)

    defp soma_aux([], a), do: a 
    defp soma_aux([x | r], a), do: soma_aux(r, a+x)

    #Exercicio 2:
    #crie uma versao de map com recursividade de cauda
    def map([], _f), do: []
    def map([x | r], f), do: [f.(x) | map(r, f)] 
    
    def map2(l, f), do: map_aux(l, f, []) |> Enum.reverse
    def map_aux([], _f, a), do: a
    def map_aux([x | r], f, a), do: map_aux(r, f, [f.(x) | a])

    def tamanho([]), do: 0
    def tamanho([_ | r]), do: 1 + tamanho(r)

    def tamanho2(l), do: tamanho_aux(l, 0)

    defp tamanho_aux([], a), do: a 
    defp tamanho_aux([_ | r], a), do:
        tamanho_aux(r, a+1)
