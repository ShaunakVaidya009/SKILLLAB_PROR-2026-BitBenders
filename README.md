# SKILL LAB PRATICAL HACKATHON

## Final Project README

> **Project Weight:** 100%  
> **Team Size:** 4 students  
> **Project Duration:** 16 hours  
> **Total Time Available:** 32 effort-hours per team  
> **Project Type:** Cordic algorithm implementation on boolean board

---

# Before you begin

## Fork and rename this repository

After forking this repository, rename it using the format:

`SKILLLAB_PROR-2026-TeamName`

### Example

`SKILLLAB_PROR-2026-Bit Benders  `

Do not keep the default repository name.

---

# How to use this README

This file is your team’s **working project document**.

You must keep updating it throughout the build period.  
By the final review, this README should clearly show:

- your idea,
- your planning,
- your design decisions,
- your technical process,
- your build progress,
- your testing,
- your failures and changes,
- your final outcome.

## Rules

- Fill every section.
- Do not delete headings.
- If something does not apply, write `Not applicable` and explain why.
- Add images, screenshots, sketches, links, and videos wherever useful.
- Update task status and weekly logs regularly.
- Use this file as evidence of process, not only as a final report.

---

# 1. Team Identity

## 1.1 Studio / Group Name

`Bit Benders`

## 1.2 Team Members

| Name                  | Primary Role                    | Secondary Role   | Strengths Brought to the Project |
| --------------        | ------------------------------- | --------------   | -------------------------------- |
| `Rutuj Rotkar`        | `[Electronics / Coding]`        | `Coding`         | `Documentation, Gift of Gab `    |
| `Nishant Behera`      | `[Electronics / Fabrication]`   | `Coding`         | `Material Handling, Hardware`    |
| `Shaunak Vaidya`      | `[Electronics / Fabrication]`   | `Documentation`  | `Material Handling, Hardware`    |
| `Shrushti Deshpande`  | `[Electronics / Fabrication]`   | `Documentation`  | `Documentation, Gift of Gab`     |

## 1.3 Project Title

`"Cordic Based 4 - Point FFT and FPGA Implementation"`

<img width="1600" height="1131" alt="image" src="https://github.com/user-attachments/assets/c64bfbd4-b3b7-43d9-83ad-c203a5aa11bc" />

## 1.4 One-Line Pitch

`A hardware-efficient 4-point FFT processor using the CORDIC algorithm to eliminate multipliers and enable real-time frequency-domain signal processing on FPGA.`

## 1.5 Expanded Project Idea

In 1–2 paragraphs, explain:

- what your project is,
- what kind of experience it creates,
- what technologies are involved.

**Response:**  

This project implements a 4-point Fast Fourier Transform (FFT) processor using the CORDIC (Coordinate Rotation Digital Computer) algorithm on an FPGA board. The core innovation is replacing conventional complex multipliers — which are large and power-hungry on FPGAs — with CORDIC-based shift-and-add operations that achieve the same result using only adders and shifters.

The system accepts four time-domain input samples, passes them through two stages of butterfly operations, and produces four complex frequency-domain output values (X[0] through X[3]). At each butterfly stage, instead of pre-stored lookup tables or DSP multiplier blocks, the CORDIC core iteratively rotates a vector to generate the required twiddle factors (W⁰₄ and W¹₄) on the fly. This makes the design significantly more area-efficient and portable, and is a practical foundation for larger FFT implementations used in OFDM, SDR, and radar signal processing.

---

# 2. Inspiration

## 2.1 References

List what inspired the project.

| Source Type | Title / Link                                                        | What Inspired You                                                                         |
| ----------- | ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `[Video]`   | `https://youtu.be/bre7MVlxq7o?si=zgtq4Z5q43SXMmf6` | `Visual intuition for how FFT decomposes a signal into frequency components.`
| `[Video]`   | `https://youtu.be/m1e8IbDsIKw?si=I0kVGWWlsmTPd_iA` | `CORDIC algorithm explained — how rotation replaces multiplication`                                                            |                                                                                           |
| `[Paper]`   |                                                                     |                                                                                           |

