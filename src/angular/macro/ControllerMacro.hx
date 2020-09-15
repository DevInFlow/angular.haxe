package angular.macro;

import haxe.macro.Expr.Field;
import haxe.macro.Expr;
import haxe.macro.Context;

class ControllerMacro {
	macro static public function build(module:String):Array<Field> {
		var fields:Array<Field> = Context.getBuildFields();

	var className:String = Context.getLocalClass().get().name;

		var _angular = {
			name: "_angular",
			access: [Access.APublic],
			kind: FieldType.FVar(macro:angular.Module),
			pos: Context.currentPos()
		}
		var scope = {
			name: "scope",
			access: [Access.APublic],
			kind: FieldType.FVar(macro:angular.service.Scope),
			pos: Context.currentPos()
		};

		var rootScope = {
			name: "rootScope",
			access: [Access.APublic],
			kind: FieldType.FVar(macro:angular.service.RootScope),
			pos: Context.currentPos()
		};

		var http = {
			name: "http",
			access: [Access.APublic],
			kind: FieldType.FVar(macro:angular.service.Http),
			pos: Context.currentPos()
		};

		var state = {
			name: "state",
			access: [Access.APublic],
			kind: FieldType.FVar(macro:angular.ui.router.state.State),
			pos: Context.currentPos()
		};

		var stateParams = {
			name: "stateParams",
			access: [Access.APublic],
			kind: FieldType.FVar(macro:angular.ui.router.state.StateParams),
			pos: Context.currentPos()
        };
        
        var ctor = {
			name: "new",
			access: [Access.APublic],
			kind: FieldType.FFun({
				expr: macro {
					this._angular = angular.Angular.module($v{module});
					this._angular.controller($v{className},
						(scope:angular.service.Scope, rootScope:angular.service.RootScope, http:angular.service.Http, state:angular.ui.router.state.State,
								stateParams:angular.ui.router.state.StateParams) -> {
								this.scope = scope;
								this.rootScope = rootScope;
								this.http = http;
								this.state = state;
								this.stateParams = stateParams;

								this.initialize();
							});
				},
				args: [],
				ret: null,
			}),

			pos: Context.currentPos()
        }
        

		fields.push(_angular);
		fields.push(scope);
		fields.push(rootScope);
		fields.push(http);
		fields.push(state);
		fields.push(stateParams);
		fields.push(ctor);

		return fields;
	}
}
