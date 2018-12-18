require 'zip'

class AnimalsController < ApplicationController
  def index
    @animals = Animal.order('created_at DESC')

    respond_to do |format|
      format.html
      format.zip do
        compressed_filestream = Zip::OutputStream.write_buffer(::StringIO.new(''), Zip::TraditionalEncrypter.new('password')) do |zos|
          @animals.each do |animal|
            zos.put_next_entry "#{animal.name}-#{animal.id}.json"
            zos.print animal.to_json(only: [:name, :age, :species])
          end
        end
        compressed_filestream.rewind
        send_data compressed_filestream.read, filename: "animals.zip"
      end
    end
  end

  def new

  end

  def create
    if params[:archive].present?
      Zip::File.open(params[:archive].tempfile) do |zip_file|
        zip_file.glob('*.json').each { |entry| Animal.from_json(entry) }
      end
    end
    redirect_to root_path
  end
end