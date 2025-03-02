defmodule CostoDelEnvio do
  @moduledoc """
  Módulo para calcular el costo de envío de un paquete según su peso y tipo de envío.
  """

  def calcular_envio do
    # Solicitar el nombre del cliente
    cliente = obtener_input("Ingrese el nombre del cliente: ")

    # Solicitar el peso del paquete en kg
    peso = obtener_input("Ingrese el peso del paquete en kg: ") |> String.to_float()

    # Solicitar el tipo de envío
    tipo_envio = obtener_input("Ingrese el tipo de envío (Económico, Express, Internacional): ")
    |> String.trim()
    |> String.downcase()

    # Calcular costo de envío usando case, cond y if
    costo_total = calcular_costo(tipo_envio, peso)

    # Mostrar resultado
    IO.puts "Cliente: #{cliente}, Peso: #{peso} kg, Tipo de Envío: #{String.capitalize(tipo_envio)}, Costo Total: $#{format_currency(costo_total)}"

    {cliente, peso, tipo_envio, costo_total}
  end

  # Función privada para solicitar entrada del usuario
  defp obtener_input(mensaje) do
    IO.write mensaje
    IO.gets(" ") |> String.trim()
  end

  # Función privada para calcular el costo de envío
  defp calcular_costo("económico", peso), do: peso * 5000
  defp calcular_costo("express", peso), do: peso * 8000
  defp calcular_costo("internacional", peso) do
    cond do
      peso <= 5 -> peso * 15000
      peso > 5 -> peso * 12000
    end
  end
  defp calcular_costo(_, _), do: 0  # Caso no reconocido

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

CostoDelEnvio.calcular_envio()
