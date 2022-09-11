extends Node

## ----------- AudioStreamPlayer Interactive -----------
## ----------- Made by Danny Garay (@dannygaray60) -----------

## tracks separados por comas (0,1,2,etc)

## los tracks usados para musica high (gameplay)
export var high_tracks : String = "0"

## tracks que serán para la musica base (para dialogos, bajar la tensión)
export var low_tracks : String = "0"

var Tw : Tween

## lista de audiostreamplayers
var audio_tracks : Array = []

var _low_tracks : Array
var _high_tracks : Array

var _all_is_stopped : bool = true

func _ready() -> void:
	
	## instanciar tween
	var tween_node = Tween.new()
	add_child(tween_node)
	Tw = tween_node
	Tw.connect("tween_completed", self, "_on_Tween_tween_completed")

	_low_tracks = low_tracks.split(",")
	_high_tracks = high_tracks.split(",")
	
	for track in get_children():
		if track is AudioStreamPlayer:
			## guardar los decibelios originales
			track.editor_description = str(track.volume_db)
			## mutear
			track.volume_db = -80.0
			## agregar
			audio_tracks.append(track)

func is_stopped() -> bool:
	return _all_is_stopped

## reproducir un track en especifico usando el index
func play_track(track:int, fadein_time: float = 1.0) -> void:
	_play_muted_all()
	if fadein_time >= 0.0:
		_fade(audio_tracks[track], true, fadein_time)

## detener track especifico
func stop_track(track:int, fadeout_time: float = 1.0) -> void:
	_fade(audio_tracks[track], false, fadeout_time)

## reproducir la lista de tracks definidos para high o low
func play(opt : String = "high", fadein_time: float = 1.0) -> void:
	var i : int = 0
	var track_list : Array
	
	if opt == "high":
		stop("low", fadein_time)
		track_list = _high_tracks
	
	elif opt == "low":
		stop("high", fadein_time)
		track_list = _low_tracks
	
	## reproducir todas las pistas muteadas
	_play_muted_all()
	
	## recorrer todos los tracks
	for t in audio_tracks:
		
		## si el index está dentro de los tracks, ese será el que suene
		if str(i) in track_list:
			_fade(audio_tracks[i], true, fadein_time)
		
		i += 1

## detener la lista de tracks definidos para high o low
func stop(opt : String = "high", fadeout_time: float = 1.0) -> void:
	var i : int = 0
	var track_list : Array
	
	if opt == "high":
		track_list = _high_tracks
	elif opt == "low":
		track_list = _low_tracks
	
	## recorrer todos los tracks
	for t in audio_tracks:
		
		## si el track esta en high y low, evitar mutearlo
		if str(i) in _high_tracks and str(i) in _low_tracks:
			pass
		
		## si el index está dentro de los tracks, ese será el que se mutee
		elif str(i) in track_list:
			_fade(audio_tracks[i], false, fadeout_time)
			
		i += 1

## reproducir todos los tracks
func play_all(fadein_time : float = 1.0) -> void:
	for t in audio_tracks:
		_fade(t, true, fadein_time)
		t.play()
	_all_is_stopped = false

## detener todos los tracks
func stop_all(fadeout_time : float = 1.0):
	if _all_is_stopped == true:
		return
	for t in audio_tracks:
		_fade(t, false, fadeout_time)
	_all_is_stopped = true

## para reproducir todos los tracks, pero sin volumen
func _play_muted_all() -> void:
	
	if _all_is_stopped == false:
		return
	
	for t in audio_tracks:
		t.volume_db = -80.0
		t.play()

	_all_is_stopped = false

## obtener los decibelios originales, guardados en editor_description
func _original_db(audiotrack:AudioStreamPlayer) -> float:
	return float(audiotrack.editor_description)

## aplicar fade al volumen del streamplayer
func _fade(audiotrack:AudioStreamPlayer, fadein:bool=true, time:float=0.5) -> void:

	## fadein
	var from_db : float = audiotrack.volume_db
	var to_db : float = _original_db(audiotrack)
	var easetw : int = Tween.EASE_OUT
	
	var transtw : int = Tween.TRANS_EXPO
	
	## fadeout
	if fadein == false:
		from_db = audiotrack.volume_db
		to_db = -80.0
		easetw = Tween.EASE_IN
	
	## se utiliza remove en vez de stop para asegurarse
	## de que no haya ningun tween ejecutandose
	Tw.remove(audiotrack, "volume_db")
	
	Tw.interpolate_property(
		audiotrack, "volume_db", from_db, to_db, time, transtw, easetw
	)

	Tw.start()

## detener musica al final del fadeout solo si se detuvo usando stop_all()
func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	if (
		key == ":volume_db" and
		object is AudioStreamPlayer and
		object.volume_db == -80 and
		_all_is_stopped == true
	):
		object.stop() ## stop de audiostreamplayer
