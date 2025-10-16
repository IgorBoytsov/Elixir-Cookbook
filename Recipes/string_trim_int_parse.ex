defmodule IntParseExample do

  def display_trim_int(value) do
      case String.trim(value) |> Integer.parse() do
        {num, partial} -> IO.puts("Вы ввели: #{num} и #{partial}")
        :error -> IO.puts("Ошибка. Введи корректную строку.")
      end
  end

end

str = IO.gets("Введите строку: ")

IntParseExample.display_trim_int(str)
