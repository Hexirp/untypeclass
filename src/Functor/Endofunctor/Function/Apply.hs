{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.Endofunctor.Function.Apply where
  import Functor.Endofunctor.Function

  data Duple a b = Duple a b

  data Kleisli :: (* -> *) -> * -> * -> * where
    Kleisli
      :: (a -> f b)
      -> Kleisli f a b

  data Product :: (* -> * -> *) -> (* -> * -> *) -> * where
    Product
      :: (forall a b c. cat a b -> cat a c -> cat a (pro b c))
      -> Product cat pro

  data Apply :: (* -> *) -> * where
    Apply
      :: Product (Kleisli f) Duple -- 「ある圏に対する直積が存在した時、それは同型を含めて、ただ一つのみである」。よって、Dupleというオリジナルなタプルを使っても問題ない。
      -> Function f
      -> Apply f