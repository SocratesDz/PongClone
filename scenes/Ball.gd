class_name Ball
extends KinematicBody2D

const SPEED := 230
var velocity: Vector2 = Vector2.ZERO

onready var impact_sound = $ImpactSound

func _ready() -> void:
	velocity = Vector2(1, 1)

func _physics_process(delta) -> void:
	var collision = move_and_collide(velocity * delta * SPEED)
	if(collision):
		var reflect = collision.remainder.bounce(collision.normal) + collision.collider_velocity.normalized()
		velocity = velocity.bounce(collision.normal).normalized()
		# warning-ignore:return_value_discarded
		move_and_collide(reflect)
		_play_impact_sound()

func _play_impact_sound():
	impact_sound.play()
