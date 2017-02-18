{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Covariant.Function
  ( Function
  , function
  , fmap_function
  , module Functor.Covariant
  ) where
  import Function.Is.Category
  import Functor.Covariant

  data Function :: (* -> *) -> * where
    Function
      :: Covariant (->) f
      -> Function f

  function
    :: (forall a b. (a -> b) -> f a -> f b)
    -> Function f
  function f = Function (covariant function_is_category f)

  fmap_function
    :: Function f
    -> (a -> b) -> f a -> f b
  fmap_function (Function f) = fmap_covariant f