# 02 Basic Expressions and Functions

## 2.2 Interacting with Haskell code

REPL = Read-Eval-Print Loop
Interactive programming environments


Prelude = a library of standard functions
They can be used without needing to do anything special.

:: is a way to write down a TYPE SIGNATURE
:: means "has the type"

sayHello :: String -> IO ()
means "sayHello" has the type String -> IO ()

----
We can load a file doing this:
```
:load test.hs
```

This will LOAD the file,
changing the SCOPE to the loaded file,
This is reflected in the prompt
*Main>

To get back to the Prelude> prompt, use :m (:module)

---
# 2.3 Understanding expressions

Everything in Haskell is an EXPRESSION or DECLARATION

Expressions may be:
- values
- combinations of values
- functions applied to values

Expressions EVALUATE to a result

Literal values are still evaluated, but the evaluation is trivial, because they
only evaluate to themselves.

Declarations
- top level bindings
- allow us to name expressions
- we can use those names to refer to expressions
- instead of copy-pasting them multiple times

Type something into the REPL

It will get EVALUATED as an EXPRESSION

The RESULT of the evalution is then printed

---
## Normal Form
Expressions are in normal form when they have reached an IRREDUCIBLE form

Reducible expressions = REDEXES

The process of evaluation  > evaluation is called:
- evaluation
- reduction
- normalizing (imprecise)
- executing (imprecise)


---
## 2.4 Functions
Expressions are the MOST BASIC UNIT of a Haskell program.
Fucntions are a specific TYPE of expression.

Fucntions in Haskell are related to functions in mathematics.
ie. they map an input / set of inputs to an output.

As in the lambda calculus, all functions in Haskell take ONE argument and return
ONE result.
When we are passing multiple arguments to a function, we are actually applying a
series of NESTED FUNCTIONS, each to ONE argument.
This is called CURRYING.

## Defining functions
Function definitions share a few things in common.
1. The name of the function
2. The formal PARAMETERS of the function, separated only by white space.
    The parameters correspond to the HEAD of a lambda
    They bind variables that appear in the body expression
3. Equals sign (which expressed equality of the terms)
4. Expression that is the body of the function, that is evaluated to return a
   value

## Argument vs parameter
Argument refers to the VALUE(S) that are passed to the function's parameters
when teh function is APPLIED.
Parameter = refers to the variables that represent the arguments in the
FUNCTION DEFINITION or the TYPE SIGNATURE.


---
## 2.5 Evaluation
Evaluating an expression: reducing the terms until the expression reaches its
simplest form.
Once a term has reached its simplest form, we say that it is irreducible or
finished evaluating.
We call this a VALUE.

NB. Haskell uses a nonstrict evaluation ("lazy evaluation") strategy, which
difers evaluation of terms until they're forced by other terms referring to
them.


Values are irreducible.
Values are expressions, but cannot be reduced further.
Values are a terminal point of reduction.

Examples of values (expressions that are values):
1
"Cookie Monster"

Examples of expression that can be reduced to a value:
1 + 1
2 * 3 + 1

We can replace applications of functions with their definitions, and get the
same result:
triple 2

triple 2
-- [triple x = x * 3; x := 2]
2 * 3
6

---
## Functions in REPL

Source file:
```
triple x = x * 3
```

REPL
```
let triple x = x * 3
```

---
## 2.6 Infix operators
Functions in Haskell default to PREFIX syntax.
This means that the function being applied is at the BEGINNING of the expression
(rather than the MIDDLE)

Not all functions are prefkex.
There are a group of OPERATORS (such as the arithmetic operators) that are
functions (they apply to arguments, to produce an output) but appear by default
in an INFIX position.

All operators are functions.
Not all functions are operators.

We can use infix operators in prefix fashion by wrapping them in parentheses:
```
(+) 100 100
```

If the function name is alphanumeric, it is a PREFIX function by default, and
not all prefix functions can be made infix.

## Associativity and precedence
We can use `:info` to ask GHCi about an operator or function:
```
*Main> :info (*)
class Num a where
  ...
  (*) :: a -> a -> a
  ...
  	-- Defined in ‘GHC.Num’
infixl 7 *
*Main> :info half
half :: Fractional a => a -> a 	-- Defined at 02-exercises.hs:2:1
```

`infixl` means:
- it is an infix operator (left associative)
- 7 is the PRECEDENCE; higher is applied first (scale of 0-9)
- `*` is the function NAME

---
```
2 * 3 * 4

-- is evaluated as if it were
(2 * 3) * 4

-- because of left-associativity from infixl
```

## 2.7 Declaring values
The order of declarations in a SOURCE FILE doesn't matter, because GHCi loads
the entire file at once, so it knows all the values that have been defined.

However, the order DOES matter in the REPL.


## Troubleshooting
In general, whitespace is SIGNIFICANT in Haskell.
Whitespace is often the only mark of a function call, unless parentheses are
used because of conflicting precedence.

In source code files, indentation often replaces syntactic markers (like curly
brackets, semicolons, and parentheses).
Code that is part of an expression should be indented UNDER the beginning of
that expression:

```
let
  x = 3
  y = 4
```

This is incorreect:
```
let x = 3
y = 4
```

## 2.8 Arithmetic functions
+     plus        addition
-     minus       subtraction
*     asterisk    multiplication
/     slash       fractional division
div   divide      integral division
mod   modulo      like rem, but after modular division
quot  quotient    integral division, round down
rem   remainder   remainder after division


Integral division = division with integers, returns integers as results

---
Negation of numbers by the use of a UNARY is a form of SYNACTIC SUGAR.
Syntax is the grammar and structure of the text we use to express programs.
Syntactic sugar is a means for us to make that text easier to read and write.

In the specific case of `-`, the syntactic sugar  means that the operator now
has 2 possible interpretations. `-` is translated into the KEYWORD `negate`

---
## $ operator
The $ operator is an infix operator with the lower possible precedence.
It is a convenience for when you want to express something with fewer pairs of
parentheses:

The definition of `$` is:
```
:info $
f $ a = f a
```


```
(2^) (2 + 2)

-- is the same as
(2^) $ 2 + 1

-- but not the same as
(2^) 2 + 2
```


## 2.10 Let and where
`let` introduces an EXPRESSION, so it can be used wherever you have an
expression.
`where` is a DECLARATION and is bound to a surrounding syntactic construct

`let` followed by `in` is a LET EXPRESSION

```
let x = 5 in x
-- 5
```

```
let x = 5 in x * x
-- 25
```

```
let x = 5; y = 6 in x * y
-- 30
```


