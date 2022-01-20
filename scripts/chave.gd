extends StaticBody

var player_in_area = false
var player 
var sound_key

func _ready():
	player = $"../player"
	sound_key = $"../get_key"
	pass 

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interation"):
		player.key = true
		sound_key.play()
		queue_free()

func _on_Area_body_entered(body):
	if body.name == "player":
		player_in_area = true

func _on_Area_body_exited(body):
	if body.name == "player":
		player_in_area = false
