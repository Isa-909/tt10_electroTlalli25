# 4-Bit Binary Counter

This project implements a 4-bit synchronous binary counter 

## Description

The circuit has the following features:

* 4-bit binary counter.
* Inputs:
    * `clk`: Clock signal.
    * `rst_n`: Asynchronous active-low reset.
    * `select (up/down)`: Count direction selection (up or down).
* Outputs:
    * `count[3:0]`: 4-bit counter output.





## GPIO Pin Table

| Name          | Quantity | Direction     | Description                                |
|---------------|----------|---------------|--------------------------------------------|
| `clk`         | 1        | Input         | Clock input                                |
| `rst_n`       | 1        | Input         | Asynchronous active-low reset              |
| `select`      | 1        | Input         | Count direction selection                  |
| `ui_in[7:0]`  | 8        | Input         | General purpose inputs                     |
| `uo_out[7:0]` | 8        | Output        | General purpose outputs                    |
| `uio[7:0]`    | 8        | Bidirectional | General purpose bidirectional I/O pins     |

## How it Works
![BINARY COUNTER 4 BITS](https://github.com/user-attachments/assets/415cbf24-5019-4fde-80bd-8b90a750cfc7)

The 4-bit binary counter increments or decrements on each positive edge of the clock signal, depending on the value of the `select` input. When the `rst_n` input is low, the counter is reset to 0.

## How to Test
![IMAGES](https://github.com/user-attachments/assets/4ef476f2-aef9-4cc3-9978-566cec9725c2)

1. Connect a clock signal to the `clk` input.
2. Apply a high level to the `rst_n` input to enable the counter. To reset the counter, apply a low level to `rst_n` momentarily and then return to a high level.
3. Apply a logic level to the `select` input to choose the counting direction (high for up, low for down).
4. Observe the `uo_out[3:0]` outputs to verify the counting sequence. LEDs, an oscilloscope, or a logic analyzer can be used.

## External Hardware

* Clock source
* Power supply
* Logic level sources for `rst_n` and `select`
* Output indicators (LEDs, oscilloscope, logic analyzer)
* Wires and breadboard

## Additional Notes

* Ensure that the voltage levels and timing characteristics of the external hardware are compatible with the chip specifications.
* Use appropriate current-limiting resistors when connecting LEDs to the outputs.
* Verify that all connections are secure and that there are no short circuits.
* The select signal should be connected to one of the ui_in, ui_in[0] is recommended.
