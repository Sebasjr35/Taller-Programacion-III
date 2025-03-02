defmodule RegistroVehiculosPeaje do
  @moduledoc """
  Módulo para registrar vehículos en un peaje.
  Solicita la placa, el tipo de vehículo y su peso, luego calcula la tarifa correspondiente.
  """

  def registrar_vehiculo do
    # Solicitar datos del vehículo
    placa = obtener_input("Ingrese la placa del vehículo: ")
    tipo = obtener_input("Ingrese el tipo de vehículo (Carro, Moto, Camión): ")
    |> String.trim()
    |> String.downcase()
    |> String.normalize(:nfd)
    |> String.replace(~r/[^a-z]/, "")  # Elimina tildes y caracteres especiales

    peso = obtener_input("Ingrese el peso del vehículo (toneladas): ") |> String.to_float()

    tarifa = calcular_tarifa(tipo, peso)

    IO.puts "Vehículo #{placa} (#{String.capitalize(tipo)}) debe pagar $#{format_currency(tarifa)}."
  end

  # Función privada para solicitar entrada del usuario
  defp obtener_input(mensaje) do
    IO.write mensaje
    IO.gets(" ") |> String.trim()
  end

  # Función privada para calcular la tarifa según el tipo de vehículo
  defp calcular_tarifa("carro", _peso), do: 10_000
  defp calcular_tarifa("moto", _peso), do: 5_000
  defp calcular_tarifa("camion", peso) when peso > 0, do: 20_000 + trunc(peso) * 2_000
  defp calcular_tarifa(_, _), do: 0  # Manejo de casos no reconocidos

  # Función privada para formatear números con separadores de miles
  defp format_currency(valor) do
    valor
    |> Integer.to_string()
    |> String.reverse()
    |> String.replace(~r/(\d{3})(?=\d)/, "\\1.")
    |> String.reverse()
  end
end

RegistroVehiculosPeaje.registrar_vehiculo()
