defmodule CoordinatesTest do
  use ExUnit.Case, async: true
  alias Coordinates

  test "Letter A is column 1" do
    column = Coordinates.get_column("A3")
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
end
