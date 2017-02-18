{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Function.Is.Functor.Covariant.Function 
  ( function_is_functor_covariant_function
  ) where
  import Functor.Covariant.Function

  function_is_functor_covariant_function :: Function ((->) r)
  function_is_functor_covariant_function = function f
    where f x y z = x (y z)