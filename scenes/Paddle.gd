class_name Paddle
extends KinematicBody2D

const MOVE_SPEED = 200

var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float):
	_process_input()
	_process_movement(delta)

func _process_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= MOVE_SPEED
	if Input.is_action_pressed("ui_down"):
		velocity.y += MOVE_SPEED

func _process_movement(delta: float):
	move_and_collide(velocity * delta)
