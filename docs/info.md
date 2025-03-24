<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->
## How it works

This project implements a **4×4 Wallace Tree Multiplier** using **Half Adders and Full Adders** to efficiently compute the product of two 4-bit binary numbers. The Wallace Tree method reduces the number of sequential additions required in multiplication, leading to a **faster and optimized** multiplication process.

### **Key Features:**
- Accepts **two 4-bit inputs (A & B)**.
- Produces an **8-bit product** as output.
- Uses **Half Adders and Full Adders** for Wallace Tree reduction.
- **No clock is required** since it's a combinational circuit.

---

## How to test

### **Simulation in TinyTapeout**
1. **Apply two 4-bit binary inputs (`A` and `B`).**
2. **Observe the 8-bit output (`Product`).**
3. **Compare the output with expected multiplication results.**
4. **Verify correctness using test cases:**


## External hardware

This project does **not** require any external hardware.

It can be tested using:
- **FPGA implementation** (e.g., Xilinx, Lattice, or TinyTapeout).
- **Simulation tools** like Verilog simulators (EDA Playground, Icarus Verilog).
- **TinyTapeout environment** for ASIC fabrication.

The 8-bit multiplication result can be displayed using:
- **LEDs** (for lower bits).
- **Seven-segment displays** (for visualization of results).
- **UART / GPIO pins** (if extended to communicate with external systems).
