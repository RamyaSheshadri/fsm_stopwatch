# FSM-Based Stopwatch Controller ⏱️ | Verilog + Vivado

A digital stopwatch implemented using Verilog HDL. 
The design uses a 3-state Finite State Machine (FSM) to control a 2-digit BCD counter (00–99). 
Fully simulated in Vivado with waveform validation.

---

## 🧠 Project Overview

This project models a digital stopwatch that can:
- **Start counting** from 00 to 99
- **Pause** and **resume**
- **Reset** to 00

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

## 🔗 Module Connection Diagram

