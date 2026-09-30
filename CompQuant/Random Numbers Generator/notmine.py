from qiskit import QuantumCircuit
from qiskit_aer import AerSimulator

def create_bit_string(n):

   simulator = AerSimulator()

   qc = QuantumCircuit(n, n)

   qc.h(range(n))

   qc.measure(range(n), range(n))

   result = simulator.run(qc, shots=1).result()
   counts = result.get_counts()

   return list(counts.keys())[0]

def rng(bit_string):

    return int(bit_string, 2)


bit_string = create_bit_string(10)

print(f"Número inteiro gerado: {rng(bit_string)}")