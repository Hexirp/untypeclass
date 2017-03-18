{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor
  ( Functor
  , functor
  , sourceCategory
  , targetCategory
  , fmap
  ) where
  import Category
  
  data Functor :: (* -> * -> *) -> (* -> * -> *) -> (* -> *) -> * where
    Functor :: 
      { sourceCategory :: Category cat
      , targetCategory :: Category dat
      , fmap :: (forall a b. cat a b -> dat (f a) (f b))
      } -> Functor cat dat f

  functor
    :: Category cat
    -> Category dat
    -> (forall a b. cat a b -> dat (f a) (f b))
    -> Functor cat dat f
  functor = Functor
