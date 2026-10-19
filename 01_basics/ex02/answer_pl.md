Wartość -0 pojawia się tylko dla typu double precision, gdy liczba ujemna zostaje zaokrąglona lub obcięta do zera,
np. round(-0.5) → -0 oraz trunc(-0.5) → -0.
Wynika to ze standardu IEEE 754, według którego procesor zapisuje liczby zmiennoprzecinkowe. Znak liczby jest tam
zapisany w osobnym bicie, niezależnie od jej wartości, więc istnieją dwa zera: +0 i -0. Przy zaokrąglaniu lub obcinaniu
zmienia się tylko wartość, a bit znaku zostaje taki, jaki miała liczba ujemna, dlatego wynikiem jest -0. Dzięki temu
nie ginie informacja, że zero powstało z liczby ujemnej.
Typ numeric nie ma osobnego zera ujemnego, dlatego tam wynikiem jest zwykłe 0 (np. trunc(-0.5) → 0).
Mimo innego zapisu -0 jest równe 0, porównanie -0 = 0 zwraca true.
