# Event driven BLoC's switch and button widgets

The project contains several switch and button widgets built using __BLoC__ technology, allowed to minimize the scene rendering when updating the GUI.

## Introduction

Three pairs of switches and pair of buttons have been created, based on the processing of callbacks of __GestureDetector__. They differ in functionality:
* first pair: __FlatSwitch__ and __FlatRoundedSwitch__ react to clicks and process __onTap__ callback,
* second: __FlatAdvancedSwitch__ and __FlatAdvancedRoundedSwitch__ handle callbacks __onTapDown__ and __onTapUp__,
* third: __FlatButton__ and __FlatRoundedButton__ handle callbacks __onTapDown__ and __onTapUp__

## Widgets brief description

As the names suggest, one of the widgets of the pair is geometrically a rectangle, the second is a rectangle with borders and rounded corners: there are users who like this. Accordingly, the functionality changes a little: you can adjust the width, color and radius of borders. All other parameters: background color, image and icon color are standard. Each widget has an additional attribute: an external method that causes some action when the switch is clicked. In __Demo__, these functions are reduced to influencing other switches: either pseudo-pressing them, or switching them to enable/disable states.
The logic of widgets is subject to the logic of state machines built into the corresponding BLoC. Their diagrams are given below:

### State machine I (__FlatSwitch__ and __FlatRoundedSwitch__ classes)

![switch_2_state_a](https://github.com/mk590901/BLoC-Switches/assets/125393245/f1dbb008-ab93-4138-bc65-675096c14c6d)

### State machine II (__FlatAdvancedSwitch__ and __FlatAdvancedRoundedSwitch__ classes)

![switch_6_states_a](https://github.com/mk590901/BLoC-Switches/assets/125393245/f7170c92-a315-4c0f-9184-9c887b9b0ca5)

### State machine III (__FlatButton__ and __FlatRoundedButton__ classes)

![button_3_state](https://github.com/mk590901/Event-driven-BLoC-s-switch-widgets/assets/125393245/1c18e26a-0713-4afc-9c65-2893ad8deb60)

## Movie

https://github.com/mk590901/BLoC-Switches/assets/125393245/94bde50d-fb7a-4a98-9264-d2f1e2123b41

## Resume
Enjoy (naturally if you enjoy the process of programming), and change the code as you wish.

## Updates (2024, August)
> Text buttons: __FlatTextButton__, __FlatTextRoundedButton__
 and widgets: __FlatZoomSwitch__, __FlatScrollMarker__, __AppBarWidget__ has been added to app.



