module Image
  class BaseService

    # size can be: :desktop / :mobile / :big_screen
    def self.avatar(url: required, size: required)
      size_value = set_screen_size size

      MiniMagick::Tool::Convert.new do |convert|
        convert << url
        convert.merge! ['-thumbnail', "#{size_value}^", '-gravity', 'center', '-extent', size_value]
        convert << "output_#{size}.jpg"
      end
    end

    private

    def self.set_screen_size(size)
      case size
        when :desktop
          '140x140'
        when :mobile
          '60x60'
        when :big_screen
          '250x250'
        else
          '100x100'
      end
    end
  end
end