## 2.2 Original Twist

What makes your project original?

**Response:** 

Unlike conventional FFT implementations that rely on hardware DSP multipliers or large sine/cosine lookup tables (ROM), this project uses the CORDIC algorithm in rotation mode to compute all twiddle factor multiplications using only shift-add hardware. This reduces LUT and DSP block usage on the FPGA significantly.
Additionally, the design is structured to be pipelined by stage, meaning Stage 1 butterfly results can be fed into Stage 2 while Stage 1 processes the next input batch — improving throughput toward near-real-time performance.

---

# 3. Project Intent

## 3.1 User Journey 

Describe exactly how a user will use the project.Make it a story

**Response:**  
A user provides digital input samples (either hardcoded test values or via FPGA switches). Once the system is started using a clock signal, the FPGA begins processing the data.

The input samples are passed through butterfly stages of a 4-point FFT. The odd-indexed outputs require multiplication by twiddle factors, which is implemented using the CORDIC algorithm instead of hardware multipliers.

The FPGA computes the FFT in a fixed number of clock cycles. The resulting frequency-domain outputs are observed through simulation waveforms (Vivado) or displayed via onboard LEDs or logic analyzer.

This project demonstrates real-time hardware signal processing using efficient FPGA design techniques without any external communication interface.
                                                  

---

# 4. Definition of Success

## 4.1 Definition of “Usable”

The project is considered usable when the FPGA-based system correctly performs a 4-point FFT using the CORDIC algorithm and produces valid frequency-domain outputs.

A usable system must:
- Accept 4 input samples (fixed-point format)
- Perform correct butterfly operations across both FFT stages
- Use CORDIC rotation for twiddle factor multiplication (no DSP multipliers)
- Produce stable and repeatable outputs within a fixed number of clock cycles
- Show outputs that match expected FFT results (verified via simulation or reference tools like MATLAB/Python)


## 4.2 Minimum Usable Version

What is the smallest version of this project that still delivers the core experience?

**Response:** 

The project is usable when:

- The FPGA correctly accepts 4 input samples and produces 4 frequency-domain output values matching expected FFT results.  
- All butterfly computations use CORDIC rotation — no hardware multiplier primitives (DSP48 blocks) are used.  
- The system produces results within a deterministic and bounded number of clock cycles.  
- Outputs can be verified against MATLAB or Python FFT results.

## 4.3 Stretch Features

What features are nice to have but not essential?

- Higher-point FFT (8-point, 16-point) using the same CORDIC-based architecture.  
- Fully pipelined design for improved throughput.  
- Optimized resource utilization (LUT, FF reduction).  
- Fixed-point precision tuning and error analysis.  
- On-board visualization using LEDs or external logic analyzer.
---

# 5. System Overview

## 5.1 Project Type

Check all that apply.

- [x] Electronics-based

- [ ] Mechanical

- [ ] Sensor-based

- [ ] App-connected

- [ ] Motorized

- [ ] Sound-based

- [ ] Light-based

- [ ] Screen/UI-based

- [ ] Fabricated structure

- [ ] Game logic based

- [ ] Installation

- [x] FPGA-based
      
- [x] Digital Signal Processing

- [ ] Other:

## 5.2 High-Level System Description

Explain how the system works in simple terms.

Include:

- input,
- processing,
- output,
- physical structure,
- app interaction if any.

**Response:**  

Input:
Four fixed-point digital samples (x0, x1, x2, x3) provided as test inputs or via FPGA switches.

Processing:
The system implements a 4-point Radix-2 FFT using two stages:

Stage 1:
- Butterfly operations on (x0, x2) and (x1, x3)

Stage 2:
- Even outputs (X0, X2): computed using only addition and subtraction (no rotation)
- Odd outputs (X1, X3): require multiplication by twiddle factor

