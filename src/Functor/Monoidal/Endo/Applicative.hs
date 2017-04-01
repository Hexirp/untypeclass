{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Monoidal.Endo.Applicative where
  import Functor.Monoidal.Endo (Endo)

  data Applicative :: (* -> *) -> * where
    Applicative ::
      { extend_endo :: Endo (->) (,) () f
      } -> Applicative f