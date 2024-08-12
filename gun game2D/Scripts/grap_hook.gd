extends CharacterBody2D

var speed: int = 300
var direction: Vector2 = Vector2.ZERO
var player: CharacterBody2D
@onready var chain: Line2D = $Chain
var cancel: bool = false 

func _process(delta):
	#makes chain follow player
	chain.set_point_position(0, to_local(player.position))
	
	if Input.is_action_just_pressed("space"):
		player.hooked = false
		player.can_hook = true
		cancel = true
		queue_free()
	
	if move_and_slide() and !cancel:
		velocity = Vector2(0, 0)
		player.hooked = true
		player.hook_position = global_position
	else:
		velocity = direction * speed
