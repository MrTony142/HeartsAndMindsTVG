#include "\a3\editor_f\Data\Scripts\dikCodes.h"
#define BTC_PLAY_FBSOUND true    //set false if you do not want a "key-pressed-feedback" (sound)
#define BTC_FBSOUND "ClickSoft"  //really quiet sound

//Order Stop
["Hearts and Minds: Mission", "btc_HaM_Action_civStop", ["Civil Order: Stop", "Order a civilian to stop"],{
  if (isNull objectParent player) then {
    [1] call btc_fnc_int_orders;
    if (BTC_PLAY_FBSOUND) then {
      playSound BTC_FBSOUND;
    };
  };
}, {}] call CBA_fnc_addKeybind;

//Order Get down
["Hearts and Minds: Mission", "btc_HaM_Action_civGetDown", ["Civil Order: Get down", "Order a civilian to get down"],{
  if (isNull objectParent player) then {
    [2] call btc_fnc_int_orders;
    if (BTC_PLAY_FBSOUND) then {
      playSound BTC_FBSOUND;
    };
  };
}, {}] call CBA_fnc_addKeybind;

//Order Go away
["Hearts and Minds: Mission", "btc_HaM_Action_civGoAway", ["Civil Order: Go Away", "Order a civilian to go away"],{
  if (isNull objectParent player) then {
    [3] call btc_fnc_int_orders;
    if (BTC_PLAY_FBSOUND) then {
      playSound BTC_FBSOUND;
    };
  };
}, {}] call CBA_fnc_addKeybind;
