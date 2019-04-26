# Programming in Haskell

This repository contains source code for tasks that I developed on the course of "Functional Programming" at AGH University of Science and Technology in Cracow.

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

## Useful links

[Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters)

[Learn Haskell in one video](http://www.newthinktank.com/2015/08/learn-haskell-one-video/)

[Real World Haskell](http://book.realworldhaskell.org/read/)