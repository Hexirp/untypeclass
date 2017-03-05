{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Contravariant where
  import Functor

  data Flip f a b = Flip (f b a)

  data Contravariant :: (* -> * -> *) -> (* -> * -> *) -> (* -> *) -> * where
    Contravariant
      :: Functor cat (Flip dat) f
      -> Contravariant cat dat f