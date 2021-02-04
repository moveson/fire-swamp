# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: [:update, :edit, :destroy, :show]
  before_action :authorize_message, except: [:create]

  def create
    @message = ::Message.new(message_params)
    @message.author = current_user

    if @message.save
      render turbo_stream: turbo_stream.append(:messages, @message)
    else
      render "new", layout: false, status: :unprocessable_entity
    end
  end

  def update
    if @message.update(message_params)
      render @message
    else
      render "edit", layout: false, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @message.destroy
  end

  def show
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def authorize_message
    authorize @message
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
