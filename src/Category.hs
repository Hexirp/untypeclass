{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Category
  ( Category
  , category
  , id
  , module Semigroupoid
  ) where
  import Semigroupoid

  data Category :: (* -> * -> *) -> * where
    Category
      :: Semigroupoid cat
      -> (forall a. cat a a)
      -> Category cat

  category 
    :: (forall a b c. cat b c -> cat a b -> cat a c)
    -> (forall a. cat a a)
    -> Category cat
  category c i = Category (semigroupoid c) i

  id
    :: Category cat
    -> cat a a
  id (Category _ f) = f