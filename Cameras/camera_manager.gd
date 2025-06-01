extends Node

@export var player: CharacterBody2D
@export var Camera_Zone0: PhantomCamera2D
@export var Camera_Zone1: PhantomCamera2D

var current_camera_zone: int = 0

func _ready():
	pass

func _process( delta ):
	pass

func update_current_zone( body, zone_a, zone_b ):
	if body == player:
		match current_camera_zone:
			zone_a:
				current_camera_zone = zone_b
			zone_b:
				current_camera_zone = zone_a
		update_camera()

func update_camera():
	var cameras = [ Camera_Zone0, Camera_Zone1 ]
	for camera in cameras:
		if camera != null:
			camera.priority = 0
	
	match current_camera_zone: 
		0:
			Camera_Zone0.priority = 1
		1: 
			Camera_Zone1.priority = 1

func _on_zone_0_1_body_entered( body: Node2D ) -> void:
	update_current_zone( body, 0, 1 )
