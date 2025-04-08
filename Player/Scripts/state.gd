class_name State extends Node

## Stores a refernce to the player that this State belongs to
static var player : Player


func _ready():
	pass

## What happens when the player enters this state
func Enter() -> void:
	pass

func Exit() -> void:
	pass

func Process( _delta : float)
