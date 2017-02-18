{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Function.Is.Category
  ( function_is_category
  ) where
  import Category

  function_is_category :: Category (->)
  function_is_category = category f g
    where
      f x y z = x (y z)
      g x     = x