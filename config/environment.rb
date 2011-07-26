#encoding: utf-8

require File.expand_path('../application', __FILE__)

Books::Application.initialize!


require 'will_paginate'
WillPaginate::ViewHelpers.pagination_options[:previous_label] = '&lt;&lt; 上一页'
WillPaginate::ViewHelpers.pagination_options[:next_label] = '下一页 &gt;&gt;'