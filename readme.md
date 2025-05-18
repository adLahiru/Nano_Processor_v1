# 🧠 Basic 4-bit Nano Processor

This is a minimalist 4-bit nano processor designed for educational and experimental use. It demonstrates the basics of CPU architecture using a simplified instruction set and core components implemented in VHDL.

## 🚀 Version: 1.0.0

---

## 📦 Features

- **4-bit Data Width** – Lightweight processor for small-scale computation
- **Core Instructions:**
  - `ADD` – Performs 4-bit addition
  - `MOVE` – Transfers data between registers
  - `NEGATION` – Computes the two’s complement of a value
  - `JUMP IF ZERO` – Conditional jump based on zero flag
- **Implemented Components:**
  - Register Bank
  - ALU (Arithmetic Logic Unit)
  - Instruction Decoder
  - Slow Clock Generator
  - Testbench for simulation

---

## 🛠️ File Structure

| File/Module               | Description                                |
| ------------------------- | ------------------------------------------ |
| `register_bank.vhd`       | Stores values in multiple 4-bit registers  |
| `alu.vhd`                 | Handles arithmetic operations              |
| `instruction_decoder.vhd` | Decodes binary instructions                |
| `clock_gen.vhd`           | Slow clock generator for simulation timing |
| `cpu_top.vhd`             | Top-level integration of CPU components    |
| `testbench.vhd`           | Simulates CPU behavior for testing         |

---

## 🎯 Use Cases

- CPU architecture learning
- Instruction set experimentation
- Digital design education using VHDL
- Foundation for building more complex processors

---

## 🔧 Getting Started

To simulate the processor:

1. Clone the repository.
2. Open the project in your VHDL simulator (ModelSim, GHDL, etc.).
3. Compile all VHDL files.
4. Run `Nanoprocessor.vhd` to observe functionality.

---

## 📖 License

This project is open-source and free to use for educational purposes.

---

## 👤 Author

Created by,
  1. Lahiru Dilshan
  2. Thilokya Angeesa
  3. Sandaru Vidushan
  4. Sandeni Vithanage

---

## 📌 Note

This is Version `v1.0.0`. Future versions may add further instructions and functionality (like branching, memory, or extended instructions).
