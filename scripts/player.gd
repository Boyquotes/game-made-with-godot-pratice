extends KinematicBody

var velocity = Vector3.ZERO
const GRAVITY = 1500
var key = false

func _ready():
	pass 

func _physics_process(delta):
	velocity.y -= GRAVITY * delta
	
	# movimenta o player para frente e para trás #
	var move_up = Input.get_action_strength("input_up")
	velocity.z = move_up * -20
	
	var rotate_left_right = Input.get_action_strength("input_left") - Input.get_action_strength("input_right")
	rotation.y += rotate_left_right * delta * 4
	
	velocity = Vector3(0, velocity.y, velocity.z).rotated(Vector3(0, 1, 0), rotation.y)
	velocity = move_and_slide(velocity, Vector3.UP)

	$"../".get_node("Camera").transform.origin = transform.origin + Vector3(0, 30, 20)
