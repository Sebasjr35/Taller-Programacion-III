defmodule ConversionDeUnidadesTemperatura do
  @moduledoc """
  Módulo para convertir temperaturas de Celsius a Fahrenheit y Kelvin.
  """

  def convertir_temperatura do
    # Solicitar el nombre del usuario
    nombre = obtener_input("Ingrese su nombre: ")

    # Solicitar la temperatura en Celsius
    celsius = obtener_input("Ingrese la temperatura en Celsius: ") |> String.to_float()

    # Calcular Fahrenheit y Kelvin
    fahrenheit = (celsius * 9 / 5) + 32
    kelvin = celsius + 273.15

    # Mostrar resultados con 1 decimal de precisión
    IO.puts "Hola, #{nombre}. La temperatura ingresada equivale a:"
    IO.puts "- #{Float.round(fahrenheit, 1)} °F"
    IO.puts "- #{Float.round(kelvin, 1)} K"
  end

  # Función privada para solicitar entrada del usuario
  defp obtener_input(mensaje) do
    IO.write mensaje
    IO.gets(" ") |> String.trim()
  end
end

ConversionDeUnidadesTemperatura.convertir_temperatura()
