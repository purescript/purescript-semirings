## Module Data.Semiring.Free

#### `Free`

``` purescript
newtype Free a
```

The free `Semiring` for a type `a`.

##### Instances
``` purescript
instance showFree :: (Show a) => Show (Free a)
instance eqFree :: (Eq a) => Eq (Free a)
instance ordFree :: (Ord a) => Ord (Free a)
instance semiringFree :: Semiring (Free a)
instance functorFree :: Functor Free
instance applyFree :: Apply Free
instance applicativeFree :: Applicative Free
instance foldableFree :: Foldable Free
instance traversableFree :: Traversable Free
```

#### `runFree`

``` purescript
runFree :: forall a. Free a -> List (List a)
```

Unpack a value of type `Free a`.

#### `free`

``` purescript
free :: forall a. a -> Free a
```

Lift a value of type `a` to a value of type `Free a`

#### `liftFree`

``` purescript
liftFree :: forall a s. (Semiring s) => (a -> s) -> Free a -> s
```

`Free` is left adjoint to the forgetful functor from `Semiring`s to types.

#### `lowerFree`

``` purescript
lowerFree :: forall a s. (Semiring s) => (Free a -> s) -> a -> s
```

`Free` is left adjoint to the forgetful functor from `Semiring`s to types.


