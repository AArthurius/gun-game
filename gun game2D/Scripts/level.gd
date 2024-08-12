extends Node2D

var grapHook: PackedScene = preload("res://Scenes/grap_hook.tscn")

func _on_player_hook(pos, direction):
	var hook = grapHook.instantiate() as CharacterBody2D
	hook.position = pos
	hook.direction = direction
	hook.rotation = $Player/lookAt.rotation
	hook.player = $Player
	print("hook")
	$".".add_child(hook)
