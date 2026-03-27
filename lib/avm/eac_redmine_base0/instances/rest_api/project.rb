# frozen_string_literal: true

module Avm
  module EacRedmineBase0
    module Instances
      class RestApi < ::EacRest::Api
        class Project < ::Avm::EacRedmineBase0::Instances::RestApi::EntityBase
          # @return [String]
          def prefix
            "/projects/#{id}"
          end

          # @return [Avm::EacRedmineBase0::Instances::RestApi::WikiPage]
          def wiki_page(name)
            child_entity(::Avm::EacRedmineBase0::Instances::RestApi::WikiPage, name)
          end

          # @return []
          def wiki_pages
            ::Avm::EacRedmineBase0::Instances::RestApi::WikiPage.then do |wiki_class|
              child_list(wiki_class, '/wiki/index') do |body_data|
                body_data.fetch('wiki_pages').map { |e| { wiki_class.const_get(:DATA_ROOT) => e } }
              end
            end
          end
        end
      end
    end
  end
end
