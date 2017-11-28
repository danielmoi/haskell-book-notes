# Chapter 3 - Strings

## 3.1 Printing Strings

## 3.2 A first look at types
Types are a way of CATEGORIZING values.
The types in this chapter are `Char` and `String`

We can inspect the TYPE of a value in Prelude with `:type`

Again, the `::` symbol is read as "has the type".
Whenever we see the double colon, we are looking at a TYPE SIGNATURE.
A type signature is a line of code that defines the types for a value,
expression, or function.

```
Prelude> :type 'a'
'a' :: Char
```

```
Prelude> :type "Hello!"
"Hello!" :: [Char]
```
NB. we have to use double quotes, else we get this error:
```
<interactive>:12:14: error:
    lexical error in string/character literal at end of input
```

THe square brackets around `Char` are syntactic sugar for a LIST.
`String` is a TYPE ALIAS / TYPE SYNONYM for a LIST OF `Char`


A type alias is when we use a NAME for a type, but there is a different type
name UNDERNEATH.
`String` is another NAME for a list of `Char` (characters).

## 3.3 Printing simple strings
We use the keyword `print`

```
Prelude> print "hello!"
"hello!"
Prelude>
```

We can also use the keyword `putStrLn`.
This removes the quotes.
```
Prelude> putStrLn "hello!"
hello!
Prelude>
```
We can also use the keyword `putStr`.
This removes the quotes, and omits the newline character.
```
Prelude> putStrLn "hello!"
hello!Prelude>
```

`putStrLn` and `putStr` are similar to `print` but they all have a different
TYPE to `print`.
Functions can be similar on the surface, but behave differently depending on the
TYPE or CATEGORY they belong to.

```
Prelude> :type print
print :: Show a => a -> IO ()

Prelude> :type putStrLn
putStrLn :: String -> IO ()

Prelude> :type putStr
putStr :: String -> IO ()
```

`main` is the default ACTION when you build an executable.
It is NOT a function.
It is often a series of instructions to execute, which can include:
- applying functions
- producing side-effects
When building a project with Stack, having a `main` executable is obligatory,
but you can have source files, and load them in GHCi, without having a `main`
block.

`main` has the TYPE `IO ()`.
`IO` stands for input/output.
This has a special meaning in Haskell. It is a SPECIAL TYPE used when the result
of running the program involves EFFECTS in addition to them being a function or
expression.
Printing to the screen is an EFFECT, so printing the output of a module ust be
WRAPPED in this `IO` TYPE.
Functions entered directly into the REPL will be wrapped by `GHCi`. It
understands and implements `IO` without needing us to do that.


