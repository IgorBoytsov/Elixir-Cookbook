defmodule EnumCollection do

  def enum_run(list) when is_list(list), do: list |> Enum.map(fn element -> element * 2 end) |> Enum.filter(fn element -> element > 10 end) |> Enum.take(5)

  def stream_run(list) when is_list(list), do: list|> Stream.map(&(&1 * 2)) |> Stream.filter(&(&1 > 10)) |> Stream.take(5)

  def recursion_sum(list) when is_list(list), do: _sum(list, 0)
  defp _sum([], acc), do: acc
  defp _sum([ head | tail ], acc), do: _sum(tail, acc + head)

  def recursion_custom_func(list, acc, func) when is_list(list) and is_function(func), do: _reduce(list, acc, func)
  defp _reduce([], acc, _func), do: acc
  defp _reduce([ head | tail ], acc, func), do: _reduce(tail, func.(head, acc), func)

end

list = [10,1,15,66,34,1,4,6,11,5666,444]

resultEnum = EnumCollection.enum_run(list)
resultStream = EnumCollection.stream_run(list) |> Enum.to_list()
resultRecursion = EnumCollection.recursion_sum(list)
resultRecursionCustomFunc = EnumCollection.recursion_custom_func(list, 0, fn element, current_sum -> (element + current_sum) * 10 end)

IO.puts("Результат Enum:")
IO.inspect(resultEnum)

IO.puts("Результат Stream:")
IO.inspect(resultStream)

IO.puts("Результат рекурсии (Сложение)")
IO.inspect(resultRecursion)

IO.puts("Результат рекурсии с кастомный функцией")
IO.inspect(resultRecursionCustomFunc)
