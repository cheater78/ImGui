project "ImGui"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "on"
	warnings "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"*.h",
		"*.cpp"
	}

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "system:macosx"
		pic "On"

	filter "system:windows"
		systemversion "latest"

		defines 
		{ 
			"_CRT_SECURE_NO_WARNINGS"
		}
	
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"