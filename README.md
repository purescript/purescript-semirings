# purescript-semirings

[![Latest release](http://img.shields.io/github/release/purescript/purescript-semirings.svg)](https://github.com/purescript/purescript-semirings/releases)
[![Build Status](https://github.com/purescript/purescript-semirings/workflows/CI/badge.svg?branch=master)](https://github.com/purescript/purescript-semirings/actions?query=workflow%3ACI+branch%3Amaster)
[![Pursuit](https://pursuit.purescript.org/packages/purescript-semirings/badge)](https://pursuit.purescript.org/packages/purescript-semirings)

Semiring instances and functions

## Example

```purs
toFree = Free <<< Data.List.fromFoldable <<< map (Data.List.fromFoldable)

main :: Effect Unit
main = do
  logShow $ (toFree [[1, 2]]) + (toFree [[3, 4]])
  -- (Free ((1 : 2 : Nil) : (3 : 4 : Nil) : Nil))

  logShow $ (toFree [[1, 2]]) * (toFree [[3, 4]])
  -- (Free ((1 : 2 : 3 : 4 : Nil) : Nil))

  logShow $ (toFree [[1], [2]]) + (toFree [[3, 4]])
  -- (Free ((1 : Nil) : (2 : Nil) : (3 : 4 : Nil) : Nil))

  logShow $ (toFree [[1], [2]]) * (toFree [[3, 4]])
  -- (Free ((1 : 3 : 4 : Nil) : (2 : 3 : 4 : Nil) : Nil))

  -----------------------

  logShow $ (toFree [[1, 2], [3, 4]]) + (toFree [[5, 6], [7, 8]])
  -- (Free ((1 : 2 : Nil) : (3 : 4 : Nil) : (5 : 6 : Nil) : (7 : 8 : Nil) : Nil))

  logShow $ (toFree [[1, 2], [3, 4]]) * (toFree [[5, 6], [7, 8]])
  -- (Free ((1 : 2 : 5 : 6 : Nil) : (1 : 2 : 7 : 8 : Nil) : (3 : 4 : 5 : 6 : Nil) : (3 : 4 : 7 : 8 : Nil) : Nil))

  --------------------------

  logShow $ zero + (toFree [[1, 2], [3, 4]])
  -- (Free ((1 : 2 : Nil) : (3 : 4 : Nil) : Nil))

  logShow $ one + (toFree [[1, 2], [3, 4]])
  -- (Free (Nil : (1 : 2 : Nil) : (3 : 4 : Nil) : Nil))

  logShow $ zero * (toFree [[1, 2], [3, 4]])
  -- (Free Nil)

  logShow $ one * (toFree [[1, 2], [3, 4]])
  -- (Free ((1 : 2 : Nil) : (3 : 4 : Nil) : Nil))
```

## Installation

```
spago install semirings
```

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-semirings).
