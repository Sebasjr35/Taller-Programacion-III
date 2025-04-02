defmodule BuscarMaximo do
  # Usando listas
  def numero_maximos([x]), do: x

  def numero_maximos(list) do
    mid = div(length(list), 2)
    left = Enum.slice(list, 0, mid)
    right = Enum.slice(list, mid, length(list) - mid)

    [numero_maximos(left), numero_maximos(right)]
    |> Enum.max()
  end
end

list = [13, 42, 9, 90, 31, 52]
IO.puts "El máximo es: #{BuscarMaximo.numero_maximos(list)}"

defmodule BuscarElMaximo do
  # Usando tuplas
  def numero_maximo([x]), do: x

  def numero_maximo(list) do
    mid = div(length(list), 2)
    {left, right} = Enum.split(list, mid)

    max_left = numero_maximo(left)
    max_right = numero_maximo(right)

    if max_left > max_right, do: max_left, else: max_right
  end
end

list = [7, 19, 23, 8, 35, 47, 19]
IO.puts "El máximo es: #{BuscarElMaximo.numero_maximo(list)}"

# Usando tasks para paralelismo

defmodule ElMaximo do
  def max_number([x]), do: x

  def max_number(list) do
    mid = div(length(list), 2)
    {left, right} = Enum.split(list, mid)

    task_left = Task.async(fn -> max_number(left) end)
    task_right = Task.async(fn -> max_number(right) end)

    max(Task.await(task_left), Task.await(task_right))
  end
end

list = [12, 23, 45, 88, 61, 31, 80]
IO.puts "El máximo es: #{ElMaximo.max_number(list)}"
