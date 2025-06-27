# FSM-Based Stopwatch Controller | Verilog + Vivado

- A digital stopwatch implemented using Verilog HDL. 
- The design uses a 3-state Finite State Machine (FSM) to control a 2-digit BCD counter (00–99). 
- Fully simulated in Vivado with waveform validation.
## Project Overview

This project was developed as a part of my RTL design learning. It implements a stopwatch system using Verilog HDL, combining a finite state machine (FSM) controller with a BCD counter. The entire design was coded, simulated, and verified using Vivado.

The objective was to simulate basic control and counting logic, build modular RTL, and validate functionality using waveform simulation — all from a home setup without any external FPGA board.

This project models a digital stopwatch that can:
- **Start counting** from 00 to 99
- **Pause** and **resume**
- **Reset** to 00

  ## 🎯 Project Significance

This project implements a stopwatch system using Verilog HDL, integrating a finite state machine (FSM) controller with a BCD counter. It showcases core digital design principles and simulation workflows used in RTL front-end roles.

**Skills demonstrated:**
- Finite State Machine design (IDLE, RUNNING, PAUSED states)
- Modular Verilog design and code reusability
- Control and datapath separation using hierarchical module integration
- Functional simulation and waveform verification in Vivado
- Testbench creation for validating timing and logic behavior

This project reflects familiarity with the RTL design flow, including specification-based design, simulation, and debugging using industry-standard tools.


### 🧩 Modules Implemented:
1. **fsm_controller.v**  
   FSM with 3 states: `IDLE`, `RUNNING`, `PAUSED`

2. **bcd_counter.v**  
   2-digit counter: `ones` and `tens` (00–99), increments on clock edges when enabled

3. **stopwatch.v**  
   Top-level module that connects FSM and Counter

4. **stopwatch_tb.v**  
   Testbench simulating reset, start, pause, and resume actions

---


## output waveforms:
<img width="782" alt="image" src="https://github.com/user-attachments/assets/b04715c2-b26e-4434-9e52-2eac4caad4fd" />

## 🔍 Simulation Output Explained

The waveform demonstrates the behavior of the FSM-based stopwatch under various control signals (`start`, `pause`, `reset`). Here's a breakdown of what you're seeing:

- `clk`: A continuous clock with a 10ns period (toggled every 5ns).
- `rst`: Initially LOW, so the FSM begins in the `IDLE` state.
- `start`: Goes HIGH after a short delay, triggering the transition to the `RUNNING` state.
- `pause`: Goes HIGH later, causing the FSM to enter the `PAUSED` state.
- `ones` and `tens`: Together form the 2-digit BCD output. When `enable` is HIGH (i.e., in `RUNNING`), the counter increments:
  - `ones` counts from 0 to 9
  - On overflow, `tens` increments by 1 (modulo 10)

### ⏱ Key Observations
- During `RUNNING`, counter values (`ones`, `tens`) increment as expected.
- During `PAUSED`, counter **holds** its current value (frozen).
- After pausing, when `start` is triggered again, counting resumes correctly.

> This confirms that FSM control and BCD counter logic are functionally integrated and operating as expected.


