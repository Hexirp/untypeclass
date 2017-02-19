{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Endofunctor.Function
  ( Function
  , function
  , fmap_function
  , module Functor.Endofunctor
  ) where
  import Function.Is.Category
  import Functor.Endofunctor

  data Function :: (* -> *) -> * where
    Function
      :: Endofunctor (->) f
      -> Function f

  function
    :: (forall a b. (a -> b) -> f a -> f b)
    -> Function f
  function f = Function (endofunctor function_is_category f)

  fmap_function
    :: Function f
    -> (a -> b) -> f a -> f b
  fmap_function (Function f) = fmap_endofunctor f