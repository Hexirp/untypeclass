{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Covariant
  ( Covariant
  , covariant
  , fmap_covariant
  , module Functor
  ) where
  import Functor

  data Covariant :: (* -> * -> *) -> (* -> *) -> * where
    Covariant
      :: Functor cat cat f
      -> Covariant cat f

  covariant
    :: Category cat
    -> (forall a b. cat a b -> cat (f a) (f b))
    -> Covariant cat f
  covariant c f = Covariant (functor c c f)

  fmap_covariant
    :: Covariant cat f
    -> cat a b -> cat (f a) (f b)
  fmap_covariant (Covariant f) = fmap f