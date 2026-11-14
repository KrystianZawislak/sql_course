Dla liczb zmiennoprzecinkowych 0.1 + 0.2 = 0.3 zwraca false, ponieważ te liczby w typie double precision są tylko 
przybliżeniami i w rzeczywistości ich wartość jest delikatnie inna. Komputer zapisuje (przechowuje) liczby 
poprzez 0 oraz 1, a liczby 0.1 nie da się wyrazić binarnie dokładnie. Na cyfry mamy dokładnie 53 bity, a gdy komputer próbuje
układać 0.1 z 1/2, 1/4 oraz 1/8 itd., to kiedyś osiąga limit i zapisuje liczbę 0.10000000000000000555…
Błędy przybliżeń 0.1 i 0.2 sumują się i nie są równe błędowi przybliżenia 0.3, dlatego wyniki się różnią.