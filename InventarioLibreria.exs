defmodule InventarioLibreria do
  @moduledoc """
  Módulo para gestionar el inventario de una librería.
  Permite registrar libros, calcular el valor total y mostrar la información de manera legible.
  """

  def registrar_libro do
    # Solicitar los datos del libro
    titulo = obtener_input("Ingrese el título del libro: ")
    cantidad = obtener_input("Ingrese la cantidad de unidades disponibles: ") |> String.to_integer()
    precio_unitario = obtener_input("Ingrese el precio unitario: ") |> String.to_float()

    # Calcular el valor total del inventario
    valor_total = cantidad * precio_unitario

    # Mostrar el resultado
    IO.puts "El libro \"#{titulo}\" tiene #{cantidad} unidades, con un valor total de $#{format_currency(valor_total)}."
  end

  # Función privada para solicitar entrada del usuario
  defp obtener_input(mensaje) do
    IO.write mensaje
    IO.gets(" ") |> String.trim()
  end

  # Función privada para formatear números con separadores de miles
  defp format_currency(valor) do
    valor
    |> trunc()
    |> Integer.to_string()
    |> String.reverse()
    |> String.replace(~r/(\d{3})(?=\d)/, "\\1.")
    |> String.reverse()
  end
end

InventarioLibreria.registrar_libro()

