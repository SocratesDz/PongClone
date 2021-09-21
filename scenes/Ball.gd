extends KinematicBody2D

const SPEED =  200
var velocity = Vector2.ZERO

func _ready():
	velocity = Vector2(-1, 1)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta * SPEED)
	if(collision):
		var reflect = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal).normalized()
		move_and_collide(reflect)
