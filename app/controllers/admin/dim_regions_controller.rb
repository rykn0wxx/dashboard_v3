module Admin
  class DimRegionsController < Admin::ApplicationController
		before_action :set_local, :only => [:import, :do_import]

    def import
			render locals: {
        adm_imp: @adm_imp,
        page: @page,
        resources: @resources
      }
    end

		private

		def set_local
		  @adm_imp = AdminImport.new
			@adm_imp.objname = 'dim_region'
			@page = Administrate::Page::Form.new(dashboard, resource_class.new)
			@resources = scoped_resource.includes(*dashboard.association_includes) if dashboard.association_includes.any?
		end
  end
end
