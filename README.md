# Interactive Music Addon for Godot 3
### Tested in Godot 3.5
Este es un pequeño addon para permitir crear música interactiva. Por ejemplo que una canción cambie de intensidad (de "fuerte/enérgica" a "bajo/tranquilo") dependiendo de lo que requiera el desarollador.

***

# How to use
Copia la carpeta 'addons/interactive-music-g3' a la carpeta 'addons' de tu proyecto y después activa el plugin desde los ajustes del proyecto.
Una vez activado, podrás agregar un nodo 'AudioStreamPlayerInteractive'
![](add.png)
El siguiente paso es agregar todos los tracks que compongan tu canción interactiva como hijos del nodo AudioStreamPlayerInteractive.
![](add-edittracks.png)
Luego debes definir cuales tracks se usarán para gameplay (high_tracks) y cuales serán los que usarás para cosas más tranquilas como los diálogos o al entrar a interiores (low_tracks). Para esto usarás el número index del nodo (comenzando desde el cero), puedes definir todas las pistas que quieras o incluso usar una misma pista en los dos diferentes modos (high-low) y lo debes separar con una coma.
Una vez realizado esto, podrás utilizar los métodos que incorpora este plugin.

***

# Methods
---
### void: play(opt : String = "high", fadein_time: float = 1.0)
Reproduce todas las pistas definidas en 'high' o 'low' Por ejemplo:
'$AudioStreamPlayerInteractive.play("high")'
'$AudioStreamPlayerInteractive.play("low", 5.5)'
Puedes añadir opcionalmente un número flotante para definir el fadein/out del volumen.
### void: stop(opt : String = "high", fadeout_time: float = 1.0)
Reproduce todas las pistas definidas en 'high' o 'low'. Puedes añadir opcionalmente un fadeout.
### void: play_track(track:int, fadein_time: float = 1.0)
Reproduce uno de los tracks en específico indicando su número index.
### void: stop_track(track:int, fadeout_time: float = 1.0)
Detiene uno de los tracks en específico indicando su número index.
### void: play_all(fadein_time : float = 1.0)
Reproduce todas las pistas que sean hijos del nodo AudioStreamPlayerInteractive. Puedes añadir opcionalmente fadein.
### void: stop_all(fadeout_time : float = 1.0)
Detiene todas las pistas que sean hijos del nodo AudioStreamPlayerInteractive. Puedes añadir opcionalmente fadeout.
### bool: is_stopped()
Retorna 'true' si todas las pistas del nodo AudioStreamPlayerInteractive están detenidas. Si al menos una de ellas está siendo reproducida retornará 'false'.

***

# Cosas que pueden fallar
- Si no se define de manera correcta los tracks o parámetros al usar este plugin pueden provocar bugs debido a que no se toleran los errores.
- También debo admitir que el fadein/out no es del todo preciso, esto debido a cómo se manejan los valores de decibelios respecto a un número flotante.

# Cosas que faltan
Hice este plugin para uso personal de mi juego (Toziuha Night), por lo que si hay alguna caracteristica que piensas que falte, ¡eres bienvenido a agregar más funcionalidades a este plugin!

# Credits

This plugin was made by [Danny Garay](https://twitter.com/dannygaray60)

**Icon made by svgrepo.com**

Website
[https://dannygaray60.github.io/](https://dannygaray60.github.io/)

Email
[dannygaray60@gmail.com](mailto:dannygaray60@gmail.com)

Support me with a donation here
[https://ko-fi.com/dannygaray60](https://ko-fi.com/dannygaray60)