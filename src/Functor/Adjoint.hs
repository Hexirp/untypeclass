{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Adjoint where
  import Functor (Functor)
  import Isomorphism (Isomorphism)

  data Adjoint :: (* -> * -> *) -> (* -> * -> *) -> (* -> *) -> (* -> *) -> * where
    Adjoint ::
      { leftFunctor :: Functor cat dat f
      , rightFunctor :: Functor dat cat g
      , adjunct :: (forall a b. Isomorphism (dat (f a) b) (cat a (g b)))
      } -> Adjoint cat dat f g