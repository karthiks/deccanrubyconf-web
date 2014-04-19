class CatchJsonParseErrors

  def initialize app
    @app = app
  end

  def call env

    begin
      @app.call(env)
    rescue ActionDispatch::ParamsParser::ParseError => error
      if content_type_is_json? env
        error_message = "Payload data is not valid JSON. Error message: #{error}"

        return [ 400, { "Content-Type" => "application/json" }, [ { error: error_message }.to_json ] ]
      else
        raise error
      end
    end
  end

  private

  def content_type_is_json? env
    env['CONTENT_TYPE'] =~ /application\/json/
  end

end
