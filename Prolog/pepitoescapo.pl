local(ubi1).
local(ubi2).
local(ubi3).
local(ubi4).
local(ubi5).

no_encontrar(UMama,UPapa,UPepito):-
    local(UPepito),
    \==(UPapa,UPepito),
    \==(UMama,UPepito).
