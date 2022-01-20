extends StaticBody

var player_in_the_door = false
var player 
var door_open_sound

func _ready():
	player = $"../player"
	door_open_sound = $"../open_door"

func _process(delta):
	if player_in_the_door and Input.is_action_just_pressed("interation"):
		if player.key:
			player.key = false
			door_open_sound.play()
			$porta_anim.play("open")

func _on_Area_body_entered(body):
	if body.name == "player":
		player_in_the_door = true

func _on_Area_body_exited(body):
	if body.name == "player":
		player_in_the_door = false
