# Plant Moisture Monitoring and Water Pump Control

This project uses an Arduino Nano and MATLAB to monitor soil moisture levels and control a water pump based on sensor readings. It includes live plotting of moisture levels and allows the user to manually start or stop the system using a button.
## Features
- Real-Time Monitoring: Continuously reads soil moisture levels using a sensor.
- Pump Control: Automatically turns the pump on/off based on soil dryness.
- Live Visualization: Plots moisture levels in real time with MATLAB.
- Manual Control: Start or stop the system with a button.

## Components
1. Arduino Nano
2. Soil Moisture Sensor
3. Water Pump
4. Button

## How It Works
1. Start the System:
   - Press the button to begin monitoring.
   - The system checks the moisture levels continuously.

2. Moisture-Based Pump Control:
   - If the soil is dry, the pump is turned on.
   - If the soil is sufficiently wet, the pump is turned off.

3. Live Plotting:
   - Moisture levels are plotted in real-time on a graph.

4. Stop the System:
   - Press the button again to stop the system.

## Instructions
1. Hardware Setup:
   - Connect the moisture sensor to Arduino pin `A1`.
   - Connect the pump to Arduino pin `D2` (via a relay if required).
   - Connect the button to Arduino pin `D6`.

2. Run the MATLAB Script:
   - Open MATLAB and run the script to start the system.

## Notes
- Default moisture thresholds:
  - Dry soil: `3.4712V`
  - Wet soil: `2.7423V`
- The project uses MATLAB for live plotting and control logic.

