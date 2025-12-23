#!/bin/env fish
for file in *
    set out (basename -s .png -- $file)
    cwebp -lossless "$file" -o "$out.webp"
end
