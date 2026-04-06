module Cache
  module RedisCache
    def read_cache
      @entity = Rails.cache.read("#{controller_name}, #{action_name}")

      if !@entity.blank?
        @is_cached = true
        Rails.logger.info("Cache hit for controller_name=#{controller_name}, action_name=#{action_name}")
        render template: "api/#{controller_name}/#{action_name}", formats: [:json], status: :ok
      else
        @is_cached = false
      end
    end

    def remove_cache(actions = "index, show")
      actions.split(",").each do |action|
        Rails.cache.delete("#{controller_name}, #{action.strip}")
      end
    end

    def write_cache(entity)
      Rails.cache.write("#{controller_name}, #{action_name}", entity, expires_in: 60.minutes)
    end
  end
end