{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Semigroupoid
  ( Semigroupoid
  ) where

  type Semigroupoid cat = forall a b c. cat b c -> cat a b -> cat a c
