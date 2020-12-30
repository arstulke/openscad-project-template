#renders each file in src/views

mkdir -p output

FILES=src/views/*
for src_file in $FILES
do
  out_file="output/$(basename -s scad $src_file)stl"
  echo "src_file ${src_file}"
  echo "out_file ${out_file}"
  echo ""
  openscad -D "config_render=true;" ${src_file} -o ${out_file}
done
