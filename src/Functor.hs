{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor
  ( Functor
  , sourceCategory
  , targetCategory
  , fmap
  ) where
  import Category (Category)
  
  -- > id_c = id $ sourceCategory #
  -- > id_d = id $ targetCategory #
  -- > (.~) = compose $ extend_semigroupoid $ sourceCategory #
  -- > (~.) = compose $ extend_semigroupoid $ targetCategory #
  -- > map' = fmap #
  -- > map' id_c = id_d
  -- > map' (f .~ g) = map' f ~. map' g
  data Functor :: (* -> * -> *) -> (* -> * -> *) -> (* -> *) -> * where
    Functor :: 
      { sourceCategory :: Category cat
      , targetCategory :: Category dat
      , fmap :: (forall a b. cat a b -> dat (f a) (f b))
      } -> Functor cat dat f
