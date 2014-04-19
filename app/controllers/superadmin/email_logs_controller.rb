class Superadmin::EmailLogsController < Superadmin::BaseController

  respond_to :html, :json

  def index
    @email_logs = EmailLog.order(created_at: :desc)
    respond_with @email_logs
  end

  def show
    @email_log = EmailLog.find(params[:id])
    respond_with @email_log
  end
end
