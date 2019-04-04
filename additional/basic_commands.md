# Haskell - przydatne wywołania

Instalacja w systemie Linux:
```bash
sudo apt-get install haskell-platform
```

Włączenie środowiska interaktywnego:
```bash
ghci
```

:help    		    wyświetla pomoc wewnątrz GHCi                               (:h,:?)
:quit                       wyjście z GHCi
:load [*]<module> ...       załaduj moduły/skrypty <module>... do GHCi                  (:l)
                            np. można załadować nasz kod:
                            $Prelude>:l hello.hs
:reload                     przeładuj załadowane moduły (pomocne przy zmianie źródeł	(:r)
:			    powtórz ostatnie polecenie GHCi
:browse [<module>]          przeglądnij zawartość modułu <module>
:module [+/-] [*]<mod> ...  zmień kontekst wykonywania poleceń GHCi (efektywnie         (:m)
                            ładuje funkcje z innego modułu do aktualnej przestrzeni nazw np.
                            $Prelude>:m Data.List
                            $Prelude Data.List>
:info [<name> ...] 	    wyświetl informacje o danej nazwie                          (:i)
:type <expr>                pokaż typ wyrażenia <expr>			                (:t)  



