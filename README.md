# Good Knight

## What

An Elixir console application that prints the shortest path for a knight from a given initial square to a destination square on a chess board.

Never played chess? No problem! [This should be enough to get familiar with a chess board and how the knight moves](http://tamas-szabo.com/knightjumps/)

## How to run

1. Clone the repo
1. Run the tests (`mix test`)
1. Create the executable (`mix escript.build`)
1. Run the program as below ('--start' or '-s' to enter the initial square, and '--destination' or '-d' to enter the destination):

```
./chesspath --start "a1" --destination "h8"
["A1", "B3", "A5", "B7", "D8", "F7", "H8"]

./chesspath -s "a1" -d "h8"
["A1", "B3", "A5", "B7", "D8", "F7", "H8"]

./chesspath -s "c3" -d "e5"
["C3", "B5", "A7", "C6", "E5"]
```

## Ideas

The shortest path question itself would probably be too difficult for a face-to-face, but we can play around with the idea and make it part of the interview process. Here are some ideas:

| Take-home test  | Face-to-face pairing | Comments |
| ------------- | ------------- | ------------- |
| Standard shortest path question  | The same question but with a chess board of any size (not just 8x8)  | The size of the chess board would be passed in as user input, and the candidate would have to modify their solution (even possibly their algorithm if it wasn't that good enough to begin with) |
| Find the number of moves that the shortest path contains  | Find the shortest path itself  | Finding the distance is definitely easier than finding the path itself. The candidate's code would have to be modifiable enough to keep track of the paths themselves within the duration of a face-to-face |
| Standard shortest path question | Find all the shortest paths | In most cases, there are multiple shortest paths for the knight, so the candidate would have to find all of them instead of returning the first one found |
| Standard shortest path question | Same question but with some other pieces on the board so those squares cannot be used | Some squares would be occupied so the knight wouldn't be able to use them. This would require the algorithm to be modifiable without too much trouble. |
