extends Area

func _ready():
	pass

func _process(delta):
	pass

func _on_portal_body_entered(body):
	if body.name == "player":
		get_tree().change_scene("res://scenes/level_02.tscn")
