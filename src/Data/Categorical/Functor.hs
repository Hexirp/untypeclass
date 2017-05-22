-- | Functor's module.
module Data.Categorical.Functor
  ( Square
  , makeSquare
  , Functor
  , fromCategory
  , liftComposing
  , srcCat
  , fmapCmps
  , mkFmap
  -- , tgtCat
  ) where
  import Control.Arrow ((&&&), (|||))
  import Data.Tuple (fst, snd)
  import Data.Either (Either(..))
  import Data.Function ((.), ($))
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

  -- | Make 'Functor' from 'Category' anda function.
  fromCategory
    :: Category cat
    -> Category dat
    -> (forall a b. cat a b -> dat (f a) (f b))
    -> Functor cat dat f
  fromCategory c d f = makeSquare c (liftComposing f) f d

  -- | Convert a function to act on 'Composing'
  liftComposing
    :: (forall a b. cat a b -> dat (f a) (f b))
    -> Composing cat a' b' -> Composing dat (f a') (f b')
  liftComposing _ Id = Id
  liftComposing f (Composed x xs) = Composed (f x) $ liftComposing f xs

  -- | Convert 'Functor' to source 'Category'
  srcCat :: Functor cat dat f -> Category cat
  srcCat x = fst . (fst x)

  -- | Convert 'Functor' to lifted fmap
  fmapCmps
    :: Functor cat dat f
    -> Composing cat a b -> Composing dat (f a) (f b)
  fmapCmps x = snd . (fst x)

  -- | Convert 'Functor' to fmap
  mkFmap :: Functor cat dat f -> cat a b -> dat (f a) (f b)
  mkFmap x = (snd x) . Left

  -- -- | Convert 'Functor' to target 'Category'
  -- tgtCat :: Functor cat dat f -> Category dat
  -- tgtCat x = (snd x) . Right

  -- | Lift 'Category'
  data LiftBoth f cat a b = InLiftB { outLiftB :: cat (f a) (f b) }

