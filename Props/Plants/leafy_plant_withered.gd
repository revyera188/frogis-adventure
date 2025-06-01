class_name LeafyPlantWithered
extends Node

func _ready():
	$HitBox.Damaged.connect( TakeDamage )
	pass


func TakeDamage( _damage : int) -> void:
	queue_free()
