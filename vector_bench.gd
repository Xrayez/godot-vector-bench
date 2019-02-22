extends Node2D
tool

enum VectorOperation {
	OP_NONE,
	OP_BOUNCE,
	OP_PROJECT
	OP_REFLECT,
	OP_SLIDE,
	OP_SNAPPED,
	OP_TANGENT
}

export (VectorOperation) var operation = VectorOperation.OP_NONE


func _process(_delta):

	var a = $vec.get_child(1)
	var b = $vec_param.get_child(1)
	var result = $vec_result.get_child(1)

	var vec = a.global_position
	var vec_param = b.global_position
	var vec_result = result.global_position

	match operation:
		VectorOperation.OP_BOUNCE:
			vec_result = vec.bounce(vec_param.normalized())

		VectorOperation.OP_PROJECT:
			vec_result = vec.project(vec_param)

		VectorOperation.OP_REFLECT:
			vec_result = vec.reflect(vec_param.normalized())

		VectorOperation.OP_SLIDE:
			vec_result = vec.slide(vec_param.normalized())

		VectorOperation.OP_SNAPPED:
			vec_result = vec.snapped(vec_param)

		VectorOperation.OP_TANGENT:
			vec_result = vec.tangent()

	result.global_position = vec_result
