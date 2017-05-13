{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

-- | Functor's module.
module Data.Categorical.Functor
  ( Square
  , makeSquare
  , Functor
  , fromCategory
  , liftComposing
  ) where
  import Control.Arrow ((&&&), (|||))
  import Data.Either (Either)
  import Data.Categorical.Category (Category, Composing(..), composing)
  
  -- | Functions of Square.
  type Square a b c d = (a -> (b, c), Either b c -> d)

  -- | Make Square.
  makeSquare
    :: (a -> b)
    -> (a -> c)
    -> (b -> d)
    -> (c -> d)
    -> Square a b c d
  makeSquare f g h i = (f &&& g, h ||| i)

  -- | Mapping between two categories.
  type Functor cat dat f = forall a b. Square
    (Composing cat a b)
    (cat a b)
    (Composing dat (f a) (f b))
    (dat (f a) (f b))

  fromCategory
    :: Category cat
    -> Category dat
    -> (forall a b. cat a b -> dat (f a) (f b))
    -> Functor cat dat f
  fromCategory c d f = fromCategory c d f
  
  liftComposing
    :: (forall a b. cat a b -> dat (f a) (f b))
    -> Composing cat a b -> Composing dat (f a) (f b)
  liftComposing = liftComposing

