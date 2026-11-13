TRUNCATE jest zaliczane do Data Definition Language, a nie do Data Manipulation Language, bo tak naprawdę działa na całej tabeli jako obiekcie, a nie na jej wierszach. Usuwa istniejący, wypełniony plik z danymi tabeli, a w jego miejsce tworzy dokładnie taki sam schemat, ale pusty.

Dla porównania DELETE (polecenie DML) usuwa wiersz po wierszu, bo musi przejść po całej tabeli, a TRUNCATE usuwa wszystko naraz.

TRUNCATE nie przyjmuje klauzuli WHERE, ponieważ nie operuje na pojedynczych wierszach, więc nie ma dla czego sprawdzać warunku – zastępuje całą zawartość tabeli naraz. Jeśli chcemy usunąć tylko niektóre rekordy, musimy użyć DELETE.
