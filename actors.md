# What is actor?
An actor in terms of the Leapp project is a step that is executed within a workflow. Actors define what kind of data they expect and what they produce. Actors also provide a list of tags, with which actors mark their use cases.

Actors scan the system and produce the information found as messages. Other actors consume those messages to make decisions or process the data to produce new messages. Some actors might apply changes to the system based on the information gathered earlier.


# Do I need to write actors and why?
There are multiple situations in which you will need to write your own actors. Prime example is that you want to migrate/upgrade an application that is not supported by Leapp or supported application with special configuration that cannot be migrated/upgraded using default actors.
Another situation might be that you want to introduce new functionality using Leapp framework.

If you want to know how to write actors, check [tutorial](http://leapp.readthedocs.io/en/latest/tutorials.html).
Please follow [best practices](http://leapp.readthedocs.io/en/latest/best-practises.html) while writing actors. 

