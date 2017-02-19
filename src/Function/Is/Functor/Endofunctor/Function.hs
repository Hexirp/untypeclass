{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Function.Is.Functor.Endofunctor.Function 
  ( function_is_functor_endofunctor_function
  ) where
  import Functor.Endofunctor.Function

  function_is_functor_endofunctor_function :: Function ((->) r)
  function_is_functor_endofunctor_function = function f
    where f x y z = x (y z)