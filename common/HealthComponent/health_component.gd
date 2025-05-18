extends Node2D


class_name HealthComponent 
signal hp_damaged()
signal death()
@export var max_health: int = 100
@onready var _health: int = max_health




func get_hit(amount: int):
	_health -= amount
	if _health <= 0:
		death.emit()
	hp_damaged.emit()
		
