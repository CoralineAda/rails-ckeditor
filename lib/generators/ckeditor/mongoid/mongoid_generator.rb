require 'rails/generators'

module Ckeditor
  class MongoidGenerator < Rails::Generators::Base
    
    desc "Generates Mongoid source files for Asset (Picture, AttachmentFile) models"
    
    class_option :backend, :type => :string, :default => 'paperclip',
                           :desc => "Backend processor for upload support"
                          
    def self.source_root
      @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates', 'models/'))
    end

    def create_models
      template "paperclip/asset.rb",
               File.join('app/models', ckeditor_dir, "asset.rb")
      
      template "paperclip/picture.rb",
               File.join('app/models', ckeditor_dir, "picture.rb")
      
      template "paperclip/attachment_file.rb",
               File.join('app/models', ckeditor_dir, "attachment_file.rb")
    end
    
    protected
      
      def ckeditor_dir
        'ckeditor'
      end
      
  end
end
