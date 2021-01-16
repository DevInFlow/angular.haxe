package angular.ngModel;

import haxe.extern.EitherType;

@:injectionName("ngModel.NgModelController")
extern class NgModelController {
	@:native("$viewValue")
	public var viewValue:Dynamic;
	@:native("$modelValue")
	public var modelValue:Dynamic;
	@:native("$parsers")
	public var parsers:Array<Dynamic->EitherType<Void, Dynamic>>;
	@:native("$formatters")
	public var formatters:Array<Dynamic->EitherType<Void, Dynamic>>;
	@:native("$validators")
	public var validators:Dynamic;
	@:native("$asyncValidators")
	public var asyncValidators:Dynamic;
	@:native("$viewChangeListeners")
	public var viewChangeListeners:Array<Dynamic->EitherType<Void, Dynamic>>;
	@:native("$error")
	public var error:Dynamic;
	@:native("$pending")
	public var pending:Dynamic;
	@:native("$untouched")
	public var untouched:Bool;
	@:native("$touched")
	public var touched:Bool;
	@:native("$pristine")
	public var pristine:Bool;
	@:native("$dirty")
	public var dirty:Bool;
	@:native("$valid")
	public var valid:Bool;
	@:native("$invalid")
	public var invalid:Bool;
	@:native("$name")
	public var name:String;

	@:native("$render")
	public var render:Void->Void;
	@:native("$isEmpty")
	public function isEmpty(value:Dynamic):Bool;
	@:native("$setPristine")
	public function setPristine():Void;
	@:native("$setDirty")
	public function setDirty():Void;
	@:native("$setUntouched")
	public function setUntouched():Void;
	@:native("$setTouched")
	public function setTouched():Void;
	@:native("$rollbackViewValue")
	public function rollbackViewValue():Void;
	@:native("$validate")
	public function validate():Void;
	@:native("$commitViewValue")
	public function commitViewValue():Void;
	@:native("$setViewValue")
	public function setViewValue(value:Dynamic, ?trigger:String):Void;
	@:native("$overrideModelOptions")
	public function overrideModelOptions(options:Dynamic):Void;
	@:native("$processModelValue")
	public function processModelValue():Void;
	@:native("$setValidity")
	public function setValidity(validationErrorKey:String, isValid:Bool):Void;
}
