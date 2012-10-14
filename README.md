# A Brief Aside on IO

Quick book club talk for Pivotal Labs on the subject of the IO language.

## Background

The IO language was created by Steve Dekorte around 2002, as an exploration
into programming language design.

IO is an Object Oriented language which does not distinguish between classes
and objects, making it a prototype language somewhat like Javascript.

## Cool Features

  - Exceptions are very clear.
  - Objects are made by cloning into a variable with lowercase. Classes by cloning
    into capitalized variable identifiers.
  - Powerful and simple reflection
  - Concurrency with actors, futures and coroutines
  - Very simple design, comprehensive libraries

## Basics

  - Everything is an object
  - Objects have slots
  - Objects can be assigned to slots
  - Methods are a type of object, defined using method(code)

### Collections

  - Methods that return objects
  - loop("1", "2") => List

### Control

  - Methods used to control flow
  - loop, while, for, if methods
  - true/false respond to then, else methods