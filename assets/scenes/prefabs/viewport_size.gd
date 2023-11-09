extends Node2D

@export var viewport_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	viewport_size = get_viewport_rect().size
