defmodule CalculoSalarioEmpleado do
  @moduledoc """
  Módulo para calcular el salario total de un empleado.
  Solicita el nombre del empleado, el salario base y las horas extras trabajadas,
  luego calcula el salario total considerando un pago del 1.5x por cada hora extra.
  """

  def iniciar do
    # Función principal que solicita los datos del empleado,
    # realiza el cálculo del salario total y muestra el resultado.
    nombre = obtener_input("Ingrese el nombre del empleado: ")
    salario_base = obtener_input("Ingrese el salario base: ") |> String.to_float()
    horas_extras = obtener_input("Ingrese el número de horas extras trabajadas: ") |> String.to_integer()

    salario_total = calcular_salario_total(salario_base, horas_extras)

    IO.puts "El empleado #{nombre} tiene un salario total de $#{format_currency(salario_total)}."
  end

  # Función privada para solicitar entrada del usuario
  defp obtener_input(mensaje) do
    IO.write mensaje
    IO.gets("") |> String.trim()
  end

  # Función privada para calcular el salario total considerando horas extras
  defp calcular_salario_total(salario_base, horas_extras) do
    valor_hora = salario_base / 160  # Suponiendo una jornada de 160 horas al mes
    pago_horas_extras = horas_extras * valor_hora * 1.5
    salario_base + pago_horas_extras
  end

  # Función privada para formatear números con separadores de miles
  defp format_currency(valor) do
    valor
    |> round()
    |> Integer.to_string()
    |> String.reverse()
    |> String.replace(~r/(\d{3})(?=\d)/, "\\1.")
    |> String.reverse()
  end
end

CalculoSalarioEmpleado.iniciar()
