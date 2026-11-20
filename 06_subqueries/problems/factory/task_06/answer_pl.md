Tabela `assemblage` opisuje, co do czego się montuje. Siodełko (**Seat**) i kierownicę (**Handlebar**) montuje się do ramy (**Frame**), a dopiero rama trafia do roweru. Dlatego są potomkami ramy, a z produktem (**MTB bike**) łączą się pośrednio, przez ramę.

Model nie oddaje tego jednak do końca dobrze:

- **Frame** ma typ `part`, czyli powinien być niepodzielną częścią, a ma potomków. Skoro coś się do niego montuje, powinien mieć typ `component`. Tę niespójność pokazuje też zadanie 1.
- **Handlebar** w prawdziwym rowerze jest zamocowany (przez mostek) do widelca, a nie do ramy, bo skręca razem z widelcem.
- **Suspension fork** ma typ `component`, ale nie ma żadnych potomków. Handlebar pasowałby właśnie pod niego.
