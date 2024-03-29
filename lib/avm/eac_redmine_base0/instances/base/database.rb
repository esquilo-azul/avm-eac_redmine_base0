# frozen_string_literal: true

require 'avm/eac_rails_base1/instances/base'
require 'eac_ruby_utils/core_ext'

module Avm
  module EacRedmineBase0
    module Instances
      class Base < ::Avm::EacRailsBase1::Instances::Base
        module Database
          DATABASE_INTERNAL_HOSTNAME = ::Avm::Instances::Base::AutoValues::Database::LOCAL_ADDRESS
          DEFAULT_POSTGRESQL_VERSION = ''

          common_concern do
            uri_components_entries_values 'postgresql', %w[version]
          end

          def database_internal
            ::Avm::Instances::Base::AutoValues::Database::LOCAL_ADDRESSES
              .include?(entry(::Avm::Instances::EntryKeys::DATABASE_HOSTNAME).value)
          end

          def postgresql_version_default_value
            DEFAULT_POSTGRESQL_VERSION
          end
        end
      end
    end
  end
end
