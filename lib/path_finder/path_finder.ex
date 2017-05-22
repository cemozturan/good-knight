defmodule PathFinder do
  alias KnightMoves

  def get_shortest_path(initial_square, destination_square) do
    get_shortest_path([[initial_square]], [], destination_square)
  end

  # A typical BFS to find the shortest path
  defp get_shortest_path(queue, visited, destination_square) do
    # The path that is to be checked next
    current_path = Enum.at(queue, 0)
    # The next square from which we'll find the possible squares
    next_square_to_check = List.last(current_path)
    # Remove the current path from the queue
    queue = List.delete_at(queue, 0)
    cond do
      # Ignore the squares that have already been checked
      Enum.member?(visited, next_square_to_check) -> get_shortest_path(queue, visited, destination_square)
      true ->
        # Add the square to the list of visited ones
        visited = List.insert_at(visited, 0, next_square_to_check)
        # Find the list of squares that the knight can go to from the current square
        possible_squares = KnightMoves.get_possible_squares(next_square_to_check);
        # Add all the next possible squares to the current path
        queue = queue ++ Enum.map(possible_squares, fn(x) -> current_path ++ [x] end)
        cond do
          # If the destination square is found, return the current path
          Enum.member?(possible_squares, destination_square) ->
            current_path ++ [destination_square]
          true ->
            # Otherwise, keep looking at the other paths in the queue
            get_shortest_path(queue, visited, destination_square)
        end
    end

  end
end
