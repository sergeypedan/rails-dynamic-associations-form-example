class SurveysController < ApplicationController
	before_action :set_survey, only: [:show, :edit, :update, :destroy]

	def index
		@surveys = Survey.all
	end

	def show
	end

	def new
		@survey = Survey.new

		question = @survey.questions.build
		question.answers.build

		# 3.times do
		# 	question = @survey.questions.build
		# 	4.times { question.answers.build }
		# end

		render :edit
	end

	def edit
	end

	def create
		@survey = Survey.new(survey_params)
		if @survey.save
			redirect_to @survey, notice: 'created'
		else
			render :new
		end
	end

	def update
		if @survey.update(survey_params)
			redirect_to @survey, notice: 'updated'
		else
			render :edit
		end
	end

	def destroy
		@survey.destroy
		redirect_to surveys_url, notice: 'destroyed'
	end

	private

	def set_survey
		@survey = Survey.find(params[:id])
	end

	def survey_params
		params.require(:survey).permit(
			:name,
			questions_attributes: [
				:id,
				:content,
				:_destroy,
				answers_attributes: [:id, :content, :_destroy]
			]
		)
	end
end
