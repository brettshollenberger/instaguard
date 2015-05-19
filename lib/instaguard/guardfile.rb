class Instaguard
  class Guardfile
    def to_path
      path
    end

    def path
      "#{pwd}/#{name}"
    end

    private
    def pwd
      @pwd ||= `pwd`.chomp
    end

    def name
      "Guardfile"
    end
  end
end
