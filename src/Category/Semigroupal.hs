{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Category.Semigroupal
  ( Semigroupal(Semigroupal)
  , tensor_product
  , associator
  ) where
  import Functor.Bifunctor (Bifunctor)
  import Isomorphism (Isomorphism)

  -- associator . associator = id * associator . associator . associator
  data Semigroupal :: (* -> * -> *) -> (* -> * -> *) -> * where
    Semigroupal ::
      { tensor_product :: Bifunctor cat cat cat pro
      , associator :: (forall a b c. Isomorphism cat (pro (pro a b) c) (pro a (pro b c)))
      } -> Semigroupal cat pro
