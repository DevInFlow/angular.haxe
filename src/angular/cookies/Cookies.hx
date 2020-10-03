package angular.cookies;

@:injectionName("$cookies")
extern class Cookies {
	public function remove(key:String, ?options:Dynamic):Void;
}
