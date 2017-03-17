require 'rubygems'
require 'bundler/setup'
require 'chunky_png'

require 'opengl'
require 'glut'

include Gl
include Glut

class Renderer
  attr_accessor :width, :height, :background_color

  def initialize(width, height, background_red, background_green, background_blue)
    @width = width
    @height = height
    @background_color = {red: background_red, green: background_green, blue: background_blue}
    @buffer = Array.new(@width) { Array.new(@height)}
    reset
  end

  def reset
    @x_pos = 0
    @y_pos = 0
    @is_drawing = true
  end

  def calculate_pixel(i, j)
    {red: 0.0, green: 0.0, blue: 0.0}
  end

  def render(title, file_name)
    glutInit
    glutInitDisplayMode GLUT_RGB | GLUT_SINGLE
    glutInitWindowSize @width, @height
    glutInitWindowPosition 10, 10
    @window = glutCreateWindow title
    glutDisplayFunc :draw_scene
    glutReshapeFunc :reshape
    glutIdleFunc :idle
    @file_name = file_name
    init_gl
    at_exit do
      puts 'Saving file'
      save_image('raytracing.png')
    end
    glutMainLoop
  end

  protected
  def init_gl
    glClearColor @background_color[:red], @background_color[:green], @background_color[:blue], 0.0
  end

  def draw_scene
    glClear GL_COLOR_BUFFER_BIT
    glMatrixMode GL_PROJECTION
    glLoadIdentity
    glOrtho 0, @width, 0.0, @height, 1, -1
    glMatrixMode GL_MODELVIEW
    glLoadIdentity
    glBegin GL_POINTS
    (0...@width).each do |i|
      (0...@height).each do |j|
        if @buffer[i][j].nil?
          glColor3f @background_color[:red], @background_color[:green], @background_color[:blue]
        else
          glColor3f @buffer[i][j][:red], @buffer[i][j][:green], @buffer[i][j][:blue]
        end
        glVertex2i i, j
      end
    end
    glEnd
    glFlush
  end

  def reshape(width, height)
    @width = width
    @height = height
    @buffer = Array.new(@width) { Array.new(@height)}
    glViewport(0, 0,@width, @height)
    reset
  end

  def idle
    if @is_drawing
      @buffer[@x_pos][@y_pos] = calculate_pixel(@x_pos, @y_pos)
      @x_pos += 1

      if @x_pos >= @width
        @x_pos = 0
        @y_pos += 1
        glutPostRedisplay
      end

      if @y_pos >= @height
        @is_drawing = false
        glutPostRedisplay
      end
    end
  end

  def save_image(file_name)
    png = ChunkyPNG::Image.new(@width, @height, ChunkyPNG::Color::TRANSPARENT)
    (0...@width).each do |i|
      (0...@height).each do |j|
        if @buffer[i][j].nil?
          png[i, j] = ChunkyPNG::Color.rgb((@background_color[:red] * 255).to_i,
                                           (@background_color[:green] * 255).to_i,
                                           (@background_color[:blue] * 255).to_i)
        else
          png[i, j] = ChunkyPNG::Color.rgb((@buffer[i][j][:red] * 255).to_i,
                                           (@buffer[i][j][:green] * 255).to_i,
                                           (@buffer[i][j][:blue] * 255).to_i)
        end
      end
    end
    png.save(file_name, :interlace => true)
  end
end
