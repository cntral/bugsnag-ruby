class ApplicationController < ActionController::Base
  def crash
    raise 'Bugsnag Rails demo says: It crashed! ' \
      'Go check bugsnag.com for a new notification'
  end

  def notify
    Bugsnag.notify(RuntimeError.new("Bugsnag Rails demo says: False alarm, your application didn't crash"))
  end

  def data
    error = RuntimeError.new("Bugsnag Rails demo says: False alarm, your application didn't crash")

    Bugsnag.notify(error) do |report|
      report.add_tab(:diagnostics, {
        message: 'Rails demo says: Everything is great',
        code: 200
      })
    end
  end

  def severity
    error = RuntimeError.new(
      "Bugsnag Rails demo says: Look at the circle on the right side — it's different!"
    )

    Bugsnag.notify(error) do |report|
      report.severity = 'info'
    end
  end
end
