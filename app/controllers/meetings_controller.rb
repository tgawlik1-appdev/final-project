class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all

    render("meeting_templates/index.html.erb")
  end

  def show
    @meeting = Meeting.find(params.fetch("id_to_display"))

    render("meeting_templates/show.html.erb")
  end

  def new_form
    render("meeting_templates/new_form.html.erb")
  end

  def create_row
    @meeting = Meeting.new

    @meeting.first_participant = params.fetch("first_participant")
    @meeting.second_participant = params.fetch("second_participant")

    if @meeting.valid?
      @meeting.save

      redirect_to("/meetings", :notice => "Meeting created successfully.")
    else
      render("meeting_templates/new_form.html.erb")
    end
  end

  def edit_form
    @meeting = Meeting.find(params.fetch("prefill_with_id"))

    render("meeting_templates/edit_form.html.erb")
  end

  def update_row
    @meeting = Meeting.find(params.fetch("id_to_modify"))

    @meeting.first_participant = params.fetch("first_participant")
    @meeting.second_participant = params.fetch("second_participant")

    if @meeting.valid?
      @meeting.save

      redirect_to("/meetings/#{@meeting.id}", :notice => "Meeting updated successfully.")
    else
      render("meeting_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @meeting = Meeting.find(params.fetch("id_to_remove"))

    @meeting.destroy

    redirect_to("/meetings", :notice => "Meeting deleted successfully.")
  end
end
