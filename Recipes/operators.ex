defmodule Operators do
@moduledoc """
Демонстрация основных операторов и упраляющих констркукицй в Elixir
"""
  def run do

    IO.puts("\n--- 1. Арифметические операторы ---")
    IO.inspect(10 + 5, label: "Сложение 10 + 3")
    IO.inspect(10 - 5, label: "Вычитание 10 - 5")
    IO.inspect(10 * 5, label: "Уножение 10 * 5")
    IO.inspect(10 / 5, label: "Деление 10 / 5") # всегда возвращает Float
    IO.inspect(div(10, 3), label: "Целочисленое деление 10 / 3") # Возвращает целое число
    IO.inspect(rem(10, 3), label: "Остаток от деление 10 / 3") # Возвращает остаток от деления

    IO.puts("\n --- 2. Операторы сравнения ---")
    IO.inspect(5 == 5, label: "Равество")
    IO.inspect(5 != 3, label: "Неравенство")

    # Разница между == и ===
    IO.inspect(5 == 5.0, label: "==: Сравнивает значения, ответ true т.к 5 и 5.0 математически равны")
    IO.inspect(5 === 5.0, label: "===: Сравнивает значения и типы, ответ false т.к int не равне float")

    IO.inspect(5 > 2, label: "Больше")
    IO.inspect(5 < 2, label: "Меньше")
    IO.inspect(5 >= 5, label: "Больше или равно")

    IO.puts("\n--- 3. Ленивые операторы (строгие и ленивые) ---")

    IO.puts("\n--- 3a. Строгие операторы: and, or, not")
    IO.inspect(true and true, label: "true and true")
    IO.inspect(true or false, label: "true or false")
    IO.inspect(not true, label: "not true")

    # Следующая строка вызовет ошибку, т.к. `1` - не булево значение.
    # IO.inspect(1 and true) # => (BadBooleanError) expected a boolean on left-side of "and", got: 1
    IO.inspect(true and 1)

    IO.puts("\n--- 3b. 'Ленивые' (short-circuiting) операторы: `&&`, `||`, `!` ---")
    IO.puts("Работают с любыми типами. Считают false и nil ложными, все остальное - true")

    IO.inspect(true && 5, label: "true && 5 (возвращает второе значение)")
    IO.inspect(false && 5, label: "false && 5 (возвращает первое, до второго не доходит)")
    IO.inspect(nil || "hello", label: "nil || \"hello\" (возвращает второе, полезно для значений по умолчанию)")
    IO.inspect("world" || "hello", label: "\"world\" || \"hello\" (возвращает первое)")
    IO.inspect(!true, label: "!true")
    IO.inspect(!nil, label: "!nil (возвращает true)")

    IO.puts("\n--- 4. Операторы конкатенации ---")
    IO.inspect("hello" <> " " <> "wordl", label: "Склейка бинарных строк с помощью '<>'")
    IO.inspect([1,2,3] ++ [4,5], label: "Конкатенация списков")

    IO.puts("\n--- 5. Управляющие конструкции ---")

    IO.puts(("\n--- 5a. If / else ---"))

    status = :ok
    result_if =
      if status == :ok do
        "Все хорошо"
      else
        "Что то пошло не так"
      end

      IO.inspect(result_if, label: "Результат")

      IO.puts("\n--- 5b. case (Паттерн-матчинг в действии) ---")

      response = {:ok, "Данные получены"}
      result_case =
        case response do
          {:ok, data} -> "Успех! #{data}"
          {:error, reason} -> "Ошибка! #{reason}"
          _ -> "Неизвестнаый формат"
        end # Тут будет предупреждение в терминале о том, что данный код никогда не дойдет дойдет. В данном случае до 2 и 3 пункта.

        IO.inspect(result_case, label: "Результат `case`")

        IO.puts("\n--- 5c. cond (Цепочка условий) ---")

        number = 5
        result_cond =
          cond do
            number < 0 -> "Отрицательное"
            number == 0 -> "Ноль"
            number > 0 and number < 10 -> "Маленькое положительное"
            number > 0 -> "Положительное"
          end

          IO.inspect(result_cond, label: "Результат cond")

         IO.puts("\n--- 6. Конвейерный оператор `|>` ---")
         IO.puts("Преобразует `f(g(x))` в `x |> g() |> f()` для лучшей читаемости.")

         origunal_string = "  heLLo elixIR!  "
         without_pipe = String.trim(String.capitalize(origunal_string))
         IO.inspect(without_pipe, label: "Без |>")

         with_pipe =
          origunal_string
          |> String.capitalize()
          |> String.trim()

          IO.inspect(with_pipe, label: "С |>")
  end

end

Operators.run()
