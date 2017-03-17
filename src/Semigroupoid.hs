{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Semigroupoid
  ( Semigroupoid
  , semigroupoid
  , compose
  ) where

  data Semigroupoid :: (* -> * -> *) -> * where
    Semigroupoid
      :: (forall a b c. cat b c -> cat a b -> cat a c)
      -> Semigroupoid cat

  semigroupoid
    :: (forall a b c. cat b c -> cat a b -> cat a c)
    -> Semigroupoid cat
  semigroupoid = Semigroupoid

  compose
    :: Semigroupoid cat
    -> cat b c -> cat a b -> cat a c
  compose (Semigroupoid f) = f
