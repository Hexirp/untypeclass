{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.PFunctor
  ( PFunctor(PFunctor)
  , pfunctor
  , extend_functor
  , Flip(Flip)
  , flip
  ) where
  import Data.Categorical.Functor (Functor)

  newtype Flip t a b = Flip { flip :: t b a }

  data PFunctor :: (* -> * -> *) -> (* -> * -> *) -> (* -> * -> *) -> * where
    PFunctor ::
      { extend_functor :: (forall a. Functor cat dat (Flip pro a))
      } -> PFunctor cat dat pro

  pfunctor = PFunctor
