module Mudhead

	module ApplicationHelper

		def class_frm_resource(resource_name)
      resource_name.to_s.classify.constantize
    end

		def resource_indx_route_key(resource_name)
      ActiveModel::Naming.route_key(class_frm_resource(resource_name))
    end

	end

end
