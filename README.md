# Enumerables Project

This is my version of implementing some of [Ruby's Enumerable Module](https://ruby-doc.org/core-2.4.1/Enumerable.html) traversal and searching methods.
I specifically implemented #each, #each_with_index, #select, #all?, #any?, #none?, #count, #map, and #inject.

This is a project from [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks).

## Installation

Open your Terminal/Command Line. Navigate to the directory where your version will live. Type in the following:

```
$ git clone https://github.com/JonathanYiv/enumerable_methods.git
$ cd enumerable_methods
$ irb
$ load "enumerable_methods.rb"
```

This will load an irb (interactive ruby shell) session with the newly implemented methods for use.
To exit the irb session, type:

```ruby
> quit
```

## Pre-Project Thoughts

One thing I want to get out of this specifically is a better understanding of blocks and yielding.

## Post-Project Thoughts
1. If you look at the source code, you'll see two versions of #my_select, with one commented out. The commented out one is one that did not use #my_each to help build the other methods. Everything onward builds on #my_each. This is because when you include the enumerables module in your own class, you can override the #each method to teach it how to traverse your new class, and since all the other methods are built using #each, you have access to the full functionality of the enumerables module.

2. I developed a much stronger understanding of yielding and blocks. I believe the only fundamental concept in Ruby that I need to practice/comprehend more is lambdas and Methods.
