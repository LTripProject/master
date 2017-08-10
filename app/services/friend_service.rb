class FriendService
  def initialize(current_user, target_id)
    @current_user = current_user
    @target_id = target_id
  end

  def create
    @current_user.relations.create(tartget_id: @target_id)
    @notification = Notification.create(name: "LTRIP: Friend Request", description: "Be Friend Tourist?.", category: "request")
    UserNotification.create(sender_id: @current_user.id, user_id: @target_id, notification_id: @notification.id)
  end

  def confirm
    if find_sender_relation(@target_id, @current_user.id).blank?
      @current_user.relations.create(tartget_id: @target_id, status: 'accepted')
    else
      find_sender_relation(@target_id, @current_user.id).update_attributes(status: 'accepted')
    end
    find_sender_relation(@current_user.id, @target_id).update_attributes(status: 'accepted')
    update_notification(@target_id, @current_user.id)
  end

  def reject
    puts @current_user.id
    puts @target_id
    find_sender_relation(@current_user.id, @target_id).destroy
    UserNotification.where(sender_id: @target_id, user_id: @current_user.id).first.notification.destroy
  end

  private
  def find_sender_relation(receiver_id, sender_id)
    Relation.where(tartget_id: receiver_id, user_id: sender_id).first
  end

  def update_notification(target_id, current_user_id)
    UserNotification.where(sender_id: tartget_id, user_id: current_user_id).first.notification.update_attributes(description: "Has become your friend", category: "news")
  end
end
