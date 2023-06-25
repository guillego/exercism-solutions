defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end


  def remove([_first | rest ] = _list) do
    rest
  end

  def first([first | _rest] = _list) do
    first
  end

  def count(list) do
    Kernel.length(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end


end
