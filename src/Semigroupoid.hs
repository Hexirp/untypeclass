{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Semigroupoid
  ( Semigroupoid(Semigroupoid)
  , semigroupoid
  , compose
  ) where

  data Semigroupoid :: (* -> * -> *) -> * where
    Semigroupoid ::
      { compose :: (forall a b c. cat b c -> cat a b -> cat a c)
      } -> Semigroupoid cat

  semigroupoid
    :: (forall a b c. cat b c -> cat a b -> cat a c)
    -> Semigroupoid cat
  semigroupoid = Semigroupoid
