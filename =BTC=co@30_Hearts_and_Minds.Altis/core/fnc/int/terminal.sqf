
params ["_terminal"];

private _action = ["Open", localize "STR_BTC_HAM_SIDE_HACK_ACEACTION", "\A3\ui_f\data\igui\cfg\simpleTasks\types\intel_ca.paa", {
    //Start Hacking
    params ["_terminal"];
    [_terminal, 3] call BIS_fnc_dataTerminalAnimate;
    btc_side_done = true;
    publicVariable "btc_side_done";
}, {isNil "btc_side_done"}] call ace_interact_menu_fnc_createAction;

[_terminal, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
