tool
extends Node2D

enum VectorOperation {
	OP_NONE,
	OP_BOUNCE,
	OP_PROJECT
	OP_REFLECT,
	OP_SLIDE,
	OP_SNAPPED,
	OP_TANGENT
}

export (VectorOperation) var operation = OP_NONE


func _process(delta):
	
	var vec = $vec/b.global_position
	var vec_param = $vec_param/b.global_position
	var vec_result = $vec_result/b.global_position
	
	match operation:
		OP_BOUNCE:
			vec_result = vec.bounce(vec_param.normalized())
			
		OP_PROJECT:
			vec_result = vec.project(vec_param)
			
		OP_REFLECT:
			vec_result = vec.reflect(vec_param.normalized())
			
		OP_SLIDE:
			vec_result = vec.slide(vec_param.normalized())
			
		OP_SNAPPED:
			vec_result = vec.snapped(vec_param)
			
		OP_TANGENT:
			vec_result = vec.tangent()
	
	$vec_result/b.global_position = vec_result
