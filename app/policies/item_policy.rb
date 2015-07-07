class ItemPolicy

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role == 'admin'
        scope.all
      elsif @user.present?
        scope.where(user_id: @user.id)
      else
        scope = []
      end
    end
  end

end