CSCI-UA 465
Homework 4
Names: Shivam Swarnkar, Kamal Fuseini
Date of Submission: 04-27-2017
NYU ID: N18289822, N10420300

Extra Files : Queue.m and QueuePath.m; These files contain a priority queue to 
help us implement a DFS A* mixed algorithm to explore map and find path. (Same implementations, but due to lack of the time we couldn't merge them)

Implementation: Our algorithm selects the box closests the goal, and try to explore them in priority. This way, we can avoid exploring 
big part of map and still find a good path. However, certain types of map layout can make our algorithm explore more boxes than needed.
But in avg, we believe it performs better. Also, we don't include box boundary as obstacles. 

Issues: We realized that pNbrs were not being updated, and because of that the getNeighbours method was returing false nbrs, and it was affecting
our path. Also, there seems to be some edge cases, and we're trying to fix them.

SSS.test() : It will run default env1.txt file with animation. 

Notes: We find the best path from the start position to the goal position with depth first search. The start and goal boxes are located and then a heuristic to find the shortest distance from the start box to the goal through the free neighbors is implemented.

Source Statement: No other sources have been consulted
Originality Statement: This writeup is my own work alone, referencing only the sources described in the SOURCE STATEMENT above. Electronically Signed: [Shivam Swarnkar] [Kamal S. Fuseini] 