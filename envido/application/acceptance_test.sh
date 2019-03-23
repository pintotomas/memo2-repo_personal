#!/bin/bash

set -e


function check() {
  ruby app.rb "$2"  | grep "$3" >/dev/null && echo "$1:ok" || echo "$1:error"            
}   

check '01' '03p,03o,03e' 'Envido: 3'
check '02' '03p,03o,07e' 'Envido: 7'
check '03' '10p,11o,07e' 'Envido: 7'
check '04' '10p,11p,07e' 'Envido: 20'
check '05' '10p,11p,12p' 'Envido: 20'
check '06' '10p,01p,12o' 'Envido: 21'
check '07' '10p,01p,12p' 'Envido: 21'
check '08' '03p,01p,04e' 'Envido: 24'
check '09' '07p,06p,04e' 'Envido: 33'
check '10' '07p,06p,04x' 'El palo no es valido'
check '11' '07p,06p,09o' 'El numero no es valido'