Instead of using multipliers, the design uses a CORDIC module to perform rotation corresponding to twiddle factor multiplication.

Output:
Four frequency-domain outputs (X0, X1, X2, X3) are generated and verified through simulation waveforms in Vivado or observed on FPGA output pins.

Physical Structure:
Implemented entirely on FPGA (Spartan-7 Boolean board). No external devices required.

## 5.3 Input / Output Map

| System Part        | Type     | What It Does |
|-------------------|----------|--------------|
| Input Samples     | Input    | Provides time-domain data (x0–x3) |
| Butterfly Unit    | Process  | Performs add/sub operations |
| CORDIC Core       | Process  | Performs rotation (twiddle multiplication) |
| Control Logic     | Process  | Controls computation flow |
| FFT Output        | Output   | Produces frequency-domain result |

---

# 6. System Design, Sketches and Visual Planning 

## 6.1 Concept Architecture/sketch/schematic
The full system follows a two-stage radix-2 DIT (Decimation-In-Time) FFT structure. Each butterfly unit calls the CORDIC module for twiddle factor rotation rather than accessing a ROM or invoking a hardware multiplier.

**Insert image below:**  
`[Upload image and link here]`
<img width="1600" height="1200" alt="image" src="images/WhatsApp Image 2026-05-01 at 18.26.08.jpeg" />

Example:

```md

```



## 6.2 Labeled Build Sketch/architecture/flow diagram/algorithm

Add a sketch with labels showing:

- structure,
- electronics placement,
- user touch points,
- moving parts,
- output elements.

**Insert image below:**  
`[Upload image and link here]`
<img width="1600" height="1200" alt="image" src="https://github.com/ShaunakVaidya009/SKILLLAB_PROR-2026-BitBenders/commit/506659edbd6078d1dc820e8171a8934486e99e3c#diff-4f367be0bd29bb6cb7460499f04e7a7cdf2561d4f66abc1c67e315c8dc87aee2" />

## 6.3 Approximate Dimensions


---

# 7. Electronics Planning

## 7.1 Electronics Used

| Component              | Quantity | Purpose |
|------------------------|----------|---------|
| FPGA Boolean Board     | 1        | Main processing unit |
| Clock Source (On-board)| 1        | Provides system clock |
| LEDs / Output Pins     | Optional | Display output values |

## 7.2 Wiring Plan

Describe the main electrical connections.

**sample Response:**  
No specific wiring connections except power supply to the FPGA Boolean Board and connection to Laptop.

## 7.3 Circuit Diagram/architecture diagram

Insert a hand-drawn or software-made circuit diagram.

**Insert image below:**  
`[Upload image and link here]`
<img width="867" height="1156" alt="" src="" />


# 7.4. Power Plan

| Question         | Response |
|------------------|----------|

| Power source     | USB power to FPGA board                               |
| Voltage required | 5V (from USB)                                         |
| Current concerns | Minimal (FPGA internal logic only)                    |
| Safety concerns  | Ensure proper USB connection and avoid short circuits |

---

# 8. Software Planning/

## 8.1 Software Tools

| Tool / Platform | Purpose |
|----------------  |--------|
| Vivado         | FPGA design, synthesis, simulation |
| Verilog HDL    | Hardware description |
| ModelSim/Vivado Simulator | Verification |
| MATLAB/Python  | Optional FFT verification |

## 8.2 Software Logic/Algorithm

Describe what the code must do.

Include:

- startup behavior,
- input handling,
- sensor reading,
- decision logic,
- output behavior,
- communication logic,
- reset behavior.

