# Golosinas

## Parte 1 (objeto/mensaje/polimorfismo)

De cada **golosina** interesan: el _precio_, el _sabor_, su _peso_ en gramos y si _contiene gluten_. <br>
Además, cada vez que una golosina _recibe un mordisco_ se reduce la cantidad de gramos
que posee.


#### Bombón
Vale 5 pesos y pesa inicialmente 15 gramos. Su gusto es frutilla. Es libre
de gluten. <br> 
Cuando recibe un mordisco, pierde un 20 % de su peso + 1 gramo extra 
(debido a que parte del relleno cremoso se pierde al caer al suelo). 
O sea, su nuevo peso se calcula como `(peso * 0.8) - 1`. 

#### Alfajor 
Vale 12 pesos y pesa inicialmente 300 gramos. Su gusto es chocolate. No es libre de gluten.  
Cuando recibe un mordisco, pierde el 20 % de su peso (o sea, su nuevo peso se calcula como `peso * 0.8`).

#### Caramelo 
Vale 1 peso y pesa inicialmente 5 gramos. Su gusto es frutilla. Es libre de gluten.   
Cuando recibe un mordisco, pierde 1 gramo.

#### Chupetín 
Vale 2 pesos y pesa inicialmente 7 gramos. Su gusto es naranja. Es libre de gluten.  
Cuando recibe un mordisco, pierde el 10 % de su peso, a excepción de que su peso actual sea menor a 2 gramos: en tal caso, no pierde nada.

#### Oblea 
Vale 5 pesos y pesa inicialmente 250 gramos. Su gusto es vainilla. No es libre de gluten.  
Al recibir un mordisco pierde peso, en una cantidad que depende del peso actual: si es mayor a 70 gramos pierde el 50 % de su peso, en caso contrario, el 25 %.

#### Chocolatín
El peso inicial es desconocido, lo asigna el usuario. El precio es de $0,50 por cada gramo de peso inicial. No es libre de gluten. Obviamente, su gusto es chocolate.   
Pierde 2 gramos por mordisco.   
**¡Atención!** El precio es según el _peso inicial_, no debe cambiar con los mordiscos.

#### Golosina bañada
Se arma a partir de una _golosina de base_. <br>
El peso inicial es el de la golosina de base más 4 gramos que es lo que pesa el bañado. El precio es el de la golosina de base más 2 pesos. El gusto es el de la golosina de base. 
De la misma manera, es libre de gluten si lo es su golosina base.   
Con cada mordisco se da un mordisco a la golosina de base. Además, en el primer mordisco pierde 2 gramos de
bañado, y en el segundo los otros dos.

#### Pastilla tutti-frutti
Pesa inicialmente 5 gramos. 
La pastilla puede ser libre de gluten o no (se configura). Si es libre de gluten el precio es $7; si no, es de $10.  
En cada mordisco cambia el sabor, pasa de frutilla a chocolate, de ahí a naranja, de ahí vuelve a frutilla. 

<br> 

### Tests de golosinas
Para cada golosina definida en la parte 1, salvo la golosina bañada (bombón, alfajor, caramelo, chupetín, oblea, chocolatín, pastilla tutti-frutti) definir un test en el que 
- se verifique que el peso inicial, el precio y el gusto sean los indicados en el enunciado; y que es, o no, libre de gluten, de acuerdo también a lo que se indica en el enunciado. 
Para el chocolatín hacer dos comprobaciones, una con 40 gramos de peso inicial y la otra con 100.
Para la pastilla tutti-frutti, hacer dos comprobaciones, una en la que es libre de gluten y la otra en que no.
- se le den dos mordiscos a la golosina, y se validen los cambios esperados en peso o sabor después de cada uno. Para chocolatín y pastilla tutti-frutti usar las dos variantes descriptas en el ítem anterior. Para la oblea, que sean tres mordiscos en lugar de dos.

Para la golosina bañada, hacer las mismas comprobaciones, para tres casos distintos: 
- bañando una pastilla tutti-frutti.
- bañando un chocolatín.
- bañando un chupetín.

<br> 

