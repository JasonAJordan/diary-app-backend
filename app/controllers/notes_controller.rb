class NotesController < ApplicationController
    def index 
        notes = Note.all 
        render json: notes, except:[:updated_at, :created_at]
    end 


    def show 
        note = Note.find_by(id: params[:id])
        render json: note
    end 
    

    def new 
        note = Note.new
    end 

    def create 
        # note = Note.create(note_params)
        # render json: note, except:[:updated_at, :created_at]

        if params[:image].instance_of?(String) || params[:image].nil?
            note = Note.create(note_params)
            render json: note, except:[:updated_at, :created_at]
        else 
        imageUploaded = Cloudinary::Uploader.upload(params[:image])
        #puts "asdfasdfasdfasdf"
        note_params_new = note_params
        note_params_new[:image] = imageUploaded["url"]
        note = Note.create(note_params_new)
        render json: note, except:[:updated_at, :created_at]
        end
    end 

    def edit 
        note = Note.find_by(id: params[:id])
    end 

    def update
        note = Note.find_by(id: params[:id])
        note.update(note_params)
        render json: note
    end 
    
    def destroy 
        note = Note.find_by(id: params[:id])
        note.destroy
        render json: note 
    end 

    private 

    def note_params 
        params.permit(:title, :context, :text_color, :user_id, :image)
    end 
end
