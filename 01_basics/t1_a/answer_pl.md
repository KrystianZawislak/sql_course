Różnica dotyczy liczb -2.5, -0.5, 0.5, 2.5, czyli takich, które leżą dokładnie w połowie między dwiema liczbami całkowitymi.
Typ numeric zaokrągla po szkolnemu, czyli połówkę od zera (np. -2.5 → -3), a double precision do najbliższej parzystej (np. -2.5 → -2).
Wynika to z tego, że double precision liczy procesor według standardu IEEE 754. Ten standard każe zaokrąglać
połówki do parzystej, bo przy wielu obliczeniach błędy się wtedy znoszą, a nie kumulują w jedną stronę.
A numeric liczy sam PostgreSQL w systemie dziesiętnym, cyfra po cyfrze, tak jak człowiek na kartce, więc stosuje
szkolną regułę.
