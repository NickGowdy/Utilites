defmodule Utilities.StringMatcher do
  @merchants [
    "Sainsburys",
    "Uber",
    "Uber Eats",
    "Netflix",
    "Amazon",
    "Google",
    "Amazon Prime",
    "DVLA",
    "Sky Digital",
    "SKY"
  ]

  def match(description) do
    description
    |> get_matches()
    |> Enum.filter(fn match -> match != nil end)
    |> Enum.sort_by(&byte_size/1, :desc)
    |> Enum.take(1)
    |> List.first(:Unknown)
  end

  defp get_matches(description) do
    Enum.map(@merchants, fn merchant ->
      sanatise_description =
        description
        |> remove_characters()
        |> String.downcase()

      sanatise_merchant =
        merchant
        |> remove_characters()
        |> String.downcase()

      case String.contains?(sanatise_description, sanatise_merchant) do
        true -> merchant
        false -> nil
      end
    end)
  end

  @spec remove_characters(binary) :: binary
  defp remove_characters(word) do
    String.replace(word, ["'", ".", " ", "-"], fn _ -> "" end)
  end
end
