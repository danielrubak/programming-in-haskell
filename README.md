# Programming in Haskell

This repository contains source code for tasks that I developed as part of the course "Functional Programming" at AGH University of Science and Technology in Cracow.

## Getting Started

Install haskell-platform package. Simply run,

```bash
sudo apt-get install haskell-platform
```

## Usage

Initial project setup (just do it once):

```bash
cabal sandbox init
cabal update
cabal install --only-dependencies
```

To compile project, simply run:

```bash
cabal build
```

To compile project and load all libraries, run:

```bash
cabal repl
```

If cabal throw error like this:

```bash
The 'repl' command does not support multiple target at once
```

run `cabal repl` command with selected target, for example:

```bash
cabal repl Intro
# or
cabal repl Student
```

## Table of content

Source code of tasks is located in **src** folder.

* **Intro.hs - Introduction to programming in Haskell**
  * simple functions for learning purposes
  * basic functions implementation like `sum`, `product`, `reverse` or `length` using `foldl` and `foldr`
* **Student.hs - Student data type**
  * new data type - Student(name, lastname, age)
  * instance of `Show` and `Eq` classes
  * converting list of Students to String
  * creating Student tuples, where first element is index, second element is Student object
  * converting Student obejct to simple HTML
  * comparing two list of Students
* **Lib.hs - simple IO() block, just for testing purposes**
* **Tree.hs - implementation of simple Tree structure**
  * new data Type Tree(value, letfChild, RightChild)
  * instance of `Show`, `Eq`, `Functor` and `Applicative` classes
  * implementation of `insert`, `empty`, `isBinary`, `search`, `isBalanced`, `toString`, `leaves`, `nnodes`, `nsum`, `tmap` and traversing functions

Useful notes for learning Haskell could be found in **haskell_notes.md** file in root folder, the latest version can be downloaded from [github gist](https://gist.github.com/mikehaertl/3258427).

## Useful links

[Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters)

[Learn Haskell in one video](http://www.newthinktank.com/2015/08/learn-haskell-one-video/)

[Real World Haskell](http://book.realworldhaskell.org/read/)

[What I wish I knew when learning Haskell](http://dev.stephendiehl.com/hask/)
