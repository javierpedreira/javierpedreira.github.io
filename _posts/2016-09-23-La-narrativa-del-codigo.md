---
layout: post
categories: posts
date: 2016-09-23 09:20:11
author: Javier Pedreira
crawlertitle: La narrativa del codigo
tags: posts
summary: Entendiendo el codigo desde la perspectiva de los relatos
---

Me gusta escribir, he de admitir que no escribo por diversión tanto como me gustaría o debería, pero es una actividad mental que me permite relajarme y quitarle los cerrojos a mi mente de tanto en tanto. Escribí mi primer relato con 8 o 9 años en un cuaderno a doble línea al que incluso le dibujé una portada.  Aquel relato era una mezcolanza entre diferentes películas y series de televisión que veía por aquella epoca. Tardé un tiempo y era tan ridículo como podía ser un relato escrito por un niño. Sin embargo era mi relato y disfruté mucho el proceso. 

Con el paso de los años he escrito de forma esporádica, participé un par de veces en los concursos que se organizaban en mi instituto cuando se acercaba San Jordi. Una época muy colorida en Barcelona, ciudad donde he vivido la mayor parte de mi vida. 

Al llegar a mi vida adulta escogí la informática como el medio para ganarme el pan, específicamente el desarrollo de software. Siempre enfoqué el proceso de una forma analítica. Escribes un algoritmo, una serie de pasos o instrucciones que pueden estar o no condicionadas, que pueden ser o no iterativas, que pueden seguir unos patrones de diseño u otros y que siguen las convenciones de la tecnología escogida para proponer una solución a un problema concreto.  Es una forma natural de ver el desarrollo del software, pero no es la única forma de hacerlo.

Existe un punto de vista interesante, es una filosofía personal y se ajusta muy bien a mi hobby de juventud. Enfocar el desarrollo desde un punto de vista narrativo me da varias ventajas, la primera me da libertad para ser más creativo, ingenioso, mejora mucho la legibilidad del código, y facilita el proceso de refactorización ya que al ser más legible, es fácil encontrar errores o identificar comportamientos similares que pueden ser encapsulados en métodos auxiliares. 

Este párrafo puede que haga levantar las cejas a alguno, es un punto de vista personal, un truquillo que me ayuda, especialmente cuando conozco los pasos que un programa debe seguir pero aun no tengo la solución final en mi cabeza. O es posible que conozca la solución al problema pero no sé cual es la mejor forma de estructurarla. 

Para que funcione mejor, me aplico una serie de reglas que coinciden(no casualmente) con algunas de las reglas de programación en Clean Code, extraídas del libro de Uncle Bob. 

Las funciones deben hacer una sola cosa, sin efectos colaterales ocultos, y su nombre debe describir lo que hace, esto facilita el testeo y reduce la posibilidad de que ocurran cosas inesperadas cuando usamos una determinada función en un contexto nuevo. Por ejemplo:
    
Bien
{% highlight ruby %}
  def amasarPizza(masa_pizza)
    Rodillo.new.amasar(masa_pizza)
  end
{% endhighlight %}


Mal
{% highlight ruby %}
  def amasarPizza(masa_pizza)
  agregar(masa_pizza, cebolla)
    Rodillo.new.amasar(masa_pizza)
  end
{% endhighlight %}

Los nombres de las funciones deben ser verbos y deben ser nombres concretos, las vaguedades te dan vía libre a crear acoplamientos innecesarios y en general a crear codigo que es difícil de testear, debugar y mantener. 

Bien
{% highlight ruby %}
  def agregar(ingrediente)
    ...
  end
{% endhighlight %}

Mal
{% highlight ruby %}
  # Lo se, es una exageración 
  def gestionar(empresa)
    …
  end
{% endhighlight %}

Evitar el uso de nombres de variables de un solo carácter o con nombres graciosos o irrelevantes, es mejor usar nombres que describen lo que está pasando por que pueden ahorrar minutos valiosos de lectura.

Bien
{% highlight ruby %}
  area_circulo = PI * pow(radio, 2)
{% endhighlight %}

Mal
{% highlight ruby %}
  pikachu = PI * pow(radio, 2)
{% endhighlight %}

Esta es difícil, especialmente porque no siempre es posible, cuantos menos parámetros tenga una función, será mucho más fácil escribir unit tests, esto se aprecia mejor cuando desarrollas usando técnicas de TDD. Te deseo suerte si decides testear una función con 5 parámetros.


Si necesita comentarios es que hay una mejor forma de hacerlo. Esta es la más importante y la que resume mejor esta idea de programar.  Cuando abusamos de los comentarios, es porque nos damos cuenta que el código no es lo suficientemente expresivo para explicar por sí mismo lo que hace. Si me encuentro ante una situación así, me paro y pienso si hay una forma más sencilla de expresarme. A veces es difícil, a veces es fácil, a veces inevitable.

Bien
{% highlight ruby %}
  area_circulo = PI * pow(radio, 2)
{% endhighlight %}

Mal
{% highlight ruby %}
  # Este codigo sirve para calcular el area del círculo
  v = Math.acos(0) * (r * r)
{% endhighlight %}

Sé que algunas de estas ideas son de sentido común, pero es en conjunto donde se ve que funcionan bien, cuando soy capaz de leer a simple vista un programa y entiendo lo que está ocurriendo sin profundizar excesivamente en los detalles técnicos, mi niño interior, que escribía por diversión se siente un poco más contento.