{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Endo.Functor where
  import Endo (Endo)

  type Hask = (->)

  data Functor :: (* -> *) -> * where
    Functor ::
      { extend_endo :: Endo Hask f
      } -> Functor f
