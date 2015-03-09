module ResponseHelper
  
  module RESPONSE_CODE 
    UNKNOWN = {code: 100, msg: 'UNKNOWN'}
    PARAMS_ILLEGAL = {code: 101, msg: 'PARAMS_ILLEGAL'}
    PWD_ILLEGAL = {code: 102, msg: 'PWD_ILLEGAL'}
    LOGIN_ERROR = {code: 103, msg: 'LOGIN_ERROR'}
    RECORD_NOT_FOUND = {code: 104, msg: 'RECORD_NOT_FOUND'}
    AUTH_ERROR = {code: 105, msg: 'AUTH_ERROR'}
    AUTH_EXPIRED_ERROR = {code: 106, msg: 'AUTH_EXPIRED_ERROR'}
  end

end