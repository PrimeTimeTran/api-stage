# frozen_string_literal: true

module V1
  class UserConversationsController < ApplicationController
    def create
      conversation = Stage.find(params[:stageId]).conversations.first
      if current_user.user_conversations.create!(conversation: conversation)
        render json: { following: true }, status: :ok
      else
        render json: { following: false }, status: :unprocessable_entity
      end
    end

    def destroy
      conversation = current_user.stage_conversations.where(stage_id: params[:id])[0].id
      user_conversation = current_user.user_conversations.where(conversation_id: conversation)[0]
      if user_conversation.destroy
        render json: { following: false }, status: :ok
      else
        render json: { following: true }, status: :unprocessable_entity
      end
    end
  end
end