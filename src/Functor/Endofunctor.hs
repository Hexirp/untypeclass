{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Endofunctor
  ( Endofunctor
  , endofunctor
  , fmap_endofunctor
  , module Functor
  ) where
  import Functor

  data Endofunctor :: (* -> * -> *) -> (* -> *) -> * where
    Endofunctor
      :: Functor cat cat f
      -> Endofunctor cat f

  endofunctor
    :: Category cat
    -> (forall a b. cat a b -> cat (f a) (f b))
    -> Endofunctor cat f
  endofunctor c f = Endofunctor (functor c c f)

  fmap_endofunctor
    :: Endofunctor cat f
    -> cat a b -> cat (f a) (f b)
  fmap_endofunctor (Endofunctor f) = fmap f