defmodule CoordinatesTest do
  use ExUnit.Case, async: true
  alias Coordinates

  describe "get_column/1" do

    test "Letter A is column 1" do
      column = Coordinates.get_column("A3")
      assert column == 1
    end

    test "Letter a is column 1" do
      column = Coordinates.get_column("a3")
      assert column == 1
    end

    test "Letter B is column 2" do
      column = Coordinates.get_column("B3")
      assert column == 2
    end

    test "Letter C is column 3" do
      column = Coordinates.get_column("C3")
      assert column == 3
    end

    test "Letter D is column 4" do
      column = Coordinates.get_column("D3")
      assert column == 4
    end

    test "Letter d is column 4" do
      column = Coordinates.get_column("d3")
      assert column == 4
    end

    test "Letter E is column 5" do
      column = Coordinates.get_column("E3")
      assert column == 5
    end

    test "Letter F is column 6" do
      column = Coordinates.get_column("F3")
      assert column == 6
    end

    test "Letter G is column 7" do
      column = Coordinates.get_column("G3")
      assert column == 7
    end

    test "Letter H is column 8" do
      column = Coordinates.get_column("H3")
      assert column == 8
    end

    test "Letter I is nil" do
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

    test "Numbers < 1 are nil" do
      row = Coordinates.get_row("A0")
      assert row == nil
    end

    test "Numbers > 8 are nil" do
      row = Coordinates.get_row("A9")
      assert row == nil
    end

    test "Non-numbers are nil" do
      row = Coordinates.get_row("DD")
      assert row == nil
    end

  end
end
