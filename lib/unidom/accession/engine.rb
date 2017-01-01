module Unidom
  module Accession

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace Unidom::Accession

      enable_initializer enum_enabled: false, migration_enabled: true

    end

  end
end
