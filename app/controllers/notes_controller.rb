class NotesController < ProtectedController
  before_action :set_note, only: %i[show]

  # GET /notes
  def index
    # @notes = Note.all
    @notes = current_user.notess.all
    # only an authenticated user should be able to see notes.
    render json: @notes
  end

  # GET /notes/1
  def show
    @note = current_user.note
    render json: @note
  end

  # POST /notes
  def create
    # @note = Note.new(note_params)
    @note = current_user.notes.build(notes_params)
    # only an authenticated user should be able to create a new note within
    # their account.

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    @note = current_user.notes.find(params[:id])
    # only the signed in and current_user is able to update a book
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note = current_user.notes.find(params[:id])
    # only the signed in and current_user is able to delete a note
    @note.destroy
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:note, :page_number, :paragraph_number, :user_id, :book_id)
    end
end
