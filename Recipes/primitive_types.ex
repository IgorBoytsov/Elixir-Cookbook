# Для выполнение файла нужно в терминале написать elixir Recipes/primitive_types.ex

defmodule BasicTypes do
  @moduledoc """
  Демонстрация базовых типов в Elixir
  """

# IO.puts("") => что бы сделать отступ, можно просто вставить пустую строку.

  def run do
    # IO.puts => Вывод заголовка в консоль.
    # IO.inspect() => value: Принимает значение, label: добавляет префикс к выводу.
    IO.puts("\n--- 1. Integers (Целые числа) ---")
    IO.inspect(42, label: "Целочисленое число")
    IO.inspect(1_000_000, label: "Целочисленно число с разделителями для читаемости")
    IO.inspect(0x1f, label: "Шестнадцатеричное 31")
    IO.inspect(0b1011, label: "Бинарное 11")
    IO.inspect(div(10, 3), label: "Целочисленое деление")
    IO.inspect(rem(10, 3), label: "Остаток от деления")
    IO.inspect(10 * 3, label: "Умножение int * int")
    IO.inspect(10.5 * 3.5, label: "Умножение float * float")
    IO.inspect(10 * 3.5, label: "Умножение int * float")
    IO.inspect(10 / 3, label: "Деление с оператором / всегда дает float")
    IO.inspect(10 / 2, label: "Даже если деление будет давать целое число, то в результате будет float")

    IO.puts("\n--- 2. Floats (Числа с плавающей точкой) ---")
    IO.inspect(3.14, label: "Стандартное float")
    IO.inspect(1.0, label: "float даже если после точки стоит 0")
    IO.inspect(1.0e-5, label: "Научная натация")
    IO.inspect(5 + 2.5, label: "int + float = float")

    IO.puts("\n--- 3. Booleans (Булевые значения) ---")
    IO.inspect(true, label: "Истина") # true по сути являеться синтаксическим сахором для атома :true
    IO.inspect(false, label: "Ложь") # false по сути являеться синтаксическим сахором для атома :false
    IO.inspect(true and false, label: "Логическое И")
    IO.inspect(true or false, label: "Логическое ИЛИ")
    IO.inspect(is_boolean(true), label: "Проверка типа через is_boolean")
    IO.inspect(true == :true, label: "'true' на самом деле являеться атом ':true'")

    IO.puts("\n--- 4. Atoms (Атомы) ---") # По сути, атомы - это заготовленые константы на уровне всего языка
    IO.inspect(:ok, label: "Типичный атом для статуса")
    IO.inspect(:error_file_not_found, label: "Атом для описания ошибки")
    IO.inspect(:"Атом с пробелами", label: "Атом в ковычках")
    status = :ok
    IO.inspect(status == :ok, label: "Сравнение атомов (Происходит очень быстро)")

    IO.puts("\n--- 5. Strings & Charlist (Строки и списки символов) ---")
    IO.puts("\n --- 5a. Strings (Бинарные строки, в двойных ковычках)")
    my_string = "Hello World"
    IO.inspect(my_string, label: "String (UTF-8)")
    IO.inspect("Helow" <> " " <> "world", label: "Конкатенация строк с <>")
    IO.inspect(is_binary(my_string), label: "Проверка: is_binary?")

    IO.puts("\n--- 5b. Charlists (Списки символов, в одинарных кавычках) ---")
    my_charlist = ~c'hello'
    IO.inspect(my_charlist, label: "Charlist (IEx красиво печатает)")
    IO.inspect(is_list(my_charlist), label: "Проверка: is_list?")
    # IO.inspect/1 показывает его истинную природу - список кодов символов.
    # 'h' -> 104, 'e' -> 101, 'l' -> 108, 'l' -> 108, 'o' -> 111
    # Поэтому 'hello' это то же самое, что и [104, 101, 108, 108, 111]
    IO.inspect(~c'hello' == [104, 101, 108, 108, 111], label: "Charlist - это просто список чисел?")

    # . Например, IO.inspect("hello") выведет "hello", а IO.inspect('hello') выведет 'hello', наглядно показывая разницу.
    "Hello" |> IO.inspect() # Это бинарная строка - обычный текст, как в остальных ЯП
    ~c'Hello' |> IO.inspect() # Тут список символов (Charlist), что бы вывести как обычную строку нужно использовать ~c, иначе будет выводиться предупреждение, об устаревшем ситаксисе.

   IO.puts("\n--- 6. Nil (Отсутсвие значения)")
   nothing = nil
   IO.inspect(nothing, label: "Значение nil")
   IO.inspect(is_nil(nothing), label: "Проверка значения на nil (is_nil?)")
   IO.inspect(nil == :nil, label: "На самом деле nil  это атом :nil")
   IO.inspect(nil == false, labe: "nil не равен false")

   IO.puts("\n --- Повидение nil и false в условиях ---")

   message =
    if nil do
      "Никогда не выполниться"
    else
      "nil считаеться ложным"
    end

    IO.inspect(message, label: "Результат if nil")

  end

end

defmodule AtomBool do
@moduledoc """
Демонстрация, что true/false это синтаксический сахар для атомов :true/:false
"""
  def check(:true), do: "Это был атом :true!"
  def check(_), do: "Это было что то другое"

end

BasicTypes.run()

IO.puts("\n--- Проверка того, что :true и :false == true и false Результаты с IO.puts ---")

IO.puts(AtomBool.check(true))
IO.puts(AtomBool.check(:true))
IO.puts(AtomBool.check(:true))
IO.puts(AtomBool.check(false))
IO.puts(AtomBool.check("Слово"))

IO.puts("\n--- Проверка того, что :true и :false == true и false Результаты с IO.inspect ---")

IO.inspect(AtomBool.check(true), label: "Вывзов с 'true'")
IO.inspect(AtomBool.check(:true), label: "Вывзов с ':true'")
IO.inspect(AtomBool.check(:false), label: "Вывзов с ':false'")
IO.inspect(AtomBool.check(false), label: "Вывзов с 'false'")
IO.inspect(AtomBool.check("Слово"), label: "Вывзов с 'Слово'")
