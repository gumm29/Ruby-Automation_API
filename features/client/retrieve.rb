module Retrieve
  class RetrieveProducts
    include HTTParty

    def retrieve_all
      self.class.get("#{CONFIG['url']}/produtos", prepare_payload)
    end
  end
end