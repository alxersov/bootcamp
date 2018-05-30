require "test/unit"
require_relative "ip_address"

class IpAddressTests < Test::Unit::TestCase
    def test_valid_ip_addresses
        assert_equal(true, IpAddress.new("0.0.0.0").valid?)
        assert_equal(true, IpAddress.new("1.1.1.1").valid?)
        assert_equal(true, IpAddress.new("1.212.123.1").valid?)
        assert_equal(true, IpAddress.new("1.12.0.101").valid?)
        assert_equal(true, IpAddress.new("200.100.0.10").valid?)
        assert_equal(true, IpAddress.new("255.255.255.255").valid?)
    end

    def test_invalid_ip_addresses
        assert_equal(false, IpAddress.new("hello").valid?)
        assert_equal(false, IpAddress.new(" 1.0.0.1").valid?)
        assert_equal(false, IpAddress.new("1.0.0.1\n").valid?)
        assert_equal(false, IpAddress.new("1.0.0..1").valid?)
        assert_equal(false, IpAddress.new("1.0.0.01").valid?)
        assert_equal(false, IpAddress.new("1.0.0x3.1").valid?)
        assert_equal(false, IpAddress.new("257.1.1.1").valid?)
        assert_equal(false, IpAddress.new("192.168.1").valid?)
        assert_equal(false, IpAddress.new("10.0.0.0.1").valid?)
    end
end