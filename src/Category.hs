{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Category
  ( Category(Category)
  , category
  , extend_semigroupoid
  , id
  ) where
  import Semigroupoid

  -- > (.) = compose $ extend_semigroupoid #
  -- > id' = id #
  -- > id' . x = x . id' = x
  data Category :: (* -> * -> *) -> * where
    Category ::
      { extend_semigroupoid :: Semigroupoid cat
      , id :: (forall a. cat a a)
      } -> Category cat

  category 
    :: (forall a b c. cat b c -> cat a b -> cat a c)
    -> (forall a. cat a a)
    -> Category cat
  category c i = Category (semigroupoid c) i
