#!/bin/bash
#
# Create a .zip file locally, with all starter files needed, 
# to be run locally
#
# Usage:
#
#   ./scripts_rackham/00_create_starter_zip.sh
#
#
#

zip_filename=nsphs_ml_qt_rackham_starter_zip.zip

echo "Running on computer with HOSTNAME: $HOSTNAME"
echo "Running at location $(pwd)"
echo "zip_filename: $zip_filename"

if [[ $HOSTNAME != "N141CU" ]]; then
  echo "Error: this script must run locally"
  echo "HOSTNAME: $HOSTNAME"
  exit 42
fi

if [[ $(pwd) != "/home/richel/GitHubs/nsphs_ml_qt" ]]; then
  echo "Error: this script must run from '/home/richel/GitHubs/nsphs_ml_qt'"
  echo "pwd: $(pwd)"
  echo ""
  echo "Tip: run this script by using:"
  echo ""
  echo "  ./scripts_rackham/00_create_starter_zip.sh"
  exit 42
fi

# Go to GitHubs folder, will go back later
cd ..

# Clone a fresh GenoCAE folder
rm -rf GenoCAE
git clone https://github.com/richelbilderbeek/GenoCAE.git --branch Pheno --depth 1

# Copy folders to the zip's root
cp -r ~/.local/share/plinkr/plink_1_9_unix plink_1_9_unix
cp -r ~/.local/share/plinkr/plink_2_0_unix plink_2_0_unix

# Copy files for in the zip's root
cp nsphs_ml_qt/scripts_rackham/README.md README.md
cp nsphs_ml_qt/scripts_rackham/01_unzip_starter_zip.sh 01_unzip_starter_zip.sh
cp nsphs_ml_qt/scripts_rackham/98_clean_rackham.sh 98_clean_rackham.sh

zip -r --must-match $zip_filename \
  nsphs_ml_qt/ \
  GenoCAE/ \
  gcae/gcae.sif \
  plinkr/plinkr.sif \
  ~/.local/share/plinkr/plink_1_9_unix \
  ~/.local/share/plinkr/plink_2_0_unix \
  01_unzip_starter_zip.sh README.md 98_clean_rackham.sh

# Remove folders from zip's root
rm -rf plink_1_9_unix
rm -rf plink_2_0_unix

# Remove files for in the zip's root
rm 01_unzip_starter_zip.sh README.md 98_clean_rackham.sh

# Place the zip where it is expected to be
mv $zip_filename nsphs_ml_qt/$zip_filename

# Go back to original folder
cd nsphs_ml_qt

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done creating starter zip" "with filename $zip_filename"
fi

