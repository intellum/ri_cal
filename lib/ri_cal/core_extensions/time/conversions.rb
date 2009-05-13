module RiCal
  module CoreExtensions #:nodoc:
    module Time #:nodoc:
      #- ©2009 Rick DeNatale
      #- All rights reserved. Refer to the file README.txt for the license
      #
      module Conversions
        # Return an RiCal::PropertyValue::DateTime representing the receiver
        def to_ri_cal_date_time_value(timezone_finder = nil)
          RiCal::PropertyValue::DateTime.new(
               timezone_finder, 
               :value => strftime("%Y%m%dT%H%M%S"), 
               :params => {"TZID" => self.tzid || :default})
        end

        alias_method :to_ri_cal_date_or_date_time_value, :to_ri_cal_date_time_value
        alias_method :to_ri_cal_occurrence_list_value, :to_ri_cal_date_time_value

        # Return the natural ri_cal_property for this object
        def to_ri_cal_property_value(timezone_finder = nil)
          to_ri_cal_date_time_value(timezone_finder)
        end
        
        # Return a copy of this object which will be interpreted as a floating time.
        def with_floating_timezone
          dup.set_tzid(:floating)
        end
      end
    end
  end
end