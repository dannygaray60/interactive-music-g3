# Interactive Music Addon for Godot 3
### Tested in Godot 3.5
This is a small addon to allow to create interactive music. For example a song can change intensity (from "loud/energetic" to "low/quiet") depending on what the developer requires.

***

# How to use
Copy the `addons/interactive-music-g3` folder to the `addons` folder of your project and then activate the plugin from the project settings.

Once activated, you will be able to add an `AudioStreamPlayerInteractive` node.

![](https://raw.githubusercontent.com/dannygaray60/interactive-music-g3/main/static/add_node.png)

The next step is to add all the tracks that make up your interactive song as children of the AudioStreamPlayerInteractive node.

![](https://raw.githubusercontent.com/dannygaray60/interactive-music-g3/main/static/add_and_set_tracks.png)

Then you must define which tracks will be used for gameplay (high_tracks) and which will be used for quieter things like dialogues or when entering interiors (low_tracks). For this you will use the index number of the node (starting from zero), you can define as many tracks as you want or even use the same track in the two different modes (high-low) and you must separate it with a comma.
Once this is done, you will be able to use the methods included in this plugin.

***

# Methods
---
### void: play(opt : String = "high", fadein_time: float = 1.0)
Plays all tracks set to `high` or `low` For example:

`$AudioStreamPlayerInteractive.play("high")`

`$AudioStreamPlayerInteractive.play("low", 5.5)`

You can optionally add a float number to define the volume fadein/out.

### void: stop(opt : String = "high", fadeout_time: float = 1.0)
Stops all tracks set to `high` or `low`. You can optionally add a fadeout.

### void: play_track(track:int, fadein_time: float = 1.0)
Plays one of the specific tracks indicating its index number.

### void: stop_track(track:int, fadeout_time: float = 1.0)
Stops one of the specific tracks indicating its index number.

### void: play_all(fadein_time : float = 1.0)
Plays all tracks that are children of the AudioStreamPlayerInteractive node. You can optionally add fadein.

### void: stop_all(fadeout_time : float = 1.0)
Stops all tracks that are children of the AudioStreamPlayerInteractive node. You can optionally add fadeout.

### bool: is_stopped()
Returns `true` if all tracks of the AudioStreamPlayerInteractive node are stopped. If at least one of them is playing it will return `false`.

***

# Things that can fail
- If you don't define the tracks or parameters correctly when using this plugin it can cause bugs because errors are not tolerated.

- I must also admit that the fadein/out is not quite accurate, this is due to how decibel values are handled with respect to a floating number.

# Things that are missing
I made this plugin for personal use for my game (Toziuha Night), so if there are any features you think are missing, you are welcome to add more functionality to this plugin!

# Credits

This plugin was made by [Danny Garay](https://twitter.com/dannygaray60)

**Icon made by svgrepo.com**

Website
[https://dannygaray60.github.io/](https://dannygaray60.github.io/)

Email
[dannygaray60@gmail.com](mailto:dannygaray60@gmail.com)

Support me with a donation here
[https://ko-fi.com/dannygaray60](https://ko-fi.com/dannygaray60)