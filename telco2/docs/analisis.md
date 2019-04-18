¿Cumple la consigna?
  - Los test de fitnesse pasan, hizo pruebas (aunque no tengo manera de chequear si siguio TDD o no)
    que pasaban todas y abarcaban hasta casos borde como cambio de tarifas en horarios de llamadas
  - No incluye modelo (esta corrupto) ni diagrama de secuencia

Helpers:

  - Estan bastante bien, podrian usarse excepciones con nombres mas descriptivos pero los mensajes son claros.


Analisis de cada clase del modelo:

Billing: 
  - Esta bastante bien, cumple los principios solid. Lo unico que tengo para resaltar es que utiliza el costo basico como numero magico (100)
  - Es medio extrano que al calcular el costo estemos llamando a un metodo find_or_CREATE_phone. Mas adelante vuelvo a hablar de esto.

CallRegister:
  - Tiene la unica responsabilidad de registrar llamadas y filtrarlas por mes. No esta muy bueno el metodo has_calls? ya que rompe con el principio 'Tell, dont ask'. 
  - Tampoco creo que este muy bueno tener un metodo llamado find_or_create_month_calls. A simple vista es extrano, recibe un mes, y si no hay llamadas en ese mes pareciera que las va a crear magicamente

HourCost:
  - Es muy compleja esta clase, no es facil de leer, me da la sensacion de que los nombres elegidos para las variables no fueron los mejores y eso la complica mas
  - add_minutes y add_hour tienen un 1 que no me queda del todo claro que representa (parece estar de mas) 
   
HourHandler: 
  - esta bien, si hubieran muchos rangos horarios quedaria muy larga pero es dificil zafar de eso de otra manera. Podria usar tablas de hash

CentralHourCost, WeekendHourCost y RegularHourCost: 

  - Bien, unica responsabilidad, la del costo del minuto en una determinada franja horaria

PhonesOrganizer:

  - Bien, solo esta guardando los telefonos. Vuelvo a recalcar que no esta bueno tener un metodo que no sepamos que va a hacer (find_or_create_phone)

PhoneNumber:
  
  - Me parece que tiene muchas responsabilidades, yo separaria la logica de lo que es una llamada y un telefono. Aunque es correcto decir que un telefono hace una llamada,
   en el dominio sabemos que la llamda se compone de un origen y un destino, y solo esta guardando el destino, de esta manera a la hora de facturar me resulta raro pensar
    como voy a obtener las llamadas que hizo un determinado origen si las llamadas solo conocen al destino
  - Las validaciones las hubiera encarado mediante un parser como hizo en helpers, creando un objeto tipo Call
  - no es open/closed, si surgieran nuevos tipos de llamada tenemos que modificar create_call y puede quedar muy largo el metodo

LocalCall:

  - Esta bien, parece bastante concisa

NationalCall:

  - Idem, aunque el costo se puede escribir de una manera mucho mejor y entendible

InternationalCall:

  - Bien, salvo que esta utilizando un hash con strings y numeros magicos
