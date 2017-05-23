defmodule KnightMovesTest do
  use ExUnit.Case, async: true
  alias KnightMoves

  # Number of squares a knight can move to from a given square
  # |2|3|4|4|4|4|3|2|
  # |3|4|6|6|6|6|4|3|
  # |4|6|8|8|8|8|6|4|
  # |4|6|8|8|8|8|6|4|
  # |4|6|8|8|8|8|6|4|
  # |4|6|8|8|8|8|6|4|
  # |3|4|6|6|6|6|4|3|
  # |2|3|4|4|4|4|3|2|

  describe "get_possible_squares/1" do

    test "returns 8 possible squares for a central knight (inside the c3 x f6 area)" do
      possible_squares = KnightMoves.get_possible_squares(%{column: 5, row: 4})
      assert possible_squares == [
        %{column: 4, row: 6}, %{column: 6, row: 6}, %{column: 6, row: 2}, %{column: 4, row: 2},
        %{column: 7, row: 5}, %{column: 3, row: 5}, %{column: 7, row: 3}, %{column: 3, row: 3}]
    end

    test "returns the 6 correct squares for a knight on the g5 square (or anywhere on the b2-g2-g7-b7 square except for the b2-g2-g7-b7 squares themselves" do
      possible_squares = KnightMoves.get_possible_squares(%{column: 7, row: 5})
      assert possible_squares == [
        %{column: 6, row: 7}, %{column: 8, row: 7}, %{column: 8, row: 3},
        %{column: 6, row: 3}, %{column: 5, row: 6}, %{column: 5, row: 4}]
    end

    test "returns the 4 correct squares for a knight on the b7 square" do
      possible_squares = KnightMoves.get_possible_squares(%{column: 2, row: 7})
      assert possible_squares == [%{column: 3, row: 5}, %{column: 1, row: 5}, %{column: 4, row: 8}, %{column: 4, row: 6}]
    end

    test "returns 4 possible squares for a knight on the b2, g2, g7, b7 squares" do
      from_b2 = KnightMoves.get_possible_squares(%{column: 2, row: 2})
      from_g2 = KnightMoves.get_possible_squares(%{column: 7, row: 2})
      from_b7 = KnightMoves.get_possible_squares(%{column: 2, row: 7})
      from_g7 = KnightMoves.get_possible_squares(%{column: 7, row: 7})
      assert (length from_b2)  == 4
      assert (length from_g2)  == 4
      assert (length from_b7)  == 4
      assert (length from_g7)  == 4
    end

    test "returns the 3 correct squares for a knight on the a2 square" do
      possible_squares = KnightMoves.get_possible_squares(%{column: 1, row: 2})
      assert possible_squares == [%{column: 2, row: 4}, %{column: 3, row: 3}, %{column: 3, row: 1}]
    end

    test "returns 3 possible squares for a knight on the a2, h2, a7, h7, b1, g1, b8, g8 squares" do
      from_a2 = KnightMoves.get_possible_squares(%{column: 1, row: 2})
      from_h2 = KnightMoves.get_possible_squares(%{column: 8, row: 2})
      from_a7 = KnightMoves.get_possible_squares(%{column: 1, row: 7})
      from_h7 = KnightMoves.get_possible_squares(%{column: 8, row: 7})
      from_b1 = KnightMoves.get_possible_squares(%{column: 2, row: 1})
      from_g1 = KnightMoves.get_possible_squares(%{column: 7, row: 1})
      from_b8 = KnightMoves.get_possible_squares(%{column: 2, row: 8})
      from_g8 = KnightMoves.get_possible_squares(%{column: 7, row: 8})
      assert (length from_a2)  == 3
      assert (length from_h2)  == 3
      assert (length from_a7)  == 3
      assert (length from_h7)  == 3
      assert (length from_b1)  == 3
      assert (length from_g1)  == 3
      assert (length from_b8)  == 3
      assert (length from_g8)  == 3
    end

    test "returns the 2 correct squares for a knight on the a1 squares" do
      possible_squares = KnightMoves.get_possible_squares(%{column: 1, row: 1})
      assert possible_squares == [%{column: 2, row: 3}, %{column: 3, row: 2}]
    end

    test "returns 2 possible squares for a knight on the a1, h1, a8, h8 squares" do
      from_a1 = KnightMoves.get_possible_squares(%{column: 1, row: 1})
      from_h1 = KnightMoves.get_possible_squares(%{column: 8, row: 1})
      from_a8 = KnightMoves.get_possible_squares(%{column: 1, row: 8})
      from_h8 = KnightMoves.get_possible_squares(%{column: 8, row: 8})
      assert (length from_a1)  == 2
      assert (length from_h1)  == 2
      assert (length from_a8)  == 2
      assert (length from_h8)  == 2
    end

  end
end
