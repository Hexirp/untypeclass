{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor
  ( Functor
  , fromCategory
  , liftComposing
  ) where
  import Control.Arrow ((&&&))
  import Data.Either (Either, either)
  import Data.Function ((.), ($))
  import Category (Category, Composing(..), composing)
  
  type Functor cat dat f = forall a b. (
    Composing cat a b -> (cat a b, Composing dat (f a) (f b)),
    Either (cat a b) (Composing dat (f a) (f b)) -> dat (f a) (f b))
    
  fromCategory
    :: Category cat
    -> Category dat
    -> (forall a b. cat a b -> dat (f a) (f b))
    -> Functor cat dat f
  fromCategory c d f = (c &&& liftComposing f, either f d)
  
  liftComposing
    :: (forall a b. cat a b -> dat (f a) (f b))
    -> Composing cat a b -> Composing dat (f a) (f b)
  liftComposing = composing Id $ Composed . f
