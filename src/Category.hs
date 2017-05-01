{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Category
  ( Category(Category)
  , extend_semigroupoid
  , id
  ) where
  import Semigroupoid (Semigroupoid)

  -- > (.) = compose $ extend_semigroupoid #
  -- > id' = id #
  -- > id' . x = x . id' = x
  data Category :: (* -> * -> *) -> * where
    Category ::
      { extend_semigroupoid :: Semigroupoid cat
      , id :: (forall a. cat a a)
      } -> Category cat
