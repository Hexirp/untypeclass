{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Semigroupoid
  ( Semigroupoid(Semigroupoid)
  , compose
  ) where

  -- > (.) = compose #
  -- > x . (y . z) = (x . y) . z
  data Semigroupoid :: (* -> * -> *) -> * where
    Semigroupoid ::
      { compose :: (forall a b c. cat b c -> cat a b -> cat a c)
      } -> Semigroupoid cat
