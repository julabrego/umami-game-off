extends Node2D

@export var pushForce = 5000

@export var bodyPath: NodePath = "Player/CharacterBody2D"

@onready var body: CharacterBody2D = get_node(bodyPath)

func _physics_process(_delta):
	if body.move_and_slide(): # true if collided
		for i in body.get_slide_collision_count():
			var col = body.get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				col.get_collider().apply_force(col.get_normal() * -pushForce)
