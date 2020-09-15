package angular.macro;

import haxe.macro.Expr.Field;
import haxe.macro.Expr;
import haxe.macro.Context;

class ConfigMacro {
	macro static public function build(module:String):Array<Field> {
		var fields:Array<Field> = Context.getBuildFields();

		var _angular = {
			name: "_angular",
			access: [Access.APublic],
			kind: FieldType.FVar(macro:angular.Module),
			pos: Context.currentPos()
		}
		var stateProvider = {
			name: "stateProvider",
			access: [Access.APublic],
			kind: FieldType.FVar(macro:angular.ui.router.state.StateProvider),
			pos: Context.currentPos()
		};

		var urlRouterProvider = {
			name: "urlRouterProvider",
			access: [Access.APublic],
			kind: FieldType.FVar(macro:angular.ui.router.UrlRouterProvider),
			pos: Context.currentPos()
		};

		
		var ctor = {
			name: "new",
			access: [Access.APublic],
			kind: FieldType.FFun({
				expr: macro {
					this._angular = angular.Angular.module($v{module});
					this._angular.config((stateProvider:angular.ui.router.state.StateProvider, urlRouterProvider:angular.ui.router.UrlRouterProvider) -> {
						this.stateProvider = stateProvider;
						this.urlRouterProvider = urlRouterProvider;
						this.initialize();
					});
				},
				args: [],
				ret: null,
			}),

			pos: Context.currentPos()
		}

		fields.push(_angular);
		fields.push(stateProvider);
		fields.push(urlRouterProvider);

		fields.push(ctor);

		return fields;
	}
}
