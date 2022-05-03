$scr_w = `tput cols`.to_i
$scr_h = `tput lines`.to_i

$x = 1
$y = 5

$width = 5
$height = 5

def render_frame
  output  = Array.new($scr_h) {Array.new($scr_w) {"o"}}
  zbuffer = Array.new($scr_h) {Array.new($scr_w) {0}}
  
  lum_val = ".,-~:;=!*#$@"

  val = 0

  zbuffer.each_index do |i|
    sub = zbuffer[i]
    sub.each_index do |x|
      sub[x] = val
      val += 0.1
    end
  end


  str_h = $x
  end_h = $x + $width - 1

  str_w = $y
  end_w = $y + $height - 1


  #for i in 0 .. output.length
   # output[i][i] = "x"

  output.each_index do |i|
    sub = output[i]
    sub.each_index do |x|
      for height in str_h..end_h
        for width in str_w..end_w
          if zbuffer[height][width] < 5
            output[height][width] = lum_val[0]
          elsif zbuffer[height][width] > 5 and zbuffer[height][width] < 10
            output[height][width] = lum_val[1]
          elsif zbuffer[height][width] >= 10
            output[height][width] = lum_val[2]
          end
        end
      end
    end
  end

  square = [$x, $y, $width, $height]


  #render to terminal
  puts output.map {|x| x.join("")}


  #input handling
  input = nil
  input = gets.chomp
  #if y + width > $scr_w or y 

  #elsif x +

  #end
  if input == "w"
    $x -= 1
  elsif input == "a"
    $y -= 1
  elsif input == "s"
    $x += 1
  elsif input == "d"
    $y += 1
  end
end

#render loop
loop do 
render_frame()
end
