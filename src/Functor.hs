{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor
  ( Functor
  ) where
  import Data.Either (Either)
  import Category (Composing)
  
  type Functor cat dat f = forall a b. (
    Composing cat a b -> (cat a b, Composing dat (f a) (f b)),
    Either (cat a b) (Composing dat (f a) (f b)) -> dat (f a) (f b))