## Parte 2: Mariano (colecciones)

Crear el objeto `mariano` con la capacidad de comprar golosinas, hacer cosas con las golosinas que tiene, y responder a consultas sobre las mismas. En particular, debe entender todos los mensajes que siguen:
* `comprar(unaGolosina)` : agrega una golosina a la bolsa de golosinas compradas.
* `desechar(unaGolosina)` : desecha la golosina escogida de la bolsa de golosinas.
* `cantidadDeGolosinas()` : devuelve la cantidad de golosinas compradas.
* `tieneLaGolosina(unaGolosina)` : pregunta si Mariano ya tiene la golosina que se quiere comprar en la bolsa de golosinas.
* `probarGolosinas()` : le da un mordisco a todas las golosinas dentro de la bolsa de golosinas compradas.
* `hayGolosinaSinTACC()` : indica si hay al menos una golosina sin gluten en la bolsa de golosinas compradas.
* `preciosCuidados()` : se cumple cuando cada una de las golosinas compradas tienen un precio menor o igual a 10 pesos.
* `golosinaDeSabor(unSabor)` : devuelve _la primer golosina_ que encuentra en la bolsa del sabor escogido.
* `golosinasDeSabor(unSabor)` : devuelve _las golosinas_ que encuentre dentro de la bolsa del sabor escogido.
* `sabores()` : que devuelve los sabores de las golosinas de la bolsa, sin repetidos. <br> 
  P.ej. aunque Mariano tenga tres golosinas de sabor naranja, en lo que devuelve `sabores()` el naranja debería aparecer una sola vez.
* `golosinaMasCara()` : devuelve la golosina mas cara en la bolsa de golosinas compradas.
* `pesoGolosinas()` : devuelve el peso de la bolsa de golosinas compradas, o sea, la suma del peso de cada golosina. 

Además, se deben poder realizar las siguientes estadísticas: 
* Lograr que a Mariano se le pueda preguntar `golosinasFaltantes(golosinasDeseadas)` , donde `golosinasDeseadas` es una colección de golosinas. Debe devolver las golosinas que están entre las `golosinasDeseadas`, y que Mariano **no** compró.
* Lograr que a Mariano se le pueda preguntar `gustosFaltantes(gustosDeseados)`, que es una consulta similar a la anterior, pero donde `gustosDeseados`  es una colección de _gustos_. <br>
Debe devolver los gustos que están entre los `gustosDeseados`, y que no están cubiertos por ninguna golosina de las que tiene Mariano.

### Tests de Mariano
Armar un test en el que Mariano compre el chocolatin, el caramelo y el bombón. Probar cada método descripto en el enunciado. 
En particular, para `golosinasFaltantes` probar con `#{alfajor, bombon, chocolatin, chupetin}`, y para `gustosFaltantes`, con `#{"melón", "chocolate", "frutilla" , "vainilla"}`.


### Requerimientos adicionales.

- `gastoEn(sabor)`: precio total de las golosinas del sabor indicado.  
  Este no es _tan_ difícil.
- `saborMasPopular()`: del que tiene más golosinas.  
  Acá sí que se complica.  
  _Pista_: puede tener sentido agregar un método auxiliar, que devuelva la cantidad de golosinas de un sabor.
- `saborMasPesado()`: del que tiene más peso total.  
  Es parecido al anterior.
- `comproYDesecho(golosina)`: indica si Mariano primero compró, y después desechó, la golosina por la que se pregunta.  
  _Pista_: agregar un nuevo atributo a mariano, tiene que memorizar una información extra.


## Parte 3: Muchas golosinas (clases/herencia)

Hacer las modificaciones necesarias para que Mariano pueda comprar varios bombones, chocolatines, caramelos, alfajores, chupetines, obleas, golosinas bañadas y/o pastillas tuttifruti.

Resolver adecuadamente los casos en los que hay que pasar parámetros en la inicialización (el peso del chocolatín y la golosina a bañar).

### Bañar Golosina

Hacer que Mariano entienda el mensaje `baniar(unaGolosina)`. 
El método construye una nueva golosina bañada y la agrega a la colección de las golosinas que compró Mariano.

