{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Monoidal.Endo
  ( Endo(Endo)
  , extend_monoidal
  ) where
  import Functor.Monoidal

  data Endo :: (* -> * -> *) -> (* -> * -> *) -> * -> (* -> *) -> * where
    Endo ::
      { extend_monoidal :: Monoidal cat pro i cat pro i f
      } -> Endo cat pro i f
