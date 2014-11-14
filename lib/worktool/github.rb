module Worktool
  class Github

    def extract(query)
      if query.match(/^https?:\/\//)
        return extract_url(query)
      end
      extract_hash(query)
    end

    def extract_url(url)
      matches = url.match(/^https?:\/\/github\.com\/([^\/]+)\/([^\/]+)\/(.*)/)
      return nil unless matches
      data = {
          :user => matches[1],
          :repo => matches[2]
      }
      suffix = matches[3]

      matches = suffix.match(/^(issues|pull)\/([0-9]+)/)
      data[:issue] = matches[2].to_i if matches
      data
    end

    def extract_hash(hash)
      matches = hash.match(/^(?:([^#\/]+)\/)?([^#\/]+)(?:#([0-9]+))?$/)
      return nil unless matches
      data = {
          :repo => matches[2],
      }
      data[:user] = matches[1] if matches[1]
      data[:issue] = matches[3].to_i if matches[3]
      data
    end

  end
end
