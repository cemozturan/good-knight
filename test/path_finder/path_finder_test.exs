defmodule PathFinderTest do
  use ExUnit.Case, async: true
  alias PathFinder

  describe "get_shortest_path/1" do

    test "coming back to the initial square consists of two moves" do
      path = PathFinder.get_shortest_path(%{column: 4, row: 4}, %{column: 4, row: 4})
      assert path == [%{row: 4, column: 4}, %{column: 3, row: 6}, %{column: 4, row: 4}]
    end

    test "finds the shortest path with a single move" do
      path = PathFinder.get_shortest_path(%{column: 3, row: 4}, %{column: 5, row: 5})
      assert path == [%{column: 3, row: 4}, %{column: 5, row: 5}]
    end

    test "finds the shortest path with two moves" do
      path = PathFinder.get_shortest_path(%{column: 1, row: 1}, %{column: 1, row: 3})
      assert path == [%{column: 1, row: 1}, %{column: 3, row: 2}, %{column: 1, row: 3}]
    end

    test "finds the shortest path with three moves" do
      path = PathFinder.get_shortest_path(%{column: 3, row: 3}, %{column: 4, row: 3})
      assert path == [%{column: 3, row: 3}, %{column: 4, row: 5}, %{column: 6, row: 4}, %{column: 4, row: 3}]
    end

    test "finds the shortest path with four moves" do
      path = PathFinder.get_shortest_path(%{column: 2, row: 4}, %{column: 4, row: 6})
      assert path == [%{column: 2, row: 4}, %{column: 1, row: 6}, %{column: 3, row: 7}, %{column: 2, row: 5}, %{column: 4, row: 6}]
    end

    test "finds the shortest path with five moves" do
      path = PathFinder.get_shortest_path(%{column: 1, row: 1}, %{column: 7, row: 8})
      assert path == [%{column: 1, row: 1}, %{column: 2, row: 3}, %{column: 1, row: 5},
      %{column: 3, row: 6}, %{column: 5, row: 7}, %{column: 7, row: 8}]
    end

    test "finds the shortest path with six moves" do
      path = PathFinder.get_shortest_path(%{column: 1, row: 1}, %{column: 8, row: 8})
      assert path == [%{column: 1, row: 1}, %{column: 2, row: 3}, %{column: 1, row: 5},
      %{column: 2, row: 7}, %{column: 4, row: 8}, %{column: 6, row: 7}, %{column: 8, row: 8}]
    end

  end
end
