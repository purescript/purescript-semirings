module Data.Semiring.Free
  ( Free()
  , runFree
  , free
  , liftFree
  , lowerFree
  ) where

import Prelude

import Data.List (List(..), singleton)
import Data.Foldable (Foldable, fold, foldl, foldr, foldMap, sum, product)
import Data.Traversable (Traversable, sequence)

-- | The free `Semiring` for a type `a`.
newtype Free a = Free (List (List a))

-- | Unpack a value of type `Free a`.
runFree :: forall a. Free a -> List (List a)
runFree (Free xs) = xs

-- | Lift a value of type `a` to a value of type `Free a`
free :: forall a. a -> Free a
free a = Free (singleton (singleton a))

-- | `Free` is left adjoint to the forgetful functor from `Semiring`s to types.
liftFree :: forall a s. (Semiring s) => (a -> s) -> Free a -> s
liftFree f (Free xss) = sum (map (product <<< map f) xss)

-- | `Free` is left adjoint to the forgetful functor from `Semiring`s to types.
lowerFree :: forall a s. (Semiring s) => (Free a -> s) -> a -> s
lowerFree f a = f (free a)

instance showFree :: (Show a) => Show (Free a) where
  show (Free xss) = "Free (" <> show xss <> ")"

instance eqFree :: (Eq a) => Eq (Free a) where
  eq (Free xss) (Free yss) = xss == yss

instance ordFree :: (Ord a) => Ord (Free a) where
  compare (Free xss) (Free yss) = compare xss yss

instance semiringFree :: Semiring (Free a) where
  add (Free xss) (Free yss) = Free (xss <> yss)
  zero = Free Nil
  mul (Free xss) (Free yss) = Free do
    xs <- xss
    ys <- yss
    return (xs <> ys)
  one = Free (singleton Nil)

instance functorFree :: Functor Free where
  map fn (Free xss) = Free $ map fn <$> xss

instance applyFree :: Apply Free where
  apply (Free fnss) (Free xss) = Free $ do
    fns <- fnss
    xs <- xss
    pure $ apply fns xs

instance applicativeFree :: Applicative Free where
  pure = free

instance foldableFree :: Foldable Free where
  foldl fn accum (Free xss) = foldl (foldl fn) accum xss
  foldr fn accum (Free xss) = foldr (flip $ foldr fn) accum xss
  foldMap fn (Free xss) = fold $ foldMap (fn <$>) xss

instance traversableFree :: Traversable Free where
  sequence (Free xss) = Free <$> (sequence $ sequence <$> xss)
  traverse fn freeA = sequence (fn <$> freeA)
