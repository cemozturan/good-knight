defmodule CoordinatesTest do
  use ExUnit.Case, async: true
  alias Coordinates

  describe "get_column/1" do

    test "letter A is column 1" do
      column = Coordinates.get_column("A3")
      assert column == 1
    end

    test "letter a is column 1" do
      column = Coordinates.get_column("a3")
      assert column == 1
    end

    test "letter B is column 2" do
      column = Coordinates.get_column("B3")
      assert column == 2
    end

    test "letter C is column 3" do
      column = Coordinates.get_column("C3")
      assert column == 3
    end

    test "letter D is column 4" do
      column = Coordinates.get_column("D3")
      assert column == 4
    end

    test "letter d is column 4" do
      column = Coordinates.get_column("d3")
      assert column == 4
    end

    test "letter E is column 5" do
      column = Coordinates.get_column("E3")
      assert column == 5
    end

    test "letter F is column 6" do
      column = Coordinates.get_column("F3")
      assert column == 6
    end

    test "letter G is column 7" do
      column = Coordinates.get_column("G3")
      assert column == 7
    end

    test "letter H is column 8" do
      column = Coordinates.get_column("H3")
      assert column == 8
    end

    test "letter I is nil" do
      column = Coordinates.get_column("I3")
      assert column == nil
    end

    test "Non-letters are nil" do
      column = Coordinates.get_column("23")
      assert column == nil
    end

  end

  describe "get_row/1" do

    test "1 is row 1" do
      row = Coordinates.get_row("A1")
      assert row == 1
    end

    test "2 is row 2" do
      row = Coordinates.get_row("B2")
      assert row == 2
    end

    test "3 is row 3" do
      row = Coordinates.get_row("C3")
      assert row == 3
    end

    test "4 is row 4" do
      row = Coordinates.get_row("D4")
      assert row == 4
    end

    test "5 is row 5" do
      row = Coordinates.get_row("E5")
      assert row == 5
    end

    test "6 is row 6" do
      row = Coordinates.get_row("F6")
      assert row == 6
    end

    test "7 is row 7" do
      row = Coordinates.get_row("G7")
      assert row == 7
    end

    test "8 is row 8" do
      row = Coordinates.get_row("H8")
      assert row == 8
    end

    test "numbers < 1 are nil" do
      row = Coordinates.get_row("A0")
      assert row == nil
    end

    test "numbers > 8 are nil" do
      row = Coordinates.get_row("A9")
      assert row == nil
    end

    test "numbers that have more than 1 digit are nil" do
      row = Coordinates.get_row("A23")
      assert row == nil
    end

    test "Non-numbers are nil" do
      row = Coordinates.get_row("DD")
      assert row == nil
    end

  end

  describe "get_square_coordinates/1" do

    test "returns numerical coordinates when given chess notation" do
      coordinates = Coordinates.get_square_coordinates("b4")
      assert coordinates == %{column: 2, row: 4}
    end

    test "returns nil for invalid columns" do
      coordinates = Coordinates.get_square_coordinates("x7")
      assert coordinates == %{column: nil, row: 7}
    end

    test "returns nil for invalid rows" do
      coordinates = Coordinates.get_square_coordinates("c9")
      assert coordinates == %{column: 3, row: nil}
    end

    test "returns [nil, nil] if row and column is not in the expected order" do
      coordinates = Coordinates.get_square_coordinates("5d")
      assert coordinates == %{column: nil, row: nil}
    end

  end

  describe "is_valid?/1" do

    test "returns true for a valid chess square" do
      assert Coordinates.is_valid?(%{column: 8, row: 1}) == :true
    end

    test "returns false for a chess square with a row < 1" do
      assert Coordinates.is_valid?(%{column: 2, row: 0}) == :false
    end

    test "returns false for a chess square with a row > 8" do
      assert Coordinates.is_valid?(%{column: 2, row: 9}) == :false
    end

    test "returns false for a chess square with a column < 1" do
      assert Coordinates.is_valid?(%{column: -1, row: 5}) == :false
    end

    test "returns false for a chess square with a column > 8" do
      assert Coordinates.is_valid?(%{column: 9, row: 4}) == :false
    end

  end
end
