class CountersController < ApplicationController
  protect_from_forgery except: [:show]
  before_action :set_counter, only: %i[ show edit update destroy ]

  # GET /counters or /counters.json
  def index
    @counters = Counter.all
  end

  # GET /counters/1 or /counters/1.json
  def show
  end

  # GET /counters/new
  def new
    @counter = Counter.new
  end

  # GET /counters/1/edit
  def edit
  end

  # POST /counters or /counters.json
  def create
    @counter = Counter.new(counter_params)

    respond_to do |format|
      if @counter.save
        format.html { redirect_to counter_url(@counter), notice: "Counter was successfully created." }
        format.json { render :show, status: :created, location: @counter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @counter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counters/1 or /counters/1.json
  def update
    respond_to do |format|
      if @counter.update(counter_params)
        format.html { redirect_to counter_url(@counter), notice: "Counter was successfully updated." }
        format.json { render :show, status: :ok, location: @counter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @counter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counters/1 or /counters/1.json
  def destroy
    @counter.destroy

    respond_to do |format|
      format.html { redirect_to counters_url, notice: "Counter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counter
      @counter = Counter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def counter_params
      params.require(:counter).permit(:end_date, :text)
    end
end
