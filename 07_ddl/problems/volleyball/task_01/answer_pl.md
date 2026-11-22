**Dlaczego dodanie danych nie jest możliwe?**

Tabele mają cykliczną zależność kluczy obcych: kapitan reprezentacji musi być w `athlete`, a zawodnik musi mieć reprezentację w `national_team`. Klucze są sprawdzane od razu po każdym `INSERT`, więc żadnej tabeli nie da się wypełnić jako pierwszej (np. Polski nie da się dodać bez Kurka, a Kurka bez Polski).

**W jaki sposób wprowadzać dane w zadanym schemacie?**

Wstawić dane do obu tabel w jednej transakcji (`BEGIN` … `COMMIT`) i sprawdzić klucze dopiero przy `COMMIT`, gdy wszystkie wiersze już istnieją.
