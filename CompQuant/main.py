
from qiskit import *
from qiskit.visualization import plot_bloch_multivector, visualize_transition, plot_histogram
from qiskit_aer import Aer, AerSimulator
from qiskit.quantum_info import Statevector
import matplotlib.pyplot as plt
import math

#initializing circuit -> it is starting 1 classical bit and 1 quantum bit
circ = QuantumCircuit(1,1) 

#apply hadamar and measurement
circ.h(0)

#this measures the index 0 and store it in index 0 of the classical one
circ.measure(0,0)

# Initializing the simulator
simulator = AerSimulator()

# Transpile 
circ = transpile(circ, simulator)

#Run the circuit on the simulator 10k times 
result = simulator.run(circ, shots = 10000).result()

# Get the data of our experiment
counts = result.get_counts(circ)

# Plot the data in a histogram
plot_histogram(counts, title='Quantum Random Bit Distribution')

# Run the simulator 20 times to generate 20-bit number
result = simulator.run(circ, shots=8, memory=True).result()

# Extract the results from memory in a list and print them
memory = result.get_memory(circ)
print(memory)

# Join the bits in the list
random_binary_string = ''.join(memory)  

# Convert the joined bits into an integer and print the result
random_integer = int(random_binary_string, 2)

print(random_integer)