## Module Data.Semiring.Boolean

#### `BooleanSemiring`

``` purescript
newtype BooleanSemiring a
  = BooleanSemiring a
```

Provides the semiring for any boolean algebra.

##### Instances
``` purescript
instance functorBooleanSemiring :: Functor BooleanSemiring
instance applyBooleanSemiring :: Apply BooleanSemiring
instance applicativeBooleanSemiring :: Applicative BooleanSemiring
instance booleanSemiringBounded :: (BooleanAlgebra a) => Bounded (BooleanSemiring a)
instance booleanSemiringBooleanAlgebra :: (BooleanAlgebra a) => BooleanAlgebra (BooleanSemiring a)
instance booleanSemiringSemiring :: (BooleanAlgebra a) => Semiring (BooleanSemiring a)
```

#### `runBooleanSemiring`

``` purescript
runBooleanSemiring :: forall a. BooleanSemiring a -> a
```


