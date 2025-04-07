defmodule Recursividad do
  #1. Contar elementos pares en una lista
  def contar_pares([]), do: 0
  def contar_pares([h | t]) do
    if rem(h, 2) == 0 do
      1 + contar_pares(t)
    else
      contar_pares(t)
    end
  end

  #2. Invertir una lista sin usar Enum.reverse
  def invertir(lista), do: invertir(lista, [])
  defp invertir([], acc), do: acc
  defp invertir([h | t], acc), do: invertir(t, [h | acc])

  #3. Sumar todos los elementos de una matriz (lista de listas)
  def suma_matriz([]), do: 0
  def suma_matriz([fila | resto]), do: suma_fila(fila) + suma_matriz(resto)
  defp suma_fila([]), do: 0
  defp suma_fila([h | t]), do: h + suma_fila(t)

  #4. Transponer una matriz
  def transponer([]), do: []
  def transponer([[] | _]), do: []
  def transponer(matriz), do: [Enum.map(matriz, &hd/1) | transponer(Enum.map(matriz, &tl/1))]

  #5. Suma objetivo con combinaciones
  def suma_objetivo([], _), do: false
  def suma_objetivo(lista, objetivo), do: buscar_combinacion(lista, objetivo)
  defp buscar_combinacion([], 0), do: true
  defp buscar_combinacion([], _), do: false
  defp buscar_combinacion([h | t], objetivo) do
    buscar_combinacion(t, objetivo - h) or buscar_combinacion(t, objetivo)
  end
end

# Uso
IO.puts("1. Contar pares:")
IO.inspect Recursividad.contar_pares([2, 3, 4, 5, 6, 8])

IO.puts("\n2. Invertir lista:")
IO.inspect Recursividad.invertir([5, 6, 8, 9])

IO.puts("\n3. Sumar matriz:")
IO.inspect Recursividad.suma_matriz([[5, 6], [7, 8]])

IO.puts("\n4. Transponer matriz:")
IO.inspect Recursividad.transponer([[5, 6], [7, 8]])

IO.puts("\n5. Suma objetivo:")
IO.inspect Recursividad.suma_objetivo([4, 6, 8], 15)
IO.inspect Recursividad.suma_objetivo([1, 4, 5], 10)
IO.inspect Recursividad.suma_objetivo([1, 2, 3], 7)
