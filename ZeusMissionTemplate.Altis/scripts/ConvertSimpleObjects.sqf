private _objects = (getMissionLayerEntities "Simple Objects") select 0;

if (isNil "_objects") exitWith {};

{
    if (!isSimpleObject _x) then {
        private _path = getModelInfo _x select 1;
		private _vector = [vectorDir _x, vectorUp _x];
        private _simpleObject = createSimpleObject [_path, getPosWorld _x];
        _simpleObject setVectorDirAndUp _vector;
        deleteVehicle _x;
    };
} forEach _objects;
