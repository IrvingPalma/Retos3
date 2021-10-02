set logging file output.txt


set print pretty on


set logging on


set pagination off


file varianza

set args 0.10 0.12 0.30 0.45

b ASMvarianza
r

b media 
c

# hook previo para echo
define hook-echo
echo <<<---
end

# hook posterior para echo
define hookpost-echo
echo --->>>\n
end

# definimos un comando de nombre log 
# que muestra el valor de su primer argumento
define log
	printf "SumaParcial: %f\n", $arg0
end

define log1
	printf "Contador: %d\n", $arg0
end
define log2
	printf "Media de datos ingresados: %f\n", $arg0
end
define log3
	printf "Resta con media al cuadrado: %f\n", $arg0
end
define log4
	printf "Suma final: %f\n", $arg0
end
define log5
	printf "Varianza: %f\n", $arg0
end
# aqui empieza el programa
echo INICIO

echo HALLANDO LA MEDIA
set $contador=$rcx
set $limite=$rdi

while($contador != $limite)
		c
		set $contador=$rcx
		log1 $contador
		log $xmm2.v2_double[0]

end

b sum_cuadrados
c

log2 $xmm2.v2_double[0]



echo HALLANDO LA SUMA DE DIFERENCIAS AL CUADRADO

b bucle1
c 

set $contador=$rcx

while($contador != $limite)
	c
	set $contador=$rcx
	log1 $contador
	log3 $xmm5.v2_double[0]
	log $xmm4.v2_double[0]
end

log4 $xmm4.v2_double[0] 

b done
c

log5 $xmm4.v2_double[0] 

echo FIN









