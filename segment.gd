tool
extends Node2D

export var color = Color(1, 0, 0)
export var width = 1.0


func _process(delta):
	update()


func _draw():
	draw_line($a.global_position, $b.global_position, color, width, true)
	