Pensar, haciendo un diagrama de objetos, qué pasa si:
1. la golosina ya era parte de la colección.
1. se baña una golosina ya bañada.


### Más variantes de golosinas 

<!--- herencia de clase concreta con redefinicion --->

#### **Bombones duros**
Los bombones duros son bombones (tienen las mismas reglas para el precio y gusto) pero cuando reciben un mordisco, en lugar de comportarse como el resto de los bombones, pierden 1 gramo.

Además, de los bombones duros queremos poder consultar el _grado de dureza_, que es: 3 si pesa más de 12 gramos, 2 si pesa entre 8 y 12 gramos, 1 si pesa menos de 8 gramos.

Indicar en cuál clase se encuentra el método que se ejecuta en cada caso, detallando el recorrido que realiza el method lookup.

```
const bombon = new Bombon() 
bombon.mordisco() 
bombon.peso() 
bombon = new BombonDuro() 
bombon.mordisco() 
bombon.peso() 
```

<!--- herencia con redefinicion y super para hacer otra cosa --->

#### **Caramelos de distintos sabores**
Hacer que pueda haber caramelos de cualquier sabor. Cuando se construye el caramelo se le indica de que sabor es.

#### **Caramelos con corazón de chocolate (Rellenos)**
Los caramelos con corazón de chocolate son caramelos que al recibir un mordisco, además de comportarse como todos los caramelos cambian su sabor a chocolate

Además, su precio es de un peso más que el de los caramelos comunes.

Indicar en cuál clase se encuentra el método que se ejecuta en cada caso, detallando el recorrido que realiza el method lookup.	

```
const caramelo = new Caramelo() 
caramelo.mordisco() 
caramelo.peso() 
caramelo.sabor() 
caramelo = new CarameloRelleno() 
caramelo.mordisco() 
caramelo.peso() 
caramelo.sabor()
```

<!--- herencia con redefinicion y super para modificar el resultado. Ademas tiene una variable en la subclase --->

#### **Obleas Crujientes**
Las obleas crujientes son como todas las obleas y cuando reciben un mordisco 
pierden el peso que pierden todas las obleas (50% si el peso es mayor a 70g o 25% si es menor). Pero, en los primeros 3 mordiscos pierde 3 gramos adicionales, esto hacerlo _después_ de la cuenta anterior.

A cada oblea crujiente se le tiene que poder consultar si _está débil_, esto es cierto si le dieron más de 3 mordiscos.
 
Indicar en cuál clase se encuentra el método que se ejecuta en cada caso, detallando el recorrido que realiza el method lookup.

```
const oblea = new Oblea() 
oblea.mordisco() 
oblea.peso() 
oblea = new ObleaCrujiente() 
oblea.mordisco() 
oblea.peso() 
```

#### **Chocolatines VIP y Chocolatines Premium**
Los chocolatines VIP, son como todos los chocolatines, pero se guardan en la  heladera de Mariano, que aporta un coeficiente de humedad (un número entre 0 y 1). Este coeficiente está involucrado para el cálculo del peso: El peso de un chocolatin VIP es el peso que tendría un Chocolatín cualquiera: 
`(pesoInicial - gramosConsumidos)` multiplicado por  `1 + humedad`.  
Por ejemplo, si el peso inicial de un chocolatín es 200 gramos, se consumieron 50, y la humedad es 0.2, entonces el peso es 150 * 1.2 = 180 gramos.

Los chocolatines Premium son un tipo especial de chocolatines VIP que vienen con una cobertura especial que los hace más resistentes a la humedad. Por lo tanto, La _humedad_ en estos chocolatines es la mitad de la humedad de los chocolatines VIP.

Indicar en cuál clase se encuentra el método que se ejecuta en cada caso, detallando el recorrido que realiza el method lookup.

```
const chocolatin = new Chocolatin() 
chocolatin.peso() 
chocolatin = new ChocolatinVIP() 
chocolatin.peso() 
chocolatin = new ChocolatinPremium() 
chocolatin.peso() 
```