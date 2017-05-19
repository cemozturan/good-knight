defmodule Coordinates do

  @columns %{ "A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6, "G" => 7, "H" => 8}

  # Having the rows defined like this allows us to avoid having to deal with
  # String.to_integer, non-numerical input (e.g. an input like "AB" where the row is not a number),
  # and whether the integer is between 1 and 8, etc. Pretty much all the input validation logic can be
  # omitted by having the rows defined here.
  @rows %{ "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8}

  def get_square_coordinates(square_in_chess_notation) do
    [get_column(square_in_ches_notation), get_row(square_in_ches_notation)]
  end

  def get_column(square) do
    column_letter = square |> String.upcase |> String.at(0)
    @columns[column_letter]
  end

  def get_row(square) do
    cond do
      String.length(square) == 2 ->
        row = square |> String.at(1)
        @rows[row]
      true -> nil
    end
  end
end
