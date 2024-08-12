extends CharacterBody2D

const move_speed: int = 200
const hook_speed: int = 500
const acc: int = 1

@onready var hook_check: RayCast2D = $lookAt/RayCast2D
@onready var target: Sprite2D = $lookAt/Target
var hooked: bool = false
var can_hook: bool = true
var hook_position: Vector2

signal hook(pos: Vector2, direction: Vector2)

func _process(delta):
	movement()
	if !hook_check.is_colliding():
		target.visible = false
	elif hook_check.is_colliding() and can_hook:
		show_hook_point()
		if Input.is_action_just_pressed("hook") and can_hook:
			var aiming_direction: Vector2 = (get_global_mouse_position() - position).normalized()
			hook.emit(position, aiming_direction)
			can_hook = false
			target.visible = false

func movement():
	if !hooked:
		velocity = Input.get_vector("left", "right", "up", "down") * move_speed
	else:
		velocity = (hook_position - position).normalized() * hook_speed
	move_and_slide()

func show_hook_point():
	target.global_position = hook_check.get_collision_point()
	target.visible = true
	target.global_rotation = 0
