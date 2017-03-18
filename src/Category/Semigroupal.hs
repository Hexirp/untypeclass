{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Category.Semigroupal
  ( Semigroupal(Semigroupal)
  , tensor_product
  , associator
  , Isomorphism (Isomorphism)
  , to
  , from
  ) where
  import Functor.Bifunctor (Bifunctor)

  data Isomorphism :: (* -> * -> *) -> * -> * -> * where
    Isomorphism
      { to :: cat a b
      , from :: cat b a
      } -> Isomorphism cat a b

  data Semgroupal :: (* -> * -> *) -> (* -> * -> *) -> * where
    Semgroupal
      { tensor_product :: Bifunctor cat cat cat pro
      , associator :: Isomorphism cat (pro (pro a b) c) (pro a (pro b c))
      } -> Semigroupal cat pro