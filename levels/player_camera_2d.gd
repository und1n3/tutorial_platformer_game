extends Camera2D

@export_category("Follow Character")
@export var player: CharacterBody2D

@export_category("Camera Smoothing") # To get a name heading on the inspector
@export var smoothing_enabled : bool
@export_range(1,10) var smoothing_distance : int = 8

var weight : float

func _ready():
	weight = float(11-smoothing_distance) / 100  #11 because is max smoothing distance +1
	# we move it into ready to not be always calculating this

func _physics_process(delta):
	if player != null:
		var camera_position : Vector2
		if smoothing_enabled:
			camera_position = lerp(global_position,player.global_position, weight) # linear interpolation
		else:
			camera_position = player.global_position
		
		global_position = camera_position
		
