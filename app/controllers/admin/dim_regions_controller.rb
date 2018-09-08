module Admin
  class DimRegionsController < Admin::ApplicationController
    before_action :set_local, :only => [:import, :do_import]

		def import
		  render locals: {
				page: @page,
				resources: @resources
			}
		end

		private
		def set_local
			resource_includes = dashboard.association_includes
			@model_name = 'dim_region'
			@page = Administrate::Page::Collection.new(dashboard, order: order)
			@resources = scoped_resource.includes(*resource_includes) if resource_includes.any?
		end
  end
end
