# 01 All you need is lambda

## 1.3 What is a function?
A function is a RELATION.
A relation between a SET of possible inputs and a SET of possible outputs.

Referential transparency / "purity" in functional programming refers to
functions, given the same values to evaluate, will always return the same
result.


### Example
Function f
f(1) = A
f(2) = B
f(3) = C

The input set is {1,2,3}
The output set is {A,B,C}

This function will ALWAYS return A when given the input 1.


### Example
f(1) = X
f(1) = Y
f(2) = Z

This is NOT a valid function.

