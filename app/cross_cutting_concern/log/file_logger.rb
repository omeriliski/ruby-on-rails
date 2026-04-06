 module Log
    module FileLogger
        require 'json'
        def log_file
            logger = Logger.new(Rails.root.join("log", "log_#{controller_name}.log"))
            log = {
                parameters: params,
                current_user: current_user,
                datetime: DateTime.now,
                method: action_name,
                controller: controller_name,
                remote_ip: request.remote_ip,
                request: request.original_url,
                request_fullpath: request.fullpath,
            }
            logger.info(log.to_json)
        end

        def log_error_to_file(exception)
            logger = Logger.new(Rails.root.join("log", "log_error_#{controller_name}.log"))
            log = {
                parameters: params,
                current_user: current_user,
                datetime: DateTime.now,
                method: action_name,
                controller: controller_name,
                remote_ip: request.remote_ip,
                request: request.original_url,
                request_fullpath: request.fullpath,
                error_message: exception.message,
                exception_details: exception.backtrace.join("\n")
            }
            logger.error(log.to_json)
        end
    end
end