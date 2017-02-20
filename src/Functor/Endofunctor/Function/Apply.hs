{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Endofunctor.Function.Apply where
  import Functor.Endofunctor.Function

  -- | From <https://github.com/typelevel/cats/blob/v0.9.0/core/src/main/scala/cats/Cartesian.scala>
  data Cartesian :: (* -> *) -> * where
    Cartesian
      :: (forall a b c. (a -> f b) -> (a -> f c) -> a -> f (b, c))
      -> Cartesian f

  data Apply :: (* -> *) -> * where
    Apply
      :: Cartesian　f
      -> Function f
      -> Apply f