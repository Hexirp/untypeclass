-- | Semigroupoid's module
module Data.Categorical.Semigroupoid
  ( Semigroupoid
  ) where

  -- | Composition
  --
  -- > k f (k g h) === k (k f g) h
  type Semigroupoid cat = forall a b c. cat b c -> cat a b -> cat a c
