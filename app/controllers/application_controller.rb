class ApplicationController < ActionController::Base
    def authorized_request(kind = nil)
        unless kind.incluye?(current_user.role)
            redirect_to publications_path, notice: "No tienes permiso de administrador."
        end
    end
end
