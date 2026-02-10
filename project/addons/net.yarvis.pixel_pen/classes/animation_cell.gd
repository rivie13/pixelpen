@tool
extends Resource
class_name AnimationCell

const Frame = preload("res://addons/net.yarvis.pixel_pen/classes/frame.gd")
const PixelPenProject = preload("res://addons/net.yarvis.pixel_pen/classes/pixel_pen_project.gd")
const AnimationCellScript = preload("res://addons/net.yarvis.pixel_pen/classes/animation_cell.gd")


@export var cell_uid : Vector3i
@export var frame : Resource


static func create(uid : Vector3i):
	var cell := AnimationCellScript.new()
	cell.cell_uid = uid
	return cell


func get_data() -> Dictionary:
	return {
		"cell_uid" : var_to_str(cell_uid),
		"frame_uid" : var_to_str(frame.frame_uid)
	}


func from_data(json_data : Dictionary, project : PixelPenProject) -> Error:
	if json_data.has("cell_uid"):
		cell_uid = str_to_var(json_data["cell_uid"]) as Vector3i
	else:
		return FAILED
	if json_data.has("frame_uid"):
		var frame_uid = str_to_var(json_data["frame_uid"]) as Vector3i
		frame = project.get_pool_frame(frame_uid, project.use_sample)
	else:
		return FAILED
	
	return OK
