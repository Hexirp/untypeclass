{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor
  ( Functor
  , functor
  , fmap
  , module Category
  ) where
  import Category
  
  data Functor :: (* -> * -> *) -> (* -> * -> *) -> (* -> *) -> * where
    Functor
      :: Category cat
      -> Category dat
      -> (forall a b. cat a b -> dat (f a) (f b))
      -> Functor cat dat f

  functor
    :: Category cat
    -> Category dat
    -> (forall a b. cat a b -> dat (f a) (f b))
    -> Functor cat dat f
  functor = Functor

  fmap
    :: Functor cat dat f
    -> cat a b -> dat (f a) (f b)
  fmap (Functor _ _ f) = f