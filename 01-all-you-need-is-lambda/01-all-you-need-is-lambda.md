# 01 All you need is lambda

## 1.1 All you need is Lambda
Lambda calculus is a model of computation.
Devised in 1930s by Alonzo Church.

A CALCULUS is a METHOD of calculation or reasoning.
The lambda calculus is one process for formalizing a method.
Haskell is built on lambda calculus.

## 1.2 What is functional programming?
Functional programming is a computer programming paradigm.
It relies on functions modeled on mathematical functions.

In FP, programs are a combination of EXPRESSIONS.

Expressions include: concrete values, variables, functions.

Functions are expressions that are applied to an argument (or input).
Once applied, they can be reduced, or evaluated.

FP languages are ALL based on the lambda calculus.

Referential transparency / "purity" in functional programming refers to
functions, given the same values to evaluate, will always return the same
result.



## 1.3 What is a function?
A function is a RELATION.
A relation between a SET of possible inputs and a SET of possible outputs.
A function is a MAPPING between these 2 sets.



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


### Example
f(1) = A
f(2) = B
f(3) = C

This IS a valid function.
Different inputs can lead to the same output.


## 1.4 The structure of lambda terms
The lambda calculus has 3 basic components (LAMBDA TERMS)
1. expressions
2. variables
3. abstractions

Expression = SUPERSET of all these things.
An expression can be a variable name, an abstraction, or a combination of these
things.

Simplest expression: a single variable.
Variables: (here) have no meaning / value; just names for potential inputs to
functions.
Abstraction:
- a function
- consist of 2 parts:
  1. head
    - a lambda
    - variable name
      - the variable named in the head is the PARAMETER
      - the parameter BINDS all instances of that same variable in the body
        - this means that when we apply this function to an argument, each x in
          the body of the function will have the value of THAT argument
  2. body
    - another expression

A simple function:
λx.x

This lambda abstraction has no name.
It is an ANONYMOUS function.

--------------------------------------------------------------------------------
LAMBDA ABSTRACTION = ANONYMOUS FUNCTION
Usual notation:
λx → x²

Another common, equivalent notation:
λx.x²

In Haskell source code, the Greek lambda is replaced by a backslash character \
This is because it is easier to type, and requires only the basic 7-bit ASCII
character set.
Similarly, the arrow is replaced with the ASCII character sequence '->'

So, the lambda abstraction above would be written in Haskell as:
\x -> x * x

There is actually a whole mathematical theory devoted to expressing computation
entirely using lambda abstractions: the lambda calculus.

Most function programming languages are based upon some extension of this idea.

When a lambda abstraction is APPLIED to a VALUE:
(\x -> x * x) 7

The result of the expression is determined by replacing every FREE OCCURRENCE o
the PARAMETER VARIABLE (in this case x) with the PARAMETER VALUE (in this case
7). This is a BETA REDUCTION.

--------------------------------------------------------------------------------

A named function can be called by name by another funciton.
An anonymous function cannot.

λ x . x
|---|
HEAD

    |----|
     BODY

The dot (.) separates the PARAMETERS of the lambda from the function BODY

The abstract as a whole has no NAME.
The reason we call it an abstraction is that it is a generalization
(abstraction) from a concrete instance of a problem.
It abstracts through the introduction of names.


## Alpha equivalence
The variable x is not semantically meaningful.
\x -> x
\d -> d
These all mean the same thing.
They are all the same function.

## Beta reduction
When we APPLY a function to an ARGUMENT,
we SUBSTITUTE the INPUT EXPRESSION for all instances of bound variables
within the body of the abstraction.

You also eliminate the HEAD of the abstraction.
This is because its only purpose was to bind a variable.

This PROCESS is called beta reduction.

This function:
\x -> x

We'll do our first beta reduction using a number.
We apply the function to 2,
substitute 2 for each bound variable in the body of the function,
and eliminate the head:

(λx.x) 2
       2

The only bound variable is the single x,
so apply this function to 2, returns 2
This function is the IDENTITY FUNCTION.
All it does is accept a single argument x, and return that same argument.

Let use an example that mixes some arithmetic into our lambda calculus.
We use the parentheses to clarify that the body expression is x + 1
ie. we are not applying the function to the 1:

(λx.x+1)

Eliminating the head TELLS US that the function has BEEN APPLIED.

----
(λx.x)(λy.y)
[x:=(λy.y)]
      λy.y

      Our result is another identity function
      There is no argument to apply to it, so we have nothing to reduce

      The [x:=z] syntax
      Indicates that z will be substituted for all occurrences of x
      (here, z is the function λy.y)

----
Once more, but this time we'll add another argument

(λx.x)(λy.y)z

Applications in the lambda calculus are LEFT ASSOCIATIVE
This means that unless specific parentheses suggest otherwise,
they associate (group) to the left

So:
(λx.x)(λy.y)z

Is the same as:
((λx.x)(λy.y))z
[x:=(λy.y)]
(λy.y)z
[y:=z]
z

We can't reduce this any further as there is nothing left to apply.
The process of beta reduction stops when there are either
- no more heads, or
- no more lambdas left to aply, or
- no more arguments to apply functions to.

## Free variables
The purpose of the head of the function is to to TELL us which variables to
replace when we apply our function (ie. to BIND the variables)

A bound variable must have the same value throughout the expression.

But sometimes the body expression has variables that are not named in the head.
These variables are FREE VARIABLES.

λx.xy
x in the BODY is a BOUND VARIABLE because it is NAMED in the HEAD of the
function
y is a FREE VARIABLE because it is not

When we apply this function to an argument, nothing can be done with the y.
It remains irreducible.

---
(λx.xy)z

(λ[x:=z].xy)
zy

NB. alpha equivalence does not apply to free variables.
λx.xz is not equivalent to λx.xy
because z and y may be different things.

However,
λxy.yx and λab.ba are equivalent due to alpha equivalence.

## 1.6 Multiple arguments
Each lambda can only bind ONE PARAMETER and can only accept ONE ARGUMENT.
Functions that require multiple arguments have MULTIPLE, NESTED HEADS

This formulation was originally discovered by Moses Schonfinkel in 1920s
Later rediscovered and named after Haskell Curry
Commonly called currying

λxy.xy
is actually a convenient shorthand for
λx.(λy.xy)

2 nested lambdas (one for each argument, x and y)

## 1.7 Evaluation is simplification
There are multiple normal forms in lambda calculus
In this book, normal form = "beta normal form"

Beta normal form = cannot beta reduce (apply lambdas to arguments) the terms any
further.
This corresponds to a "fully evaluated expression".
(In programming, a "fully executed program")


The expression 2000/1000 is not fully evaluated,
because the division function has not been fully applied
THere is a simpler form that it can be reduced to: the number 2
The normal form is 2.

## 1.8 Combinators
A combinator is a lambda term with no free variables.
Combinators only serve to COMBINE the ARGUMENTS they are given.
Every term in the BODY occurs in the HEAD

λx.x
λxy.x
λxyz.xz(yz)


These are not combinators:
λy.z
λx.xz

## 1.9 Divergence
Divergence means that the reduction process never ends.
Reducing terms should normally CONVERGE to beta normal form

## 1.10 Summary
The meaning of Haskell programs is centered around EVALUATING EXPRESSIONS rather
than EXECUTING INSTRUCTIONS.
(although Haskell has a way to execute instructions too)

----
λxyz.xy(zxy)
This is a lambda.
HEAD is λxyz
BODY is xy(zxy)
No free variables, so it is a combinator.

(λx.xxx)z
does not diverge
it reduces to zzz
