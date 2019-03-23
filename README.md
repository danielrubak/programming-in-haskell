# programming-in-haskell
Contains tasks carried out as part of the 'Functional Programming' course at AGH

http://learnyouahaskell.com/chapters

http://www.newthinktank.com/2015/08/learn-haskell-one-video/

Początkowy setup projektu (wysatrczy wykonać raz):
```bash
cabal sandbox init
cabal update
cabal install --only-dependencies
```

Kompilacja projektu:
```bash
cabal build
```

Kompilacja kodu i załadowanie biblioteki do ghci:
```bash
cabal repl
```