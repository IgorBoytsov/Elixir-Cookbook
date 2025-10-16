defmodule BaseCalculator do
  def run do
    raw_first_num = IO.gets("Введите первое число:")

    first_num =
      case String.trim(raw_first_num) |> Integer.parse() do
        {num, ""} -> num
        :error -> IO.puts("Ошибка. Введи пожалуйста число.")
      end

    IO.puts("Вы ввели: #{first_num}")

    raw_second_num = IO.gets("Введите второе число:")

    second_num =
      case String.trim(raw_second_num) |> Integer.parse() do
        {num, ""} -> num
        :error -> IO.puts("Ошибка. Введите пожалуйста число.")
      end

    IO.puts("Вы ввели: #{second_num}")

    raw_operator = IO.gets("Выберите оператор (Просто введите число):
      \n '1. +',
      \n '2. -',
      \n '3. *',
      \n '4. /',
      \n '5. ^',
      \n")

    operator = String.trim(raw_operator) |> String.to_integer()

    result = calculate(first_num, second_num, operator)

    case result do
      num when is_number(num) ->
        IO.puts("#{first_num} #{get_string_operator(operator)} #{second_num} = #{result}")

      error ->
        IO.puts("#{error}! Вы выбрали Value не существующий оператор")
    end
  end

  defp calculate(a, b, 1), do: a + b
  defp calculate(a, b, 2), do: a - b
  defp calculate(a, b, 3), do: a * b
  defp calculate(a, b, 4), do: a / b
  defp calculate(a, b, 5), do: :math.pow(a, b)
  defp calculate(_a, _b, _unknown_operator), do: "Ошибка"

  defp get_string_operator(1), do: "+"
  defp get_string_operator(2), do: "-"
  defp get_string_operator(3), do: "*"
  defp get_string_operator(4), do: "/"
  defp get_string_operator(5), do: "^"
  defp get_string_operator(_unknown), do: "Неизвестный оператор"

  def display_trim_int(value) do

      case String.trim(value) |> Integer.parse() do
        {num, partial} -> IO.puts("Вы ввели: #{num} и #{partial}")
        :error -> IO.puts("Ошибка. Введи корректную строку.")
      end

    IO.puts(first_num)
  end
end

BaseCalculator.run()
