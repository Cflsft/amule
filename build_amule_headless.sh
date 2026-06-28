#!/bin/bash

set -e

echo "📁 Preparando entorno de compilación..."
cd "$(dirname "$0")"

rm -rf build
mkdir build
cd build

echo "⚙️ Ejecutando CMake..."
cmake .. \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_DAEMON=ON \
  -DBUILD_AMULECMD=ON \
  -DBUILD_WEBSERVER=ON \
  -DBUILD_MONOLITHIC=OFF \
  -DBUILD_REMOTEGUI=OFF \
  -DBUILD_ALC=OFF \
  -DBUILD_ALCC=OFF \
  -DENABLE_NLS=OFF 

echo "🛠️ Compilando aMule..."
make -j$(nproc)

echo "✅ Compilación completada. Puedes instalar con:"
echo "   sudo make install"
sudo make install
