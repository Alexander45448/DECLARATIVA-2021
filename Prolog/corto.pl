consulta([5]):- !.



cositas:-

	open('cositas.txt', read, Cositas),

	read(Cositas, Dato),

	writeln(Dato),

	close(Cositas).
