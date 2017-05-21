defmodule Coordinates do

  @columns %{ "A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6, "G" => 7, "H" => 8}

  # Having the rows defined like this allows us to avoid having to deal with
  # String.to_integer, non-numerical input (e.g. an input like "AB" where the row is not a number),
  # and whether the integer is between 1 and 8, etc. Pretty much all the initial input validation logic can be
  # omitted by having the rows defined here.
  @rows %{ "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8}

  # Given a square in chess notation,
  # returns a map in %{column: column_number, row: row_number} format to represent the square coordinates numerically
  # Example input/output:
  # "a3" -> %{column: 1, row: 3}
  # "A6" -> %{column: 1, row: 6}
  # "bk" -> %{column: 2, row: nil}
  # "d17" -> %{column: 4, row: nil}
  # "34" -> %{column: nil, row: 4}
  def get_square_coordinates(square_in_chess_notation),
    do: %{column: get_column(square_in_chess_notation), row: get_row(square_in_chess_notation)}

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

  # Takes in a map that represents a square and checks if it is a valid square on a standard chess board or not
  # Example input/output:
  # %{column: 3, row: 6} -> :true
  # %{column: 9, row: 6} -> :false
  # %{column: 3, row: 9} -> :false
  def is_valid?(%{column: column, row: row}), do: column < 9 && column > 0 && row < 9 && row > 0
end
