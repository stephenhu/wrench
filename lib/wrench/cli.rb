module Wrench

  class CLI < Thor

    def initialize(*args)

      super
      @config = YAML.load_file( File.join( File.dirname(__FILE__),
        "../../conf/config.yaml" ) )

    end

    desc( "up NAME", "create project skeleton" )
    def up(name)

      create_directories(name)
      create_files(name)

    end

    desc( "down ASSET", "download asset" )
    def down(asset)

      sel = @config[ASSETS].find {|a| a["name"] == asset }

      download(sel["url"]) unless sel.nil?

    end

    desc( "list", "list all assets" )
    def list

      @config[ASSETS].each do |a|
        puts "  + #{a[NAME]}"
      end

    end

    desc( "test", "test" )
    def test

      resource_ext("https://raw.github.com/douglascrockford/JSON-js/master/json2.js")

    end

    no_tasks do

      def create_directories(name)

        @config[DIRECTORIES].each do |d|

          dir = d

          if d.include?("@")
            dir = d.sub( "@", "#{name}" ) 
          end

          unless File.directory?("#{name}/#{dir}")

            FileUtils.mkdir_p("#{name}/#{dir}")
            puts "  created directory #{name}/#{dir}".green

          end

        end

      end

      def create_files(name)

        module_name  = name.slice(0,1).capitalize + name.slice(1..-1)

        @config[FILES].each do |f|

          e = ERB.new( File.read( File.join( File.dirname(__FILE__),
            TEMPLATES, f[TEMPLATE] ) ) )

          spec = "#{name}/"

          unless f[DESTINATION].include?(".")
            spec = spec + f[DESTINATION].sub( "@", name ) + "/"
          end

          filename = f[TEMPLATE].sub( ".erb", "" )

          if filename == MAINRB
            filename = "#{name}.rb"
          end

          puts "  created file #{spec + filename}".green

          n = File.open( spec + filename, "w" )
          n.write(e.result(binding))
          n.close

        end

      end

      def download(url)

        ext = resource_ext(url)

        if ext == ".zip"
          download_binary(url)
        elsif ext == ".js"
          download_ascii(url)
        else
          puts "Unsupported resource type".red
        end

      end

      def download_ascii(url)

        ascii = open(url)

        filename = File.basename(url)

        unless File.exists?("./#{filename}")

          f = File.open( filename, "w" )
          f.write(ascii.read)
          f.close

        end

      end

      def download_binary(url)

        bin = open(url)

        Zip::ZipFile.open(bin.path) do |z|

          z.each do |f|

            path = File.join( ".", f.name )
            FileUtils.mkdir_p(File.dirname(path))
            z.extract( f, path ) unless File.exist?(path)

          end

        end

      end

      def resource_ext(url)

        return File.extname(url)

      end

    end

  end

end

