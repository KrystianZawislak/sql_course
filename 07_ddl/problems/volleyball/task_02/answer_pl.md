**Dlaczego odroczenie momentu sprawdzania spełniania przez dane ograniczeń nie rozwiązało problemu?**

W `ALTER TABLE` obu tabel brakowało `DEFERRABLE`, więc klucze obce mają domyślny tryb `NOT DEFERRABLE` i są sprawdzane zawsze od razu. `SET CONSTRAINTS ALL DEFERRED` odracza tylko ograniczenia `DEFERRABLE`, dlatego nic nie zmieniło.

**Jakie zmiany należy wprowadzić w ograniczeniach tabel, aby możliwe było odraczanie ograniczeń?**

Trzeba dopisać `DEFERRABLE` do `ALTER TABLE` obu tabel, czyli utworzyć oba klucze obce na nowo z `DEFERRABLE INITIALLY DEFERRED` (sprawdzanie przy `COMMIT`) albo z `DEFERRABLE INITIALLY IMMEDIATE` i wtedy w transakcji użyć `SET CONSTRAINTS ALL DEFERRED`.
