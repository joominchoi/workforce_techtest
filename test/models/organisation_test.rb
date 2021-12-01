require 'test_helper'

class OrganisationTest < ActiveSupport::TestCase

    test 'valid_organisation' do
        organisation = Organisation.create(name: "SingSing Bar", hourly_rate: 10)
        assert !organisation.errors.any?, organisation.errors.full_messages
    end

    test 'no_name' do
        organisation = Organisation.create(name: "", hourly_rate: 10)
        assert organisation.errors.any?, "created organisation with no name"
    end

    test 'no_hourly_rate' do
        organisation = Organisation.create(name: "SingSing Bar", hourly_rate: nil)
        assert organisation.errors.any?, "Created organisation with an empty name"
    end
    
end
