# Digital Calendar and Clock (FPGA - Verilog)

This repository contains the implementation of a digital calendar and clock designed using Verilog HDL for an FPGA platform. The project provides a fully functional clock and calendar system with various control and adjustment options using UART and FPGA peripherals.

### 🚀 Project Overview
- **Clock and Calendar Functionality:**
  - The system starts with an initial date and time (e.g., 30.07.2024 18:30:00).
  - The current time (hours and minutes) is displayed on a 7-segment display in 24-hour format.
  - Seconds are displayed as binary on the LEDs.
  - The user can adjust hours and minutes using two buttons (increase and decrease).
  - Seconds can be adjusted using switches (one for each LED).
  - A button allows pausing and resuming the clock, which is necessary for making adjustments.
  - A switch allows the clock speed to be increased or restored to normal (for faster date-time changes).
  - Another switch resets the system to the initial date and time.

- **UART Communication:**
  - The system can communicate with a computer via UART.
  - The user can type a command to see the current date and time in the format `DD.MM.YYYY HH:MM:SS`.
  - The user can also set the date and time through UART using a specific format (e.g., `K15082024153008` sets the date to 15.08.2024 15:30:08).
  - UART settings (baud rate, data format) can be customized.

### ⚙️ How It Works
- **Time Display:** The clock displays the hours and minutes on a 7-segment display, while the seconds are shown as binary on the LEDs.
- **Adjustments:**
  - Hour and minute adjustments are made using dedicated buttons.
  - Seconds can be adjusted using switches corresponding to each LED.
  - A reset switch brings the system back to the initial date and time.
- **Speed Control:** A switch allows the user to speed up the clock, making date changes faster.
- **UART Interface:**
  - Users can view the current date and time through a terminal application (e.g., Putty, Mobaxterm).
  - Users can set the date and time using a specific command format (e.g., `K15082024153008`).
- **FPGA Platform:** Designed for the BASYS3 FPGA, but adaptable to other FPGA boards.

### 🚦 Simulation and Testing
- The Verilog code is tested using an FPGA simulator and directly on an FPGA board.
- UART communication is tested using terminal applications (Putty, Mobaxterm, or similar).
- The system is verified for accurate date and time adjustment, proper display on the 7-segment display, and correct UART responses.

### 📝 Usage Instructions
1. Deploy the Verilog code on your FPGA platform (e.g., BASYS3).
2. Connect the FPGA to your computer via a serial connection (UART).
3. Use a terminal application (e.g., Putty) to communicate with the system:
   - Type any key to view the current date and time.
   - Use the specific command format (e.g., `K15082024153008`) to set a new date and time.
4. Use the buttons and switches on the FPGA for manual adjustments.

### 📌 Customization
- The initial date and time can be changed directly in the Verilog code.
- The UART baud rate can be adjusted for faster or slower communication.
- The 7-segment display configuration can be modified for different formats.

### 🚀 Optional Extensions
- VGA Display: Display the date and time on a monitor using VGA.
- Additional Date Formats: Add support for different date formats (e.g., MM/DD/YYYY).
- Custom Commands: Extend UART commands for additional functionality.

### ⚡ Dependencies
- Verilog HDL (compatible with FPGA simulators and synthesis tools).
- FPGA Board (BASYS3 or equivalent).
- UART-compatible terminal application (e.g., Putty, Mobaxterm).
