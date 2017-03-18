{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Bifunctor
  ( Bifunctor(Bifunctor)
  , bifunctor
  , extend_pfunctor
  , extend_qfunctor
  ) where
  import PFunctor (PFunctor)
  import QFunctor (QFunctor)

  data Bifunctor :: (* -> * -> *) -> (* -> * -> *) -> (* -> * -> *) -> (* -> * -> *) -> * where
    Bifunctor ::
      { extend_pfunctor :: PFunctor cat1 dat pro
      , extend_qfunctor :: QFunctor cat2 dat pro
      } -> Bifunctor cat1 cat2 dat pro

  bifunctor = Bifunctor