**Response:**  
`


- **Startup behavior:**  
  When the FPGA is powered on, the system initializes all internal registers, control signals, and clock. The design remains in an idle state until valid input samples are provided. The clock drives all synchronous operations in the system.

- **Input handling:**  
  Four fixed-point input samples (x0, x1, x2, x3) are either hardcoded in the testbench or provided via FPGA input switches/registers. These inputs represent time-domain signals.

- **Sensor reading:**  
  Not applicable.  
  (This project does not use sensors; it is a pure digital signal processing implementation on FPGA.)

- **Decision logic:**  
  The control logic (FSM or sequential logic) determines the stage of FFT computation:
  - Stage 1: Perform butterfly operations on input pairs (x0, x2) and (x1, x3)
  - Stage 2:
    - Even outputs → computed using only addition/subtraction
    - Odd outputs → require twiddle multiplication using CORDIC rotation

  The system decides whether to route data through:
  - Direct arithmetic path (no rotation)
  - CORDIC rotation path (for twiddle factor multiplication)

- **Output behavior:**  
  After processing through FFT stages, the system produces four outputs (X0, X1, X2, X3) in the frequency domain. These outputs are observed in simulation waveforms or can be mapped to FPGA output pins (LEDs or logic analyzer).

- **Communication logic:**  
  Not applicable.  
  (No UART, WiFi, or external communication is used in this project.)

- **Reset behavior:**  
  When reset is asserted:
  - All registers are cleared
  - Intermediate values are reset to zero
  - System returns to initial idle state  
  Once reset is released, the system restarts FFT computation from Stage 1.`

## 8.3 Code Flowchart

Insert a flowchart showing your code logic.

Suggested sequence:

- start,
- initialize,
- wait for input,
- read input,
- decision,
- trigger output,
- repeat or reset,
- error handling.
`## 8.3 Code Flowchart

Start  
  ↓  
Initialize system (clock, registers)  
  ↓  
Load input samples (x0, x1, x2, x3)  
  ↓  
Stage 1 Butterfly Computation  
  ↓  
Stage 2 Decision  
   ├── Even outputs → Add/Subtract  
   └── Odd outputs → CORDIC Rotation  
  ↓  
Generate FFT Outputs (X0, X1, X2, X3)  
  ↓  
Output Valid  
  ↓  
Wait / Next Input  
  ↓  
Reset (if triggered) → Go to Start`

**Insert image below:**  
<img width="1600" height="1200" alt="image" src="" />
<img width="1600" height="1200" alt="image" src="" />




# 9. Bill of Materials

## 9.1 Full BOM

| Item                             | Quantity | In Kit? | Need to Buy? | Estimated Cost | Material / Spec                     | Why This Choice?                              |
| -------------------------------- | --------:| ------- | ------------ | --------------:| ----------------------------------- | --------------------------------------------- |
| `[FPGA Boolean Board (Spartan-7)]`| `1`      | `Yes`   | `No`         | `0`            | `Xilinx Spartan-7 FPGA Board`       | `Main hardware platform for FFT implementation` |
| `[USB Cable]`                    | `1`      | `Yes`   | `No`         | `0`            | `USB-A to Micro USB`                | `Power supply and programming interface`       |
| `[Laptop / PC]`                  | `1`      | `Yes`   | `No`         | `0`            | `Vivado Installed System`           | `Used for coding, simulation, and synthesis`   |
| `[Clock Source (On-board)]`      | `1`      | `Yes`   | `No`         | `0`            | `On-board oscillator (~100 MHz)`    | `Provides clock signal for synchronous design` |          |
| `[LEDs / Output Pins]`           | `4–8`    | `Yes`   | `No`         | `0`            | `On-board LEDs / GPIO pins`         | `Display FFT output or debug signals`          |

## 9.2 Material Justification

Explain why you selected your main materials and components.

**Response:**  
`The FPGA Boolean Board (Spartan-7) was selected as the main hardware platform because it provides a flexible and efficient environment for implementing digital signal processing algorithms such as FFT.

The CORDIC-based FFT design requires only basic arithmetic operations (addition, subtraction, and shifting), which map efficiently onto FPGA logic resources (LUTs and flip-flops) without requiring dedicated hardware multipliers (DSP blocks). This makes the design area-efficient and suitable for low-resource FPGA implementations.

The on-board clock source is used to synchronize all operations, ensuring deterministic and reliable execution of the FFT stages. Input switches and output LEDs (or GPIO pins) are used for simple interaction and debugging without requiring external communication modules.

A laptop with Vivado is used for writing Verilog code, performing simulation, synthesis, and verifying the correctness of the FFT outputs. Optional tools like a logic analyzer can be used for deeper signal inspection during debugging.

Overall, the selected components ensure a minimal, cost-effective, and fully self-contained FPGA-based implementation.`


