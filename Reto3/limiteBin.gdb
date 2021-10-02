set logging file output.txt


set print pretty on


set logging on


set pagination off


file limiteBin

set args 200

b limiteBinASM
r

if($rdi==0)
	printf "EXPONENTE 0\n"
	printf "LIMITE=1 \n"
else


b dividir 
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
	printf "Division: %f\n", $arg0
end

define log1
	printf "Suma: %f\n", $arg0
end
define log2
	printf "Multiplicación N°: %d\n", $arg0
end
define log3
	printf "Potencia parcial: %f\n", $arg0
end
define log4
	printf "Valor aproximado de e: %f\n", $arg0
end
define log5
	printf "Exponente actual: %d\n", $arg0
end

# aqui empieza el programa
echo INICIO


echo DIVISION

b suma
c
log $xmm1.v2_double[0]

echo SUMA

b verificandoExponenteBin 
c 
log1 $xmm1.v2_double[0]


echo VERIFICAMOS EXPONENTE SI ES PAR O IMPAR

log5 $rdi
if($rdi==1)
		echo EXPONENTE IGUAL A 1
		echo EXPONENTE IMPAR
		log4 $xmm1.v2_double[0]
else

b bucle
c
  if($xmm10 == $xmm1)
	echo EXPONENTE IMPAR

  else
	echo EXPONENTE PAR
  end

log5 $rdi
echo HALLANDO EL LIMITE


set $contador=$rax
set $limite=$rdi

while($contador != $limite)
    log2 $contador
    c 
    log3 $xmm4.v2_double[0]
    set $contador=$rax
end 

b fin
c

log4 $xmm4.v2_double[0]

end
end

echo FIN

