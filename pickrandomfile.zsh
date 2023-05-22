#!/usr/bin/env zsh

# Get the starting directory from the first command-line argument
starting_dir="$1"

# Get a list of all files under the starting directory
files=$(find "$starting_dir" -type f -iname "*.png")

# Count the number of files
num_files=$(echo "$files" | wc -l | xargs)

# Choose two random file indices
index1=$(( RANDOM % num_files ))
index2=$(( RANDOM % num_files ))

# Make sure the two indices are different
while [ $index1 -eq $index2 ]
do
    index2=$(( RANDOM % num_files ))
done

# Get the filenames corresponding to the chosen indices
file1=$(echo "$files" | sed "${index1}q;d")
file2=$(echo "$files" | sed "${index2}q;d")

# echo "Selected files:"
# echo "$file1"
# echo "$file2"

./img2nn $file1 $file2
