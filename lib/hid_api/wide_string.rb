require "ffi"
require 'ffi_wide_char'

module HidApi
  # An FFI data converter that marshalls data from specific device fields via
  # the WCHAR utility class
  class WideString
    extend FFI::DataConverter
    native_type FFI::Type::POINTER

    class << self
      def from_native(value, _context)
        return nil if value.null?
        FfiWideChar.read_wide_string value
      end

      def to_native(value, _ctx)
        FfiWideChar.to_wide_string value
      end
    end
  end
end
