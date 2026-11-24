`EXPLAIN ANALYZE` wykonuje zapytanie i pokazuje jego plan. Przy każdym kroku planu są dwa nawiasy: **szacunek** planisty i **rzeczywiste** wartości z wykonania, np.:

```
Seq Scan on fakultety  (cost=0.00..1.12 rows=1 width=72) (actual time=0.010..0.012 rows=4 loops=1)
```

- **rows**: liczba wierszy, które zwraca ten krok. W pierwszym nawiasie to szacunek, w drugim liczba rzeczywista (średnio na jedno wykonanie kroku). Duża różnica między nimi oznacza, że planista źle oszacował dane.
- **width**: szacowany średni rozmiar jednego zwracanego wiersza w bajtach.
- **loops**: ile razy ten krok został wykonany. Zwykle 1, ale np. w złączeniu krok może być wykonany raz dla każdego wiersza drugiej tabeli. Wtedy łączna liczba wierszy to `rows × loops`.
