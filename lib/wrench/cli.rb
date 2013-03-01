module Wrench

  class CLI < Thor

    def initialize(*args)

      super
      @config = YAML.load_file( File.join( File.dirname(__FILE__),
        "../../conf/config.yaml" ) )

    end

    desc( "create NAME", "create project skeleton" )
    def create(name)

      create_directories(name)
      create_files(name)

    end

    desc( "download ASSET", "download asset" )
    def download(asset)
    end

    desc( "list", "list all assets" )
    def list

      @config[ASSETS].each do |a|
        puts "  * #{a[NAME]}"
      end

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

    end

  end

end

