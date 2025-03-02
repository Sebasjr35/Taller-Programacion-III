defmodule ConsumoDeCombustible do
  @moduledoc """
  Módulo para calcular el consumo de combustible de un vehículo.
  Solicita la distancia recorrida y el combustible consumido, luego calcula el rendimiento en km/L.
  """

  def calcular_consumo do
    # Solicitar los datos del conductor y del vehículo
    conductor = obtener_input("Ingrese el nombre del conductor: ")
    distancia = obtener_input("Ingrese la distancia recorrida en km: ") |> String.to_float()
    combustible = obtener_input("Ingrese la cantidad de combustible consumido en litros: ") |> String.to_float()

    # Calcular el rendimiento del vehículo
    rendimiento = if combustible > 0, do: distancia / combustible, else: 0

    # Mostrar el resultado con dos decimales
    IO.puts "El conductor #{conductor} tiene un rendimiento de #{format_decimal(rendimiento)} km/L."
  end

  # Función privada para solicitar entrada del usuario
  defp obtener_input(mensaje) do
    IO.write mensaje
    IO.gets(" ") |> String.trim()
  end

  # Función privada para formatear números con dos decimales
  defp format_decimal(valor) do
    :io_lib.format("~.2f", [valor]) |> List.to_string()
  end
end

ConsumoDeCombustible.calcular_consumo()
