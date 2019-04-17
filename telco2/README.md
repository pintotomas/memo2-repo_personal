Para correr la app, parado en la carpeta telco:

ruby app/app.rb

Para ejecutar FitNesse en modo wiki (luego navegar: [http://localhost:9123/TelcoBilling](http://localhost:9123/TelcoBilling), 
tener presente de especificar la variable base_url indicando la url donde estará corriendo la aplicación a testear_ 

base_url=http://localhost:4567/ mvn clean verify -P wiki

Resumen:

Como puntos fuertes creo que tengo:

- Pasa todas las pruebas de aceptación
- Buena diseño en cuanto a respetar los principios de SOLID, cada clase con su responsabilidad

En cuanto a esto tengo una aclaración. Puede que parezca que las clases derivadas de HourCost no tengan ninguna responsabilidad,
pero de esta manera el ćódigo quedaba más legible y extensible en caso de que el cálculo del costo en una franja horaria
pudiese variar (y fuera parecido al de las llamadas nacionales por dar un ejemplo)

- Código legible y mantenible, sin algoritmos dificiles de entender
- Uso del patrón de diseño state para resolver el cambio en las franjas horarias
- Buen uso del polimorfismo para los distintos tipos de llamadas

Como puntos débiles:

- Puede que haya algunos nombres confusos o que no reflejen bien a que se refiere
- Si bien hice TDD, puede que en algunos casos haya un refactor medianamente grande o en el cual empezaba a hacer tests
de una clase que todavía no estaba integrada al modelo pero necesitaba hacer los tests de a uno (siguiendo TDD) 
para desarrollar bien su funcionalidad
- Puede que falten algunas pruebas más de integración
- No hay validación de que una llamada no se superponga con otra porque no llegué a hacerlo. La manera correcta sería
que al agregarla al call register, en esa clase se verifique en la lista de llamadas que no se superpongan y en caso
de que lo haga lance un error
- No llegué a hacer el diagrama de secuencia


