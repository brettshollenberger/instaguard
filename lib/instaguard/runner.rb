require 'pty'

class Instaguard
  class Runner
    attr_accessor :argv

    def initialize(argv=ARGV)
      @argv = argv
    end

    def project
      @project ||= Project.new
    end

    def guard_cmd
      project.guard(argv)
    end

    def run
      puts guard_cmd

      PTY.spawn(guard_cmd) do |stdout, stdin, pid|
        begin
          stdout.each { |line| print line }
        rescue Errno::EIO
          puts "Errno:EIO error, but this probably just means " +
            "that the process has finished giving output"
        end
      end
    end
  end
end