## 9.3 Items You chose

| Item                 | Why Needed               | Purchase Link | Latest Safe Date to Procure | Status       |
| -------------------- | ------------------------ | ------------- | --------------------------- | ------------ |
| `FPGA Boolean Board`          | `Core platform for FFT implementation`       | `Provided`    | `Already available`         | `[Available]` |
| `USB Cable`                   | `Power and programming interface`            | `Provided`    | `Already available`         | `[Available]` |
| `Laptop with Vivado`          | `Design, simulation, and synthesis`          | `Provided`    | `Already available`         | `[Available]` |

## 9.4 Budget Summary

| Budget Item           | Estimated Cost              |
| --------------------- | ---------------------------:|
| Electronics           | `[0 (Provided in lab)]`     |
| Mechanical parts      | `[0]`                       |
| Fabrication materials | `[0]`                       |
| Purchased extras      | `[0]`                       |
| Contingency           | `[0]`                       |
| **Total**             | `[0]`                       |

## 9.5 Budget Reflection

If your cost is too high, what can be simplified, removed, substituted, or shared?

**Response:**  

The project is highly cost-efficient since all required hardware components, including the FPGA board and development tools, are already available in the lab. No additional mechanical or electronic components are required.

If cost reduction were necessary, the design could still be implemented on lower-cost FPGA boards or simulated entirely in software for validation. Since the project avoids the use of external peripherals, sensors, and communication modules, it inherently minimizes expenses.

The use of the CORDIC algorithm further reduces hardware resource usage by eliminating the need for multipliers, making the design both cost-effective and resource-efficient.

---

# 10. Planning the Work

## 10.1 Team Working Agreement

Write how your team will work together.

Include:

- how tasks are divided,
- how decisions are made,
- how progress will be checked,
- what happens if a task is delayed,
- how documentation will be maintained.

**Response:**  


## 10.2 Task Breakdown

| Task ID | Task                    | Owner    | Estimated Hours | Deadline     | Dependency | Status |
| ------- | ----------------------- | -------- | ---------------:| ------------ | ---------- | ------ |
| T1      | `[Finalize concept]`    | `[Both]` | `2`             | `1st April`  | `None`     | `Done` |


## 10.3 Responsibility Split

| Area                 | Main Owner     | Support Owner |
| -------------------- | ----------     | ------------- |
| Concept              | `[Shaunak]`    | `[Rutuj]`     |
| Coding               | `[Rutuj]`      | `[Nishant]`   |
| Testing              | `[Nishant]`    | `[Shrushti]`  |
| Documentation        | `[Shrushti]`   | `[Shaunak]`   |
---

# 11 hour Milestones

## 11.1 8-hour Plan(tentetively you may set)

### Bi Hour 1 — Plan and De-risk

Expected outcomes:

- [x] Idea finalized
- [x] Core interaction decided
- [x] Sketches made
- [x] BOM completed
- [x] Purchase needs identified
- [ ] Key uncertainty identified
- [x] Basic feasibility tested

### Bi Hour 2 — Build Subsystems

Expected outcomes:

- [x] Electronics tests completed
- [ ] CAD / structure planning completed
- [ ] App UI started if needed
- [x] Mechanical concept tested
- [x] Main subsystems partially working

### Bi Hour 3 — Integrate

Expected outcomes:

- [x] Physical body built
- [x] Electronics integrated
- [x] Code connected to hardware
- [ ] App connected if required
- [x] First playable version exists

### Bi Hour 4 — Refine and Finish

Expected outcomes:

