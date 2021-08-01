
/* ----------------------------------------------------------------------------
Function: btc_body_fnc_bagRecover_s

Description:
    Add respawn tickets when a body bag is provided.

Parameters:
    _bodyBag - Body bag. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject] call btc_body_fnc_bagRecover_s;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_bodyBag", objNull, [objNull]]
];

private _ticket = 0;
if (_bodyBag getVariable ["btc_isDeadPlayer", false]) then {
    _ticket = btc_body_bagTicketPlayer;
} else {
    btc_respawn_ticketDecimal = btc_respawn_ticketDecimal + btc_body_bagTicketAI;
};

private _ticketValue = 0;
if (btc_p_respawn_ticketsShare) then {
    _ticketValue = [btc_player_side, _ticket + btc_respawn_ticketDecimal] call BIS_fnc_respawnTickets;
} else {
    private _uid = _bodyBag getVariable ["btc_UID", ""];
    private _player = _uid call BIS_fnc_getUnitByUID;
    if !(isNull _player) then {
        [_player, _ticket + btc_respawn_ticketDecimal] call BIS_fnc_respawnTickets;
    };
    btc_respawn_tickets set [
        _uid,
        _ticket + btc_respawn_ticketDecimal + (btc_respawn_tickets getOrDefault [_uid, 0])
    ];
};
btc_respawn_ticketDecimal = btc_respawn_ticketDecimal - floor btc_respawn_ticketDecimal;
publicVariable "btc_respawn_ticketDecimal";

deleteVehicle _bodyBag;

[22, _ticketValue + btc_respawn_ticketDecimal] remoteExecCall ["btc_fnc_show_hint", remoteExecutedOwner];
