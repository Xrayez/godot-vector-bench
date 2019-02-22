tool
extends Node2D

export var color = Color(1, 0, 0)
export var width = 1.0


func _process(_delta):
	update()


func _draw():
	var a = get_child(0) as Node2D
	var b = get_child(1) as Node2D
	draw_line(a.global_position, b.global_position, color, width, true)
