@tool
class_name DataBranch
extends Resource

const Branch = preload("res://addons/net.yarvis.pixel_pen/ui/layout_split/branch.gd")


@export var data : Array[Branch]

## Call this to prevent branch lock previus size
func clear_cache():
	for branch in data:
		branch.parent_rect = Rect2()
		branch.child_rect = Rect2()
