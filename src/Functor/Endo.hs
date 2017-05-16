{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Endo where
  import Data.Categorical.Functor (Functor)

  data Endo :: (* -> * -> *) -> (* -> *) -> * where
    Endo ::
      { extend_functor :: Functor cat cat f
      } -> Endo cat f
