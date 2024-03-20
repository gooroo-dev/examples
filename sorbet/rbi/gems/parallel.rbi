# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/parallel/all/parallel.rbi
#
# parallel-1.24.0

module Parallel
end
class Parallel::DeadWorker < StandardError
end
class Parallel::Break < StandardError
end
class Parallel::Kill < Parallel::Break
end
class Parallel::UndumpableException < StandardError
end
class Parallel::ExceptionWrapper
end
class Parallel::Worker
end
class Parallel::JobFactory
end
class Parallel::UserInterruptHandler
end
