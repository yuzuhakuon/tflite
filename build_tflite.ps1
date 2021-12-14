function BuildForWindows($platform, $build_type) {
    $build_dir = "build"
    mkdir $build_dir -Force -ErrorAction Stop | Out-Null
    cd $build_dir
    pwd

    if ($platform -eq "x64") {
        $msbuild_platform = "x64"
    }
    else {
        $msbuild_platform = "Win32"
    }



    cmake -G "Visual Studio 16 2019" -A $msbuild_platform ../tensorflow/tensorflow/lite/c
    cmake --build . --config Release

    # msbuild INSTALL.vcxproj /t:build /p:configuration=$build_type /p:platform=$msbuild_platform -maxcpucount
    ls
    cd ..
}