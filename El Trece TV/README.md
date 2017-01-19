#El Trece TV.


##Comentarios de desarrollo.
* Se toma el feed de TN (Todo Noticias) Porque posee mas contenido multimedia que la alternativa que encontré en http://www.eltrecetv.com.ar/rss.xml. Si bien el mismo podria ser intercambiado modificando la constante FEED_URL en ARFeedManager.h se espera que el feed contenga un String HTML en el campo content (que es el que mostramos en la web view).
* Se utilizo una biblioteca externa para el manejo de RSS.
* Se toma cada 'record' del feed rss en forma horizontal como si perteneciera a una categoria distinta. Si el feed tuviera un campo 'category' podriamos filtrar por él para lograr un efecto más elaborado.