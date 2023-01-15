if [ -d "lib" ]
then
    echo "Directory lib exists."
else
    echo "Directory lib does not exists. We leave this folder"
    cd ..
fi
flutter packages pub run build_runner build --delete-conflicting-outputs

flutter format -l 80 lib

killall -9 dart
