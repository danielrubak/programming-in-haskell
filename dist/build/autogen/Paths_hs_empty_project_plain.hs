{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_hs_empty_project_plain (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/daniel/Documents/programming-in-haskell/.cabal-sandbox/bin"
libdir     = "/home/daniel/Documents/programming-in-haskell/.cabal-sandbox/lib/x86_64-linux-ghc-8.0.2/hs-empty-project-plain-0.1.0.0-KteVdRdTFUvKsIlUbfXJQG"
dynlibdir  = "/home/daniel/Documents/programming-in-haskell/.cabal-sandbox/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/daniel/Documents/programming-in-haskell/.cabal-sandbox/share/x86_64-linux-ghc-8.0.2/hs-empty-project-plain-0.1.0.0"
libexecdir = "/home/daniel/Documents/programming-in-haskell/.cabal-sandbox/libexec"
sysconfdir = "/home/daniel/Documents/programming-in-haskell/.cabal-sandbox/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hs_empty_project_plain_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hs_empty_project_plain_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hs_empty_project_plain_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hs_empty_project_plain_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hs_empty_project_plain_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hs_empty_project_plain_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
