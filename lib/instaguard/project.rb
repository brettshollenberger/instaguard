class Instaguard
  class Project
    def guard(argv=ARGV)
      "bundle exec guard #{guard_args} #{argv.join(" ")}"
    end

    def guardfile
      guardfile_prefs.detect do |guardfile|
        File.exists?(guardfile)
      end
    end

    def guardfile_prefs
      [personal_guardfile, default_guardfile]
    end

  private
    def guard_args
      guardfile.nil? ? "" : "-G #{guardfile.to_path}"
    end

    def personal_guardfile
      @personal_guardfile ||= PersonalGuardfile.new
    end

    def default_guardfile
      @default_guardfile ||= Guardfile.new
    end
  end
end
