#!/bin/sh

# Defaults
WORKING_DIR=/

if [ -n "$1" ]
# Test whether command-line argument is present (non-empty).
then
  working_dir=$1
else
  working_dir=$WORKING_DIR # Default, if not specified on command-line.
fi

cd $working_dir

echo Checking $working_dir...

# Get list of newest files. If newest files are first, use head -n 14
# instead of head.
files=(`ls * | sort -r `)

# Loop through all tar files in this folder
for a in ${files[@]}; do
echo $a
 if ! tar xOf $a &> /dev/null; then
   echo "Bad tar file....."$a
 fi;
done

echo Checking $working_dir... completed!

