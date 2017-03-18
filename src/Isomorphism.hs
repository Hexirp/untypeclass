{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Isomorphism
  ( Isomorphism (Isomorphism)
  , to
  , from
  ) where

  data Isomorphism :: (* -> * -> *) -> * -> * -> * where
    Isomorphism ::
      { to :: cat a b
      , from :: cat b a
      } -> Isomorphism cat a b
