defmodule Recursividad do

  #1.Suma de números del 1 al n
  def suma(0), do: 0
  def suma(n) when n > 0, do: n + suma(n - 1)

  #2.Factorial de un número
  def factorial(0), do: 1
  def factorial(n) when n > 0, do: n * factorial(n - 1)

  #3.Fibonacci
  def fibonacci(0), do: 0
  def fibonacci(1), do: 1
  def fibonacci(n) when n > 1, do: fibonacci(n - 1) + fibonacci(n - 2)

  #4.Metodo recursivo que obtenga el número mayor de los elementos de una lista usando divide y vencerás
  def maximo_divide_venceras([x]), do: x
  def maximo_divide_venceras(lista) do
    {izquierda, derecha} = Enum.split(lista, div(length(lista), 2))

    IO.puts("Dividiendo: Izquierda = #{inspect(izquierda)}, Derecha = #{inspect(derecha)}")

    max_izquierda = maximo_divide_venceras(izquierda)
    max_derecha = maximo_divide_venceras(derecha)

    IO.puts("Comparando: max_izquierda = #{max_izquierda}, max_derecha = #{max_derecha}")

    max(max_izquierda, max_derecha)
  end
  
  #5.Suma de elementos de una lista
  def suma_lista([]), do: 0
  def suma_lista([h | t]), do: h + suma_lista(t)

  #6.Producto de los elementos de una lista
  def producto_lista([]), do: 1
  def producto_lista([h | t]), do: h * producto_lista(t)

  #7.Encontrar el máximo de una lista
  def maximo([x]), do: x
  def maximo([h | t]), do: max(h, maximo(t))

  #8.Conteo de elementos en una lista
  def contar_elementos([]), do: 0
  def contar_elementos([_ | t]), do: 1 + contar_elementos(t)

  #9.Revertir una lista
  def revertir_lista([]), do: []
  def revertir_lista([h | t]), do: revertir_lista(t) ++ [h]

  #10.Verificar si un número está en una lista
  def verificar_numero(_, []), do: false
  def verificar_numero(n, [h | t]), do: n == h or verificar_numero(n, t)

  #11.Eliminar un elemento de la lista
  def eliminar_elemento(_, []), do: []
  def eliminar_elemento(n, [h | t]) when h == n, do: t
  def eliminar_elemento(n, [h | t]), do: [h | eliminar_elemento(n, t)]

  #12.Recorrer una lista y duplicar cada valor
  def duplicar_lista([]), do: []
  def duplicar_lista([h | t]), do: [h * 2 | duplicar_lista(t)]

  #13.Implementar minimo/1 para encontrar el menor valor de una lista
  def minimo([x]), do: x
  def minimo([h | t]), do: min(h, minimo(t))

  #14.Contar cuántas veces aparece un número en una lista (contar_apariciones/2)
  def contar_apariciones(_, []), do: 0
  def contar_apariciones(n, [h | t]), do: (if h == n, do: 1, else: 0) + contar_apariciones(n, t)

  #15.Recorrer una lista y eliminar solo la primera aparición de un valor
  def eliminar_primera_aparicion(_, []), do: []
  def eliminar_primera_aparicion(n, [h | t]) when h == n, do: t
  def eliminar_primera_aparicion(n, [h | t]), do: [h | eliminar_primera_aparicion(n, t)]

  #16.Calcular la suma de los dígitos de un número
  def suma_digitos(0), do: 0
  def suma_digitos(n), do: rem(n, 10) + suma_digitos(div(n, 10))

  #17.Sumar los elementos pares de una lista
  def suma_pares([]), do: 0
  def suma_pares([h | t]) when rem(h, 2) == 0, do: h + suma_pares(t)
  def suma_pares([_ | t]), do: suma_pares(t)

  #18.Recursivamente invertir los pares de una lista
  def invertir_pares([]), do: []
  def invertir_pares([a, b | t]), do: [b, a | invertir_pares(t)]
  def invertir_pares([x]), do: [x]

  #19.Implementar map/2 recursivamente (como en Enum.map/2)
  def map([], _), do: []
  def map([h | t], f), do: [f.(h) | map(t, f)]

  #20.Concatenar dos listas recursivamente
  def concatenar_listas([], lista2), do: lista2
  def concatenar_listas([h | t], lista2), do: [h | concatenar_listas(t, lista2)]

  #21.Verificar si una lista está ordenada ascendentemente
  def lista_ordenada?([]), do: true
  def lista_ordenada?([_]), do: true
  def lista_ordenada?([a, b | t]), do: a <= b and lista_ordenada?([b | t])

  #22.Crear una versión recursiva de Enum.any?/2
  def any?([], _), do: false
  def any?([h | t], f), do: f.(h) or any?(t, f)

  #23.Calcular la potencia de un número
  def potencia(_, 0), do: 1
  def potencia(b, e) when e > 0, do: b * potencia(b, e - 1)
end

IO.puts("=== Pruebas de Funciones Recursivas ===")

IO.puts("Suma de 1 a 7: #{Recursividad.suma(7)}")

IO.puts("Factorial de 8: #{Recursividad.factorial(8)}")

IO.puts("Fibonacci de 6: #{Recursividad.fibonacci(6)}")

IO.puts("Suma de lista [2, 3, 4, 5]: #{Recursividad.suma_lista([2, 3, 4, 5])}")

lista = [2, 1, 5, 10, 8, 4, 3, 9]

IO.puts("Lista original: #{inspect(lista)}")

IO.puts("Número mayor encontrado (Divide y Vencerás): #{Recursividad.maximo_divide_venceras(lista)}")

IO.puts("¿Está el número 7 en la lista [3, 2, 1, 4]? = #{Recursividad.verificar_numero(7, [3, 2, 1, 4])}")

IO.puts("Duplicar elementos de [3, 4, 5]: #{inspect(Recursividad.duplicar_lista([3, 4, 5]))}")

IO.puts("Mínimo de [8, 4, 6, 1, 9]: #{Recursividad.minimo([8, 4, 6, 1, 9])}")

IO.puts("Suma de los dígitos de 9876: #{Recursividad.suma_digitos(9876)}")

IO.puts("Potencia 3^4: #{Recursividad.potencia(3, 4)}")
