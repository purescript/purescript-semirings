module Data.Semiring.Boolean
  ( BooleanSemiring(..)
  , runBooleanSemiring
  ) where

import Prelude

-- | Provides the semiring for any boolean algebra.
newtype BooleanSemiring a = BooleanSemiring a

runBooleanSemiring :: forall a. BooleanSemiring a -> a
runBooleanSemiring (BooleanSemiring a) = a

instance functorBooleanSemiring :: Functor BooleanSemiring where
  map f = BooleanSemiring <<< f <<< runBooleanSemiring

instance applyBooleanSemiring :: Apply BooleanSemiring where
  apply = map <<< runBooleanSemiring

instance applicativeBooleanSemiring :: Applicative BooleanSemiring where
  pure = BooleanSemiring

instance booleanSemiringBounded :: (BooleanAlgebra a) => Bounded (BooleanSemiring a) where
  top = pure top
  bottom = pure bottom

instance booleanSemiringBooleanAlgebra :: (BooleanAlgebra a) => BooleanAlgebra (BooleanSemiring a) where
  disj a b = disj <$> a <*> b
  conj a b = conj <$> a <*> b
  not a = not <$> a

instance booleanSemiringSemiring :: (BooleanAlgebra a) => Semiring (BooleanSemiring a) where
  one = top
  zero = bottom
  add = disj
  mul = conj

