{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module NaturalTransformation where
  import Data.Categorical.Functor (Functor)

  -- natural . sourceFunctor f = targetFunctor f . natural
  data NaturalTransformation :: (* -> * -> *) -> (* -> * -> *) -> (* -> *) -> (* -> *) -> * where
    NaturalTransformation ::
      { sourceFunctor :: Functor cat dat f
      , targetFunctor :: Functor cat dat g
      , natural :: (forall a. dat (f a) (g a))
      } -> NaturalTransformation cat dat f g