- [x] Technical bugs reduced
- [x] Playtesting completed
- [x] Improvements made
- [x] Documentation completed
- [x] Final build ready

## 12.2  Update Log

| Days   | Planned Goal   | What Actually Happened | What Changed   | Next Steps     |
| ------ | -------------- | ---------------------- | -------------- | -------------- |
| Day 1 | `[Project output]` | `[]`         | `[Write here]` | `[Readme]` |
| Day 2 | `[Readme]` | `[Write here]`         | `[Write here]` | `[Presentation]` |


---

# 13. Risks and Unknowns

## 13.1 Risk Register

| Risk                                                            | Type         | Likelihood | Impact   | Mitigation Plan                                                                       | Owner                |
| --------------------------------------------------------------- | ------------ | ---------- | -------- | ------------------------------------------------------------------------------------- | -------------------- |
| WiFi connection between laptop and ESP32 becomes unstable       | `Technical`  | `Medium`   | `High`   | Keep ESP32 close, ensure stable power supply, reduce network load, add fail-safe stop | `[Gopal]`           |


## 13.2 Biggest Unknown Right Now

What is the single biggest uncertainty in your project at this stage?

**Response:**  


---

# 14. Testing 

## 14.1 Technical Testing Plan

| What Needs Testing     | How You Will Test It                                                                 | Success Condition                                                                                    |
| ---------------------- | ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------- |
| `[Wifi connection]`    | `[Check if motor spins via app button]`                                              | `[Both motors accurately respond to wifi signals]`                                                   |
                       |
## 14.2 Testing and Debugging Log

| Date          | Problem Found                         | Type         | What You Tried                                | Result               | Next Action                                    |
| ------------- | ------------------------------------- | ------------ | --------------------------------------------- | -------------------- | ---------------------------------------------- |
| `30th April`  | `Car not balancing properly`          | `Mechanical` | `Add low-friction caster support to one side` | `Worked`             | `improve caster structure`                     |


## 14.3 Playtesting Notes

| Tester      | What They Did                        | What Confused Them                    | What They Enjoyed                         | What You Will Change                          |



---

# 15. Build Documentation

## 15.1 Fabrication Process(if any)



**Response:**  
`No Fabrication process involved in our project.`

## 16 Build Photos

Suggested images:

- <img width="960" height="1280" alt="WhatsApp Image 2026-04-24 at 9 46 02 AM (1)" src="images/WhatsApp Image 2026-05-01 at 19.57.21.jpeg" />
- <img width="960" height="1280" alt="WhatsApp Image 2026-04-24 at 9 46 02 AM (1)" src="images/WhatsApp Image 2026-05-01 at 18.31.46.jpeg" />




# 17. Final Outcome

## 17.1 Final Description

Describe the final version of your project.

**Response:**  


## 17.2 What Works Well



## 17.3 What Still Needs Improvement


## 17.4 What Changed From the Original Plan

How did the project change from the initial idea?

**Response:**  


---

# 18. Reflection

## 18.1 Team Reflection

What did your team do well?  
What slowed you down?  
How well did you manage time, tasks, and responsibilities?

**Response:**  


## 18.2 Technical Reflection



**Response:**  


## 18.3 Design Reflection



**Response:**  


## 18.4 If You Had One More hour

What would you improve next?

**Response:**  

` `

---

# 19. Final Submission Checklist

Before submission, confirm that:

- [x] Team details are complete
- [x] Project description is complete
- [x] Inspiration sources are included
- [x] Sketches are added
- [x] BOM is complete
- [x] Purchase list is complete
- [x] Budget summary is complete
- [x] Mechanical planning is documented if applicable
- [ ] App planning is documented if applicable
- [x] Code flowchart is added
- [x] Task breakdown is complete
- [x] Weekly logs are updated
- [x] Risk register is complete
- [x] Testing log is updated
- [x] Playtesting notes are included
- [x] Build photos are included
- [x] Final reflection is written
<img width="1131" height="1600" alt="image" src="" />

---


---


