{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Isomorphism
  ( Isomorphism (Isomorphism)
  , to
  , from
  ) where
  import Category (Category)

  -- (.) = compose $ category #
  -- id' = id $ category #
  -- to . from = from . to = id'
  data Isomorphism :: (* -> * -> *) -> * -> * -> * where
    Isomorphism ::
      { category :: Category cat
      , to :: cat a b
      , from :: cat b a
      } -> Isomorphism cat a b
