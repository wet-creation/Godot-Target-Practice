extends Node2D

class_name Bullet
const my_scene: PackedScene = preload("res://Objects/Bullet/Bullet.tscn")
@export var hitbox: Hitbox
@export var speed: int = 500
var _direction: Vector2

var _owner: Entity


		
func _ready() -> void:
	if owner is Player:
		hitbox.set_collision_layer(2)
	else:
		hitbox.set_collision_layer(1)

@onready var sprite := %Sprite2D
var _rotation_speed = 500

func _physics_process(delta: float) -> void:
	self.translate(speed * _direction.normalized() * delta)
	sprite.rotation_degrees += clamp(delta * _rotation_speed, 0, 360)
	
	
static func new_bullet(direction: Vector2, owner: Entity) -> Bullet:
	var bullet = my_scene.instantiate()
	bullet._direction = direction
	bullet._owner = owner
	return bullet
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
