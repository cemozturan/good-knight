defmodule Cli do

  def main(args) do
    {opts,_,_}= OptionParser.parse(args, switches: [start: :string, destination: :string], aliases: [s: :start, d: :destination])
    initial_square = Coordinates.get_square_coordinates(opts[:start])
    destination_square = Coordinates.get_square_coordinates(opts[:destination])
    path_in_chess_notation = PathFinder.get_shortest_path(initial_square, destination_square)
    |> Enum.map(&Coordinates.get_chess_notation_from_coordinates/1)
    IO.inspect path_in_chess_notation
  end
end
