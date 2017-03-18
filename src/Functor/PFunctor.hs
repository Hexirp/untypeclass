{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE LiberalTypeSynonyms #-}

module Functor.PFunctor
  ( PFunctor(PFunctor)
  , pfunctor
  , extend_funcor
  ) where
  import Functor

  type Flip t a b = t b a

  data PFunctor :: (* -> * -> *) -> (* -> * -> *) -> (* -> * -> *) -> * where
    PFunctor ::
      { extend_functor :: (forall a. Functor cat dat (Flip pro a) f)
      } -> PFunctor cat dat pro f

  pfunctor = PFunctor