# Ball and Beam Control System

<p align="center">
  <img src="Videos/Demo.gif" width="900">
</p>

## Overview

The Ball and Beam System is a classical unstable control problem widely used in control engineering education and research. The objective is to control the position of a rolling ball along a beam by adjusting the beam inclination angle through a servo motor using a closed-loop PID controller.

This project presents the complete development cycle of a real Ball and Beam prototype following the **VDI 2206 Mechatronic Design Methodology**, including:

* Mechanical Design
* CAD Modeling
* Finite Element Analysis (FEA)
* Mathematical Modeling
* PID Controller Design
* MATLAB Simulation
* Simulink Simulation
* Arduino-Based Real-Time Control
* Hardware–Software Integration
* System Identification
* Experimental Validation

---

# Project Highlights

| Feature                      | Status |
| ---------------------------- | ------ |
| CAD Design                   | ✅      |
| Mechanical Analysis          | ✅      |
| Finite Element Analysis      | ✅      |
| Mathematical Modeling        | ✅      |
| Transfer Function Derivation | ✅      |
| PID Controller Design        | ✅      |
| MATLAB Simulation            | ✅      |
| Simulink Simulation          | ✅      |
| Arduino Implementation       | ✅      |
| System Identification        | ✅      |
| Experimental Validation      | ✅      |
| VDI 2206 Methodology         | ✅      |

---

# Hardware Prototype

<p align="center">
  <img src="Images/Final_Prototype.jpeg" width="700">
</p>

The physical prototype was developed and experimentally validated using:

* Arduino Uno
* MG995 Servo Motor
* HC-SR04 Ultrasonic Sensor
* Custom Mechanical Structure
* Voltage Regulation Circuit
* 12V Power Supply

---

# CAD Design

<p align="center">
  <img src="Images/CAD_Model.jpeg" width="900">
</p>

The complete mechanical assembly was designed and validated before fabrication.

Main subsystems include:

* Beam Assembly
* Linkage Mechanism
* Servo Mount
* Sensor Holder
* Structural Base

---

# System Architecture

```text
Reference Position
        │
        ▼
PID Controller
        │
        ▼
Arduino Uno
        │
        ▼
MG995 Servo Motor
        │
        ▼
Beam Angle
        │
        ▼
Ball Position
        │
        ▼
HC-SR04 Sensor
        │
        └──────────── Feedback
```

---

# Electronic Circuit

<p align="center">
  <img src="Images/Circuit_Diagram.jpeg" width="900">
</p>

The control system consists of an Arduino Uno, MG995 servo motor, HC-SR04 ultrasonic sensor, voltage regulation stage, and external power supply.

---

# VDI 2206 Engineering Workflow

The project was developed following the VDI 2206 methodology for mechatronic systems design.

This approach integrates:

1. Requirements Definition
2. Mechanical Design
3. Electronics Design
4. Software Development
5. System Integration
6. Validation and Testing

---

# Mathematical Modeling

The Ball and Beam system behaves as a double integrator and is inherently unstable in open-loop operation.

Plant Transfer Function:

P(s) = 5.532 / s²

This characteristic requires feedback control to stabilize the ball position.

---

# Control System Design

## Open-Loop Behavior

The open-loop response demonstrates unstable system behavior where the ball position continuously diverges from the desired position.

<p align="center">
  <img src="Results/Figure_11_Open_Loop_Response.jpg" width="800">
</p>

---

## Root Locus Analysis

Root locus analysis was used to investigate system stability and select suitable controller parameters.

<p align="center">
  <img src="Results/Figure_13_Root_Locus.jpg" width="800">
</p>

---

## PID Controller Design

Selected controller gains:

```matlab
Kp = 40
Ki = 5
Kd = 10
```

These values provided a good balance between:

* Fast Response
* Small Overshoot
* Zero Steady-State Error
* Acceptable Settling Time

---

## Closed-Loop Response

The PID controller successfully stabilized the system and achieved accurate ball position tracking.

<p align="center">
  <img src="Results/Figure_12_Closed_Loop_Response.jpg" width="800">
</p>

---

# PID Tuning Analysis

## Effect of Proportional Gain (Kp)

<p align="center">
  <img src="Results/Figure_14_Kp_Effect.jpg" width="800">
</p>

Increasing Kp improves response speed but may increase overshoot.

---

## Effect of Integral Gain (Ki)

<p align="center">
  <img src="Results/Figure_15_Ki_Effect.jpg" width="800">
</p>

Increasing Ki reduces steady-state error and improves tracking accuracy.

---

## Effect of Derivative Gain (Kd)

<p align="center">
  <img src="Results/Figure_16_Kd_Effect.jpg" width="800">
</p>

Derivative action increases damping and reduces oscillations.

---

# Simulink Modeling

## Open-Loop Simulink Model

<p align="center">
  <img src="Results/Figure_18_Open_Loop_Simulink.jpg" width="900">
</p>

---

## Closed-Loop Simulink Model

<p align="center">
  <img src="Results/Figure_19_Closed_Loop_Simulink.jpg" width="900">
</p>

---

# Hardware–Software Integration

The PID controller was implemented on Arduino and connected to MATLAB using serial communication.

Features:

* Real-time data acquisition
* Live response visualization
* Closed-loop monitoring
* Performance analysis

<p align="center">
  <img src="Results/Figure_21_Output_Distance_vs_Time.jpg" width="800">
</p>

---

# System Identification

Experimental data were collected from the physical prototype and processed using MATLAB System Identification Toolbox.

Identified Models:

Model 1

P(s) = (1.625s + 2.959) / (s² + 15.09s + 12850)

Model 2

P(s) = (25.05s + 39.11) / (s² + 87.88s + 1.494 × 10⁻¹⁰)

---

## System Identification Toolbox

<p align="center">
  <img src="Results/Figure_25_System_Identification_Toolbox.jpg" width="800">
</p>

---

# Theoretical vs Practical Validation

One of the most important contributions of this project is the comparison between theoretical and experimentally identified models.

<p align="center">
  <img src="Results/Figure_26_Comparison.jpg" width="900">
</p>

---

## Performance Comparison

| Model             | Overshoot (%) | Settling Time (s) | Steady-State Error |
| ----------------- | ------------- | ----------------- | ------------------ |
| Theoretical Model | 5.43          | 0.364             | 0                  |
| Practical Model 1 | 0.00          | 1005.137          | 0                  |
| Practical Model 2 | 0.77          | 0.000             | 0                  |

---

# Finite Element Analysis (FEA)

## Connecting Link Displacement

<img src="Results/Figure_05_Connecting_Link_Displacement.jpg" width="800">

## Connecting Link Stress Distribution

<img src="Results/Figure_06_Connecting_Link_Stress.jpg" width="800">

## Mesh and Boundary Conditions

<img src="Results/Figure_07_Mesh_and_Boundary_Conditions.jpg" width="800">

## Beam Stress Distribution

<img src="Results/Figure_08_Beam_Stress.jpg" width="800">

## Beam Displacement Distribution

<img src="Results/Figure_09_Beam_Displacement.jpg" width="800">

---

# Team Members

* Mahmoud Mohamed Shamekh
* Omar Mahmoud Metwally
* Youssef Mostafa Ayad
* Ebrahim Magdy Ebrahim

---

# Supervision

Dr. Amro Shafik

Eng. Mohamed Ashraf

---

# License

This repository is published for educational, academic, and research purposes.
