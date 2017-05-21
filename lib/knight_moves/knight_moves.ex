defmodule KnightMoves do
  alias Coordinates

  # The numbers of squares a single knight move would result in across rows/columns
  @column_moves [-1, 1, 1, -1, 2, -2, 2, -2]
  @row_moves [2, 2, -2, -2, 1, 1, -1, -1]

  # Takes in the initial square for a knight, calculates the possible destination squares in all 8 directions,
  # and then filters out the ones that remain outside a standard chess board
  def get_possible_squares(initial_square) do
    get_possible_squares(@row_moves, @column_moves, initial_square)
  end

  defp get_possible_squares([hd_row_moves | tl_row_moves], [hd_column_moves | tl_column_moves], %{column: column, row: row} = initial_square) do
    [%{column: column + hd_column_moves, row: row + hd_row_moves}]
    |> Enum.concat(get_possible_squares(tl_row_moves, tl_column_moves, initial_square))
    |> Enum.filter(fn(x) -> Coordinates.is_valid?(x) end)
  end

  defp get_possible_squares([], [], _), do: []

end
