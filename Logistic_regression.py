import random
import math
import time

random.seed(0)

class_0 = [(random.uniform(2, 5), random.uniform(1, 4), 0) for _ in range(50)]
class_1 = [(random.uniform(7, 10), random.uniform(4, 7), 1) for _ in range(50)]

data = class_0 + class_1
random.shuffle(data)

def sigmoid(z):
    return 1 / (1 + math.exp(-z))

w1, w2, b = random.uniform(0, 1), random.uniform(0, 1), random.uniform(0, 1)

learning_rate = 0.01
iterations = 1000

start_time = time.time()

for _ in range(iterations):
    dw1, dw2, db = 0, 0, 0
    
    for x1, x2, label in data:
        z = w1 * x1 + w2 * x2 + b
        a = sigmoid(z)
        
        dz = a - label
        dw1 += x1 * dz
        dw2 += x2 * dz
        db += dz
    
    w1 -= learning_rate * dw1 / len(data)
    w2 -= learning_rate * dw2 / len(data)
    b -= learning_rate * db / len(data)

end_time = time.time()

correct_predictions = 0
for x1, x2, label in data:
    z = w1 * x1 + w2 * x2 + b
    predicted_label = 1 if sigmoid(z) >= 0.5 else 0
    if predicted_label == label:
        correct_predictions += 1

accuracy = correct_predictions / len(data)
print(f"Accuracy: {accuracy:.2f}")

elapsed_time = end_time - start_time
print(f"Elapsed Time: {elapsed_time:.4f} seconds")

