{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_bob (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,4,0,10] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/joshfriedlander/Exercism/haskell/bob/.stack-work/install/x86_64-osx/bc871b1ab5554f03fb0d00c3f4c05a49a41a8d23dec0c96a1c2165052896a39a/8.8.3/bin"
libdir     = "/Users/joshfriedlander/Exercism/haskell/bob/.stack-work/install/x86_64-osx/bc871b1ab5554f03fb0d00c3f4c05a49a41a8d23dec0c96a1c2165052896a39a/8.8.3/lib/x86_64-osx-ghc-8.8.3/bob-1.4.0.10-2ZA9Aanmcng3tqBz4IL0IS"
dynlibdir  = "/Users/joshfriedlander/Exercism/haskell/bob/.stack-work/install/x86_64-osx/bc871b1ab5554f03fb0d00c3f4c05a49a41a8d23dec0c96a1c2165052896a39a/8.8.3/lib/x86_64-osx-ghc-8.8.3"
datadir    = "/Users/joshfriedlander/Exercism/haskell/bob/.stack-work/install/x86_64-osx/bc871b1ab5554f03fb0d00c3f4c05a49a41a8d23dec0c96a1c2165052896a39a/8.8.3/share/x86_64-osx-ghc-8.8.3/bob-1.4.0.10"
libexecdir = "/Users/joshfriedlander/Exercism/haskell/bob/.stack-work/install/x86_64-osx/bc871b1ab5554f03fb0d00c3f4c05a49a41a8d23dec0c96a1c2165052896a39a/8.8.3/libexec/x86_64-osx-ghc-8.8.3/bob-1.4.0.10"
sysconfdir = "/Users/joshfriedlander/Exercism/haskell/bob/.stack-work/install/x86_64-osx/bc871b1ab5554f03fb0d00c3f4c05a49a41a8d23dec0c96a1c2165052896a39a/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "bob_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "bob_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "bob_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "bob_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bob_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bob_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)