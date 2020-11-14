# A postgres alternative to the full url lambda

Small experiment to see how easy it is to implement a closure table, one of the more elegant SQL implementations.

This is a potential replacement for the full url generation lambda that uses a more familiar tech stack, removes the need for tree traversal and makes xero (0!) calls to the contentful OR content APIs.


## Closure what

I stumbled upon the principle of a closure table whilst watching [one of the worst films I have ever seen](https://en.wikipedia.org/wiki/Happy_Death_Day_2U).  It is, IMHO a very elegant, simple and efficient solution to the problem we have with generating full urls for page objects in contentful.

It represents a tree by storing each node of the tree in a heirarchy table which has three columns: `parent_id`, `child_id`, `depth`.  A node will appear more than once in the table - one time for itself and once for each of its ancestor nodes on the path back to the / a root node.  The `depth` field represents how many steps removed that node is from the parent node with `parent_id`. 

[This website explains it better than I can]((https://dirtsimple.org/2010/11/simplest-way-to-do-tree-based-queries.html).

We can store the nodes themselves in a data table, eg `pages` and the associated hierarchy information in a different heiarchy table, eg `page_heirarchy`.


### Efficient

When we want to know the full url of a node, we can find all its ancestors all the way back to the root with a **single `select` query**, by joining the heirarchy table to itself.

When we create a new node, we only need two `insert` queries (one for each table).

When we update the parent of a node, we only need three `insert/update` queries **regardless of the size of the sub-tree**.

## Ruby

There is, of course, a ruby gem that encapsulates this behaviour and has all the methods I believe we would need to re-implement the full url lambda.

This repo is a demonstration of using this ruby gem with some dummy seed data.

