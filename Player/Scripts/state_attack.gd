class_name StateAttack 
extends State

var attacking : bool = false

@export var attack_sound : AudioStream
@export_range(1,20,0.5) var decelerate_speed : float = 5.0

@onready var idle : State = $"../Idle"
@onready var walk : State = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

## What happens when the player enters this state
func enter() -> void:
	player.update_animation("attack")
	animation_player.animation_finished.connect( EndAttack )
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(1.4, 1.6)
	audio.play()
	
	attacking = true
	pass

## What happens when the player exits this state
func exit() -> void:
	animation_player.animation_finished.disconnect( EndAttack )
	attacking = false
	pass

## What happens during the _process update in this state
func process( _delta : float) -> State:
	player.velocity -= player.velocity * decelerate_speed *_delta
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

## What happens during the _physics_process update in this state
func physics(_delta : float) -> State:
	return null

## What happens with input events in this state
func handle_input(_event : InputEvent) -> State:
	return null


func EndAttack( _newAnimName : String ) -> void:
	attacking = false
