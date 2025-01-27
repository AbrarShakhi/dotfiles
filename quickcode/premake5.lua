workspace "quickcode"
   architecture "x64"
   startproject "quickcpp"
   configurations { "debug", "final", "submit"}
   kind "ConsoleApp"

   targetname "x%{prj.name}"
   targetdir ".out"
   objdir ".out/obj"

   filter "configurations:debug"
      defines { "DEBUG", "AbrarShakhi" }
      runtime "Debug"
      symbols "On"

   filter "configurations:final"
      defines { "FINAL", "NDEBUG", "AbrarShakhi" }
      runtime "Release"
      optimize "On"

   filter "configurations:submit"
      defines { "SUBMIT", "NDEBUG" }
      optimize "On"


project "quickcpp"
language "C++"
cppdialect "C++17"
files {
   "*.cpp",
   "*.c++",
   "*.cxx",
   "*.h",
   "*.hpp",
   "*.hxx",
   "src/**"
}