**Czy więzy integralności z innymi tabelami, widokami pozostały zachowane?**

Nie. Jeśli nic nie wskazuje na `studenci_2`, `DROP TABLE` po prostu ją usuwa razem z jej własnymi ograniczeniami. Jeśli wskazuje na nią klucz obcy innej tabeli albo widok, `DROP TABLE` bez `CASCADE` kończy się błędem. Z `CASCADE` tabela zostaje usunięta razem z zależnymi widokami i kluczami obcymi innych tabel, które na nią wskazywały. Dane w tych tabelach zostają, znikają tylko same ograniczenia.
