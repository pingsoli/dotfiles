import os
import ycm_core

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
  '-Wall',
  '-Wextra',
  '-Werror',
  #'-Wno-long-long',
  #'-Wno-variadic-macros',
  #'-fexceptions',

  # THIS IS IMPORTANT! Without the '-x' flag, Clang won't know which language to
  # use when compiling headers. So it will guess. Badly. So C++ headers will be
  # compiled as C headers. You don't want that so ALWAYS specify the '-x' flag.
  # For a C project, you would set this to 'c' instead of 'c++'.

  '-std=c++11',
  '-x', 'c++',

  #'-x', 'c',

  '-isystem', '/usr/include/c++/7',
  '-isystem', '/usr/include',
  #  '-isystem', '/usr/local/boost/include',

  #  '-isystem', '/usr/include/x86_64-linux-gnu',
]


# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

# SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]
SOURCE_EXTENSIONS = [ '.cpp', '.cc', '.c' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]


def FindCorrespondingSourceFile( filename ):
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        return replacement_file
  return filename


def FlagsForFile( filename, **kwargs ):
  # If the file is a header, try to find the corresponding source file and
  # retrieve its flags from the compilation database if using one. This is
  # necessary since compilation databases don't have entries for header files.
  # In addition, use this source file as the translation unit. This makes it
  # possible to jump from a declaration in the header file to its definition in
  # the corresponding source file.
  filename = FindCorrespondingSourceFile( filename )

  if not database:
    return {
      'flags': flags,
      'include_paths_relative_to_dir': DirectoryOfThisScript(),
      'override_filename': filename
    }

  compilation_info = database.GetCompilationInfoForFile( filename )
  if not compilation_info.compiler_flags_:
    return None

  # Bear in mind that compilation_info.compiler_flags_ does NOT return a
  # python list, but a "list-like" StringVec object.
  final_flags = list( compilation_info.compiler_flags_ )

  # NOTE: This is just for YouCompleteMe; it's highly likely that your project
  # does NOT need to remove the stdlib flag. DO NOT USE THIS IN YOUR
  # ycm_extra_conf IF YOU'RE NOT 100% SURE YOU NEED IT.
  #try:
  #  final_flags.remove( '-stdlib=libc++' )
  #except ValueError:
  #  pass

  return {
    'flags': final_flags,
    'include_paths_relative_to_dir': compilation_info.compiler_working_dir_,
    'override_filename': filename
  }
