# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `diff-lcs` gem.
# Please instead update this file by running `bin/tapioca gem diff-lcs`.

# source://diff-lcs//lib/diff/lcs.rb#3
module Diff; end

# == How Diff Works (by Mark-Jason Dominus)
#
# I once read an article written by the authors of +diff+; they said that they
# hard worked very hard on the algorithm until they found the right one.
#
# I think what they ended up using (and I hope someone will correct me, because
# I am not very confident about this) was the `longest common subsequence'
# method. In the LCS problem, you have two sequences of items:
#
#    a b c d f g h j q z
#    a b c d e f g i j k r x y z
#
# and you want to find the longest sequence of items that is present in both
# original sequences in the same order. That is, you want to find a new
# sequence *S* which can be obtained from the first sequence by deleting some
# items, and from the second sequence by deleting other items. You also want
# *S* to be as long as possible. In this case *S* is:
#
#    a b c d f g j z
#
# From there it's only a small step to get diff-like output:
#
#    e   h i   k   q r x y
#    +   - +   +   - + + +
#
# This module solves the LCS problem. It also includes a canned function to
# generate +diff+-like output.
#
# It might seem from the example above that the LCS of two sequences is always
# pretty obvious, but that's not always the case, especially when the two
# sequences have many repeated elements. For example, consider
#
#    a x b y c z p d q
#    a b c a x b y c z
#
# A naive approach might start by matching up the +a+ and +b+ that appear at
# the beginning of each sequence, like this:
#
#    a x b y c         z p d q
#    a   b   c a b y c z
#
# This finds the common subsequence +a b c z+. But actually, the LCS is +a x b
# y c z+:
#
#          a x b y c z p d q
#    a b c a x b y c z
#
# source://diff-lcs//lib/diff/lcs.rb#51
module Diff::LCS
  # Returns the difference set between +self+ and +other+. See Diff::LCS#diff.
  #
  # source://diff-lcs//lib/diff/lcs.rb#75
  def diff(other, callbacks = T.unsafe(nil), &block); end

  # Returns an Array containing the longest common subsequence(s) between
  # +self+ and +other+. See Diff::LCS#lcs.
  #
  #   lcs = seq1.lcs(seq2)
  #
  # A note when using objects: Diff::LCS only works properly when each object
  # can be used as a key in a Hash, which typically means that the objects must
  # implement Object#eql? in a way that two identical values compare
  # identically for key purposes. That is:
  #
  #   O.new('a').eql?(O.new('a')) == true
  #
  # source://diff-lcs//lib/diff/lcs.rb#70
  def lcs(other, &block); end

  # Attempts to patch +self+ with the provided +patchset+. A new sequence based
  # on +self+ and the +patchset+ will be created. See Diff::LCS#patch. Attempts
  # to autodiscover the direction of the patch.
  #
  # source://diff-lcs//lib/diff/lcs.rb#101
  def patch(patchset); end

  # Attempts to patch +self+ with the provided +patchset+. A new sequence based
  # on +self+ and the +patchset+ will be created. See Diff::LCS#patch. Does no
  # patch direction autodiscovery.
  #
  # source://diff-lcs//lib/diff/lcs.rb#109
  def patch!(patchset); end

  # Attempts to patch +self+ with the provided +patchset+, using #patch!. If
  # the sequence this is used on supports #replace, the value of +self+ will be
  # replaced. See Diff::LCS#patch. Does no patch direction autodiscovery.
  #
  # source://diff-lcs//lib/diff/lcs.rb#123
  def patch_me(patchset); end

  # Returns the balanced ("side-by-side") difference set between +self+ and
  # +other+. See Diff::LCS#sdiff.
  #
  # source://diff-lcs//lib/diff/lcs.rb#81
  def sdiff(other, callbacks = T.unsafe(nil), &block); end

  # Traverses the discovered longest common subsequences between +self+ and
  # +other+ using the alternate, balanced algorithm. See
  # Diff::LCS#traverse_balanced.
  #
  # source://diff-lcs//lib/diff/lcs.rb#94
  def traverse_balanced(other, callbacks = T.unsafe(nil), &block); end

  # Traverses the discovered longest common subsequences between +self+ and
  # +other+. See Diff::LCS#traverse_sequences.
  #
  # source://diff-lcs//lib/diff/lcs.rb#87
  def traverse_sequences(other, callbacks = T.unsafe(nil), &block); end

  # Attempts to patch +self+ with the provided +patchset+. A new sequence based
  # on +self+ and the +patchset+ will be created. See Diff::LCS#patch. Attempts
  # to autodiscover the direction of the patch.
  #
  # source://diff-lcs//lib/diff/lcs.rb#101
  def unpatch(patchset); end

  # Attempts to unpatch +self+ with the provided +patchset+. A new sequence
  # based on +self+ and the +patchset+ will be created. See Diff::LCS#unpatch.
  # Does no patch direction autodiscovery.
  #
  # source://diff-lcs//lib/diff/lcs.rb#116
  def unpatch!(patchset); end

  # Attempts to unpatch +self+ with the provided +patchset+, using #unpatch!.
  # If the sequence this is used on supports #replace, the value of +self+ will
  # be replaced. See Diff::LCS#unpatch. Does no patch direction autodiscovery.
  #
  # source://diff-lcs//lib/diff/lcs.rb#134
  def unpatch_me(patchset); end

  class << self
    # :yields: seq1[i] for each matched
    #
    # source://diff-lcs//lib/diff/lcs.rb#144
    def LCS(seq1, seq2, &block); end

    # source://diff-lcs//lib/diff/lcs/callbacks.rb#52
    def callbacks_for(callbacks); end

    # #diff computes the smallest set of additions and deletions necessary to
    # turn the first sequence into the second, and returns a description of these
    # changes.
    #
    # See Diff::LCS::DiffCallbacks for the default behaviour. An alternate
    # behaviour may be implemented with Diff::LCS::ContextDiffCallbacks. If a
    # Class argument is provided for +callbacks+, #diff will attempt to
    # initialise it. If the +callbacks+ object (possibly initialised) responds to
    # #finish, it will be called.
    #
    # source://diff-lcs//lib/diff/lcs.rb#168
    def diff(seq1, seq2, callbacks = T.unsafe(nil), &block); end

    # :yields: seq1[i] for each matched
    #
    # source://diff-lcs//lib/diff/lcs.rb#144
    def lcs(seq1, seq2, &block); end

    # Applies a +patchset+ to the sequence +src+ according to the +direction+
    # (<tt>:patch</tt> or <tt>:unpatch</tt>), producing a new sequence.
    #
    # If the +direction+ is not specified, Diff::LCS::patch will attempt to
    # discover the direction of the +patchset+.
    #
    # A +patchset+ can be considered to apply forward (<tt>:patch</tt>) if the
    # following expression is true:
    #
    #     patch(s1, diff(s1, s2)) -> s2
    #
    # A +patchset+ can be considered to apply backward (<tt>:unpatch</tt>) if the
    # following expression is true:
    #
    #     patch(s2, diff(s1, s2)) -> s1
    #
    # If the +patchset+ contains no changes, the +src+ value will be returned as
    # either <tt>src.dup</tt> or +src+. A +patchset+ can be deemed as having no
    # changes if the following predicate returns true:
    #
    #     patchset.empty? or
    #       patchset.flatten(1).all? { |change| change.unchanged? }
    #
    # === Patchsets
    #
    # A +patchset+ is always an enumerable sequence of changes, hunks of changes,
    # or a mix of the two. A hunk of changes is an enumerable sequence of
    # changes:
    #
    #     [ # patchset
    #       # change
    #       [ # hunk
    #         # change
    #       ]
    #     ]
    #
    # The +patch+ method accepts <tt>patchset</tt>s that are enumerable sequences
    # containing either Diff::LCS::Change objects (or a subclass) or the array
    # representations of those objects. Prior to application, array
    # representations of Diff::LCS::Change objects will be reified.
    #
    # source://diff-lcs//lib/diff/lcs.rb#626
    def patch(src, patchset, direction = T.unsafe(nil)); end

    # Given a set of patchset, convert the current version to the next version.
    # Does no auto-discovery.
    #
    # source://diff-lcs//lib/diff/lcs.rb#736
    def patch!(src, patchset); end

    # #sdiff computes all necessary components to show two sequences and their
    # minimized differences side by side, just like the Unix utility
    # <em>sdiff</em> does:
    #
    #     old        <     -
    #     same             same
    #     before     |     after
    #     -          >     new
    #
    # See Diff::LCS::SDiffCallbacks for the default behaviour. An alternate
    # behaviour may be implemented with Diff::LCS::ContextDiffCallbacks. If a
    # Class argument is provided for +callbacks+, #diff will attempt to
    # initialise it. If the +callbacks+ object (possibly initialised) responds to
    # #finish, it will be called.
    #
    # Each element of a returned array is a Diff::LCS::ContextChange object,
    # which can be implicitly converted to an array.
    #
    #   Diff::LCS.sdiff(a, b).each do |action, (old_pos, old_element), (new_pos, new_element)|
    #     case action
    #     when '!'
    #       # replace
    #     when '-'
    #       # delete
    #     when '+'
    #       # insert
    #     end
    #   end
    #
    # source://diff-lcs//lib/diff/lcs.rb#200
    def sdiff(seq1, seq2, callbacks = T.unsafe(nil), &block); end

    # #traverse_balanced is an alternative to #traverse_sequences. It uses a
    # different algorithm to iterate through the entries in the computed longest
    # common subsequence. Instead of viewing the changes as insertions or
    # deletions from one of the sequences, #traverse_balanced will report
    # <em>changes</em> between the sequences.
    #
    # The arguments to #traverse_balanced are the two sequences to traverse and a
    # callback object, like this:
    #
    #   traverse_balanced(seq1, seq2, Diff::LCS::ContextDiffCallbacks.new)
    #
    # #sdiff is implemented with #traverse_balanced.
    #
    # == Callback Methods
    #
    # Optional callback methods are <em>emphasized</em>.
    #
    # callbacks#match::               Called when +a+ and +b+ are pointing to
    #                                 common elements in +A+ and +B+.
    # callbacks#discard_a::           Called when +a+ is pointing to an
    #                                 element not in +B+.
    # callbacks#discard_b::           Called when +b+ is pointing to an
    #                                 element not in +A+.
    # <em>callbacks#change</em>::     Called when +a+ and +b+ are pointing to
    #                                 the same relative position, but
    #                                 <tt>A[a]</tt> and <tt>B[b]</tt> are not
    #                                 the same; a <em>change</em> has
    #                                 occurred.
    #
    # #traverse_balanced might be a bit slower than #traverse_sequences,
    # noticable only while processing huge amounts of data.
    #
    # == Algorithm
    #
    #       a---+
    #           v
    #       A = a b c e h j l m n p
    #       B = b c d e f j k l m r s t
    #           ^
    #       b---+
    #
    # === Matches
    #
    # If there are two arrows (+a+ and +b+) pointing to elements of sequences +A+
    # and +B+, the arrows will initially point to the first elements of their
    # respective sequences. #traverse_sequences will advance the arrows through
    # the sequences one element at a time, calling a method on the user-specified
    # callback object before each advance. It will advance the arrows in such a
    # way that if there are elements <tt>A[i]</tt> and <tt>B[j]</tt> which are
    # both equal and part of the longest common subsequence, there will be some
    # moment during the execution of #traverse_sequences when arrow +a+ is
    # pointing to <tt>A[i]</tt> and arrow +b+ is pointing to <tt>B[j]</tt>. When
    # this happens, #traverse_sequences will call <tt>callbacks#match</tt> and
    # then it will advance both arrows.
    #
    # === Discards
    #
    # Otherwise, one of the arrows is pointing to an element of its sequence that
    # is not part of the longest common subsequence. #traverse_sequences will
    # advance that arrow and will call <tt>callbacks#discard_a</tt> or
    # <tt>callbacks#discard_b</tt>, depending on which arrow it advanced.
    #
    # === Changes
    #
    # If both +a+ and +b+ point to elements that are not part of the longest
    # common subsequence, then #traverse_sequences will try to call
    # <tt>callbacks#change</tt> and advance both arrows. If
    # <tt>callbacks#change</tt> is not implemented, then
    # <tt>callbacks#discard_a</tt> and <tt>callbacks#discard_b</tt> will be
    # called in turn.
    #
    # The methods for <tt>callbacks#match</tt>, <tt>callbacks#discard_a</tt>,
    # <tt>callbacks#discard_b</tt>, and <tt>callbacks#change</tt> are invoked
    # with an event comprising the action ("=", "+", "-", or "!", respectively),
    # the indicies +i+ and +j+, and the elements <tt>A[i]</tt> and <tt>B[j]</tt>.
    # Return values are discarded by #traverse_balanced.
    #
    # === Context
    #
    # Note that +i+ and +j+ may not be the same index position, even if +a+ and
    # +b+ are considered to be pointing to matching or changed elements.
    #
    # source://diff-lcs//lib/diff/lcs.rb#475
    def traverse_balanced(seq1, seq2, callbacks = T.unsafe(nil)); end

    # #traverse_sequences is the most general facility provided by this module;
    # #diff and #lcs are implemented as calls to it.
    #
    # The arguments to #traverse_sequences are the two sequences to traverse, and
    # a callback object, like this:
    #
    #   traverse_sequences(seq1, seq2, Diff::LCS::ContextDiffCallbacks.new)
    #
    # == Callback Methods
    #
    # Optional callback methods are <em>emphasized</em>.
    #
    # callbacks#match::               Called when +a+ and +b+ are pointing to
    #                                 common elements in +A+ and +B+.
    # callbacks#discard_a::           Called when +a+ is pointing to an
    #                                 element not in +B+.
    # callbacks#discard_b::           Called when +b+ is pointing to an
    #                                 element not in +A+.
    # <em>callbacks#finished_a</em>:: Called when +a+ has reached the end of
    #                                 sequence +A+.
    # <em>callbacks#finished_b</em>:: Called when +b+ has reached the end of
    #                                 sequence +B+.
    #
    # == Algorithm
    #
    #       a---+
    #           v
    #       A = a b c e h j l m n p
    #       B = b c d e f j k l m r s t
    #           ^
    #       b---+
    #
    # If there are two arrows (+a+ and +b+) pointing to elements of sequences +A+
    # and +B+, the arrows will initially point to the first elements of their
    # respective sequences. #traverse_sequences will advance the arrows through
    # the sequences one element at a time, calling a method on the user-specified
    # callback object before each advance. It will advance the arrows in such a
    # way that if there are elements <tt>A[i]</tt> and <tt>B[j]</tt> which are
    # both equal and part of the longest common subsequence, there will be some
    # moment during the execution of #traverse_sequences when arrow +a+ is
    # pointing to <tt>A[i]</tt> and arrow +b+ is pointing to <tt>B[j]</tt>. When
    # this happens, #traverse_sequences will call <tt>callbacks#match</tt> and
    # then it will advance both arrows.
    #
    # Otherwise, one of the arrows is pointing to an element of its sequence that
    # is not part of the longest common subsequence. #traverse_sequences will
    # advance that arrow and will call <tt>callbacks#discard_a</tt> or
    # <tt>callbacks#discard_b</tt>, depending on which arrow it advanced. If both
    # arrows point to elements that are not part of the longest common
    # subsequence, then #traverse_sequences will advance arrow +a+ and call the
    # appropriate callback, then it will advance arrow +b+ and call the appropriate
    # callback.
    #
    # The methods for <tt>callbacks#match</tt>, <tt>callbacks#discard_a</tt>, and
    # <tt>callbacks#discard_b</tt> are invoked with an event comprising the
    # action ("=", "+", or "-", respectively), the indicies +i+ and +j+, and the
    # elements <tt>A[i]</tt> and <tt>B[j]</tt>. Return values are discarded by
    # #traverse_sequences.
    #
    # === End of Sequences
    #
    # If arrow +a+ reaches the end of its sequence before arrow +b+ does,
    # #traverse_sequence will try to call <tt>callbacks#finished_a</tt> with the
    # last index and element of +A+ (<tt>A[-1]</tt>) and the current index and
    # element of +B+ (<tt>B[j]</tt>). If <tt>callbacks#finished_a</tt> does not
    # exist, then <tt>callbacks#discard_b</tt> will be called on each element of
    # +B+ until the end of the sequence is reached (the call will be done with
    # <tt>A[-1]</tt> and <tt>B[j]</tt> for each element).
    #
    # If +b+ reaches the end of +B+ before +a+ reaches the end of +A+,
    # <tt>callbacks#finished_b</tt> will be called with the current index and
    # element of +A+ (<tt>A[i]</tt>) and the last index and element of +B+
    # (<tt>A[-1]</tt>). Again, if <tt>callbacks#finished_b</tt> does not exist on
    # the callback object, then <tt>callbacks#discard_a</tt> will be called on
    # each element of +A+ until the end of the sequence is reached (<tt>A[i]</tt>
    # and <tt>B[-1]</tt>).
    #
    # There is a chance that one additional <tt>callbacks#discard_a</tt> or
    # <tt>callbacks#discard_b</tt> will be called after the end of the sequence
    # is reached, if +a+ has not yet reached the end of +A+ or +b+ has not yet
    # reached the end of +B+.
    #
    # source://diff-lcs//lib/diff/lcs.rb#285
    def traverse_sequences(seq1, seq2, callbacks = T.unsafe(nil)); end

    # Given a set of patchset, convert the current version to the prior version.
    # Does no auto-discovery.
    #
    # source://diff-lcs//lib/diff/lcs.rb#730
    def unpatch!(src, patchset); end

    private

    # source://diff-lcs//lib/diff/lcs/internals.rb#4
    def diff_traversal(method, seq1, seq2, callbacks, &block); end
  end
end

# An alias for DefaultCallbacks that is used in
# Diff::LCS#traverse_balanced.
#
#     Diff::LCS.LCS(seq1, seq2, Diff::LCS::BalancedCallbacks)
#
# source://diff-lcs//lib/diff/lcs/callbacks.rb#50
Diff::LCS::BalancedCallbacks = Diff::LCS::DefaultCallbacks

# Represents a simplistic (non-contextual) change. Represents the removal or
# addition of an element from either the old or the new sequenced
# enumerable.
#
# source://diff-lcs//lib/diff/lcs/change.rb#6
class Diff::LCS::Change
  include ::Comparable

  # @return [Change] a new instance of Change
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#27
  def initialize(*args); end

  # source://diff-lcs//lib/diff/lcs/change.rb#65
  def <=>(other); end

  # source://diff-lcs//lib/diff/lcs/change.rb#58
  def ==(other); end

  # Returns the action this Change represents.
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#20
  def action; end

  # @return [Boolean]
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#72
  def adding?; end

  # @return [Boolean]
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#84
  def changed?; end

  # @return [Boolean]
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#76
  def deleting?; end

  # Returns the sequence element of the Change.
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#25
  def element; end

  # @return [Boolean]
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#88
  def finished_a?; end

  # @return [Boolean]
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#92
  def finished_b?; end

  # source://diff-lcs//lib/diff/lcs/change.rb#34
  def inspect(*_args); end

  # Returns the position of the Change.
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#23
  def position; end

  # source://diff-lcs//lib/diff/lcs/change.rb#38
  def to_a; end

  # source://diff-lcs//lib/diff/lcs/change.rb#38
  def to_ary; end

  # @return [Boolean]
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#80
  def unchanged?; end

  class << self
    # source://diff-lcs//lib/diff/lcs/change.rb#44
    def from_a(arr); end

    # @return [Boolean]
    #
    # source://diff-lcs//lib/diff/lcs/change.rb#15
    def valid_action?(action); end
  end
end

# source://diff-lcs//lib/diff/lcs/change.rb#7
Diff::LCS::Change::IntClass = Integer

# The only actions valid for changes are '+' (add), '-' (delete), '='
# (no change), '!' (changed), '<' (tail changes from first sequence), or
# '>' (tail changes from second sequence). The last two ('<>') are only
# found with Diff::LCS::diff and Diff::LCS::sdiff.
#
# source://diff-lcs//lib/diff/lcs/change.rb#13
Diff::LCS::Change::VALID_ACTIONS = T.let(T.unsafe(nil), Array)

# Represents a contextual change. Contains the position and values of the
# elements in the old and the new sequenced enumerables as well as the action
# taken.
#
# source://diff-lcs//lib/diff/lcs/change.rb#100
class Diff::LCS::ContextChange < ::Diff::LCS::Change
  # @return [ContextChange] a new instance of ContextChange
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#114
  def initialize(*args); end

  # source://diff-lcs//lib/diff/lcs/change.rb#166
  def <=>(other); end

  # source://diff-lcs//lib/diff/lcs/change.rb#157
  def ==(other); end

  # Returns the new element being changed.
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#112
  def new_element; end

  # Returns the new position being changed.
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#108
  def new_position; end

  # Returns the old element being changed.
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#110
  def old_element; end

  # Returns the old position being changed.
  #
  # source://diff-lcs//lib/diff/lcs/change.rb#106
  def old_position; end

  # source://diff-lcs//lib/diff/lcs/change.rb#122
  def to_a; end

  # source://diff-lcs//lib/diff/lcs/change.rb#122
  def to_ary; end

  class << self
    # source://diff-lcs//lib/diff/lcs/change.rb#132
    def from_a(arr); end

    # Simplifies a context change for use in some diff callbacks. '<' actions
    # are converted to '-' and '>' actions are converted to '+'.
    #
    # source://diff-lcs//lib/diff/lcs/change.rb#138
    def simplify(event); end
  end
end

# This will produce a compound array of contextual diff change objects. Each
# element in the #diffs array is a "hunk" array, where each element in each
# "hunk" array is a single change. Each change is a Diff::LCS::ContextChange
# that contains both the old index and new index values for the change. The
# "hunk" provides the full context for the changes. Both old and new objects
# will be presented for changed objects. +nil+ will be substituted for a
# discarded object.
#
#     seq1 = %w(a b c e h j l m n p)
#     seq2 = %w(b c d e f j k l m r s t)
#
#     diffs = Diff::LCS.diff(seq1, seq2, Diff::LCS::ContextDiffCallbacks)
#       # This example shows a simplified array format.
#       # [ [ [ '-', [  0, 'a' ], [  0, nil ] ] ],   # 1
#       #   [ [ '+', [  3, nil ], [  2, 'd' ] ] ],   # 2
#       #   [ [ '-', [  4, 'h' ], [  4, nil ] ],     # 3
#       #     [ '+', [  5, nil ], [  4, 'f' ] ] ],
#       #   [ [ '+', [  6, nil ], [  6, 'k' ] ] ],   # 4
#       #   [ [ '-', [  8, 'n' ], [  9, nil ] ],     # 5
#       #     [ '+', [  9, nil ], [  9, 'r' ] ],
#       #     [ '-', [  9, 'p' ], [ 10, nil ] ],
#       #     [ '+', [ 10, nil ], [ 10, 's' ] ],
#       #     [ '+', [ 10, nil ], [ 11, 't' ] ] ] ]
#
# The five hunks shown are comprised of individual changes; if there is a
# related set of changes, they are still shown individually.
#
# This callback can also be used with Diff::LCS#sdiff, which will produce
# results like:
#
#     diffs = Diff::LCS.sdiff(seq1, seq2, Diff::LCS::ContextCallbacks)
#       # This example shows a simplified array format.
#       # [ [ [ "-", [  0, "a" ], [  0, nil ] ] ],  # 1
#       #   [ [ "+", [  3, nil ], [  2, "d" ] ] ],  # 2
#       #   [ [ "!", [  4, "h" ], [  4, "f" ] ] ],  # 3
#       #   [ [ "+", [  6, nil ], [  6, "k" ] ] ],  # 4
#       #   [ [ "!", [  8, "n" ], [  9, "r" ] ],    # 5
#       #     [ "!", [  9, "p" ], [ 10, "s" ] ],
#       #     [ "+", [ 10, nil ], [ 11, "t" ] ] ] ]
#
# The five hunks are still present, but are significantly shorter in total
# presentation, because changed items are shown as changes ("!") instead of
# potentially "mismatched" pairs of additions and deletions.
#
# The result of this operation is similar to that of
# Diff::LCS::SDiffCallbacks. They may be compared as:
#
#     s = Diff::LCS.sdiff(seq1, seq2).reject { |e| e.action == "=" }
#     c = Diff::LCS.sdiff(seq1, seq2, Diff::LCS::ContextDiffCallbacks).flatten(1)
#
#     s == c # -> true
#
# === Use
#
# This callback object must be initialised and can be used by the
# Diff::LCS#diff or Diff::LCS#sdiff methods.
#
#     cbo = Diff::LCS::ContextDiffCallbacks.new
#     Diff::LCS.LCS(seq1, seq2, cbo)
#     cbo.finish
#
# Note that the call to #finish is absolutely necessary, or the last set of
# changes will not be visible. Alternatively, can be used as:
#
#     cbo = Diff::LCS::ContextDiffCallbacks.new { |tcbo| Diff::LCS.LCS(seq1, seq2, tcbo) }
#
# The necessary #finish call will be made.
#
# === Simplified Array Format
#
# The simplified array format used in the example above can be obtained
# with:
#
#     require 'pp'
#     pp diffs.map { |e| e.map { |f| f.to_a } }
#
# source://diff-lcs//lib/diff/lcs/callbacks.rb#225
class Diff::LCS::ContextDiffCallbacks < ::Diff::LCS::DiffCallbacks
  # source://diff-lcs//lib/diff/lcs/callbacks.rb#234
  def change(event); end

  # source://diff-lcs//lib/diff/lcs/callbacks.rb#226
  def discard_a(event); end

  # source://diff-lcs//lib/diff/lcs/callbacks.rb#230
  def discard_b(event); end
end

# This callback object implements the default set of callback events,
# which only returns the event itself. Note that #finished_a and
# #finished_b are not implemented -- I haven't yet figured out where they
# would be useful.
#
# Note that this is intended to be called as is, e.g.,
#
#     Diff::LCS.LCS(seq1, seq2, Diff::LCS::DefaultCallbacks)
#
# source://diff-lcs//lib/diff/lcs/callbacks.rb#14
class Diff::LCS::DefaultCallbacks
  class << self
    # Called when both the old and new values have changed.
    #
    # source://diff-lcs//lib/diff/lcs/callbacks.rb#32
    def change(event); end

    # Called when the old value is discarded in favour of the new value.
    #
    # source://diff-lcs//lib/diff/lcs/callbacks.rb#22
    def discard_a(event); end

    # Called when the new value is discarded in favour of the old value.
    #
    # source://diff-lcs//lib/diff/lcs/callbacks.rb#27
    def discard_b(event); end

    # Called when two items match.
    #
    # source://diff-lcs//lib/diff/lcs/callbacks.rb#17
    def match(event); end

    private

    def new(*_arg0); end
  end
end

# This will produce a compound array of simple diff change objects. Each
# element in the #diffs array is a +hunk+ or +hunk+ array, where each
# element in each +hunk+ array is a single Change object representing the
# addition or removal of a single element from one of the two tested
# sequences. The +hunk+ provides the full context for the changes.
#
#     diffs = Diff::LCS.diff(seq1, seq2)
#       # This example shows a simplified array format.
#       # [ [ [ '-',  0, 'a' ] ],   # 1
#       #   [ [ '+',  2, 'd' ] ],   # 2
#       #   [ [ '-',  4, 'h' ],     # 3
#       #     [ '+',  4, 'f' ] ],
#       #   [ [ '+',  6, 'k' ] ],   # 4
#       #   [ [ '-',  8, 'n' ],     # 5
#       #     [ '-',  9, 'p' ],
#       #     [ '+',  9, 'r' ],
#       #     [ '+', 10, 's' ],
#       #     [ '+', 11, 't' ] ] ]
#
# There are five hunks here. The first hunk says that the +a+ at position 0
# of the first sequence should be deleted (<tt>'-'</tt>). The second hunk
# says that the +d+ at position 2 of the second sequence should be inserted
# (<tt>'+'</tt>). The third hunk says that the +h+ at position 4 of the
# first sequence should be removed and replaced with the +f+ from position 4
# of the second sequence. The other two hunks are described similarly.
#
# === Use
#
# This callback object must be initialised and is used by the Diff::LCS#diff
# method.
#
#     cbo = Diff::LCS::DiffCallbacks.new
#     Diff::LCS.LCS(seq1, seq2, cbo)
#     cbo.finish
#
# Note that the call to #finish is absolutely necessary, or the last set of
# changes will not be visible. Alternatively, can be used as:
#
#     cbo = Diff::LCS::DiffCallbacks.new { |tcbo| Diff::LCS.LCS(seq1, seq2, tcbo) }
#
# The necessary #finish call will be made.
#
# === Simplified Array Format
#
# The simplified array format used in the example above can be obtained
# with:
#
#     require 'pp'
#     pp diffs.map { |e| e.map { |f| f.to_a } }
#
# source://diff-lcs//lib/diff/lcs/callbacks.rb#108
class Diff::LCS::DiffCallbacks
  # :yields: self
  #
  # @return [DiffCallbacks] a new instance of DiffCallbacks
  #
  # source://diff-lcs//lib/diff/lcs/callbacks.rb#112
  def initialize; end

  # Returns the difference set collected during the diff process.
  #
  # source://diff-lcs//lib/diff/lcs/callbacks.rb#110
  def diffs; end

  # source://diff-lcs//lib/diff/lcs/callbacks.rb#135
  def discard_a(event); end

  # source://diff-lcs//lib/diff/lcs/callbacks.rb#139
  def discard_b(event); end

  # Finalizes the diff process. If an unprocessed hunk still exists, then it
  # is appended to the diff list.
  #
  # source://diff-lcs//lib/diff/lcs/callbacks.rb#127
  def finish; end

  # source://diff-lcs//lib/diff/lcs/callbacks.rb#131
  def match(_event); end

  private

  # source://diff-lcs//lib/diff/lcs/callbacks.rb#143
  def finish_hunk; end
end

# source://diff-lcs//lib/diff/lcs/internals.rb#29
module Diff::LCS::Internals
  class << self
    # This method will analyze the provided patchset to provide a single-pass
    # normalization (conversion of the array form of Diff::LCS::Change objects to
    # the object form of same) and detection of whether the patchset represents
    # changes to be made.
    #
    # source://diff-lcs//lib/diff/lcs/internals.rb#102
    def analyze_patchset(patchset, depth = T.unsafe(nil)); end

    # Examine the patchset and the source to see in which direction the
    # patch should be applied.
    #
    # WARNING: By default, this examines the whole patch, so this could take
    # some time. This also works better with Diff::LCS::ContextChange or
    # Diff::LCS::Change as its source, as an array will cause the creation
    # of one of the above.
    #
    # source://diff-lcs//lib/diff/lcs/internals.rb#147
    def intuit_diff_direction(src, patchset, limit = T.unsafe(nil)); end

    # Compute the longest common subsequence between the sequenced
    # Enumerables +a+ and +b+. The result is an array whose contents is such
    # that
    #
    #     result = Diff::LCS::Internals.lcs(a, b)
    #     result.each_with_index do |e, i|
    #       assert_equal(a[i], b[e]) unless e.nil?
    #     end
    #
    # source://diff-lcs//lib/diff/lcs/internals.rb#41
    def lcs(a, b); end

    private

    # If +vector+ maps the matching elements of another collection onto this
    # Enumerable, compute the inverse of +vector+ that maps this Enumerable
    # onto the collection. (Currently unused.)
    #
    # source://diff-lcs//lib/diff/lcs/internals.rb#286
    def inverse_vector(a, vector); end

    # Returns a hash mapping each element of an Enumerable to the set of
    # positions it occupies in the Enumerable, optionally restricted to the
    # elements specified in the range of indexes specified by +interval+.
    #
    # source://diff-lcs//lib/diff/lcs/internals.rb#298
    def position_hash(enum, interval); end

    # Find the place at which +value+ would normally be inserted into the
    # Enumerable. If that place is already occupied by +value+, do nothing
    # and return +nil+. If the place does not exist (i.e., it is off the end
    # of the Enumerable), add it to the end. Otherwise, replace the element
    # at that point with +value+. It is assumed that the Enumerable's values
    # are numeric.
    #
    # This operation preserves the sort order.
    #
    # source://diff-lcs//lib/diff/lcs/internals.rb#252
    def replace_next_larger(enum, value, last_index = T.unsafe(nil)); end
  end
end

# This will produce a simple array of diff change objects. Each element in
# the #diffs array is a single ContextChange. In the set of #diffs provided
# by SDiffCallbacks, both old and new objects will be presented for both
# changed <strong>and unchanged</strong> objects. +nil+ will be substituted
# for a discarded object.
#
# The diffset produced by this callback, when provided to Diff::LCS#sdiff,
# will compute and display the necessary components to show two sequences
# and their minimized differences side by side, just like the Unix utility
# +sdiff+.
#
#     same             same
#     before     |     after
#     old        <     -
#     -          >     new
#
#     seq1 = %w(a b c e h j l m n p)
#     seq2 = %w(b c d e f j k l m r s t)
#
#     diffs = Diff::LCS.sdiff(seq1, seq2)
#       # This example shows a simplified array format.
#       # [ [ "-", [  0, "a"], [  0, nil ] ],
#       #   [ "=", [  1, "b"], [  0, "b" ] ],
#       #   [ "=", [  2, "c"], [  1, "c" ] ],
#       #   [ "+", [  3, nil], [  2, "d" ] ],
#       #   [ "=", [  3, "e"], [  3, "e" ] ],
#       #   [ "!", [  4, "h"], [  4, "f" ] ],
#       #   [ "=", [  5, "j"], [  5, "j" ] ],
#       #   [ "+", [  6, nil], [  6, "k" ] ],
#       #   [ "=", [  6, "l"], [  7, "l" ] ],
#       #   [ "=", [  7, "m"], [  8, "m" ] ],
#       #   [ "!", [  8, "n"], [  9, "r" ] ],
#       #   [ "!", [  9, "p"], [ 10, "s" ] ],
#       #   [ "+", [ 10, nil], [ 11, "t" ] ] ]
#
# The result of this operation is similar to that of
# Diff::LCS::ContextDiffCallbacks. They may be compared as:
#
#     s = Diff::LCS.sdiff(seq1, seq2).reject { |e| e.action == "=" }
#     c = Diff::LCS.sdiff(seq1, seq2, Diff::LCS::ContextDiffCallbacks).flatten(1)
#
#     s == c # -> true
#
# === Use
#
# This callback object must be initialised and is used by the Diff::LCS#sdiff
# method.
#
#     cbo = Diff::LCS::SDiffCallbacks.new
#     Diff::LCS.LCS(seq1, seq2, cbo)
#
# As with the other initialisable callback objects,
# Diff::LCS::SDiffCallbacks can be initialised with a block. As there is no
# "fininishing" to be done, this has no effect on the state of the object.
#
#     cbo = Diff::LCS::SDiffCallbacks.new { |tcbo| Diff::LCS.LCS(seq1, seq2, tcbo) }
#
# === Simplified Array Format
#
# The simplified array format used in the example above can be obtained
# with:
#
#     require 'pp'
#     pp diffs.map { |e| e.to_a }
#
# source://diff-lcs//lib/diff/lcs/callbacks.rb#303
class Diff::LCS::SDiffCallbacks
  # :yields: self
  #
  # @return [SDiffCallbacks] a new instance of SDiffCallbacks
  # @yield [_self]
  # @yieldparam _self [Diff::LCS::SDiffCallbacks] the object that the method was called on
  #
  # source://diff-lcs//lib/diff/lcs/callbacks.rb#307
  def initialize; end

  # source://diff-lcs//lib/diff/lcs/callbacks.rb#324
  def change(event); end

  # Returns the difference set collected during the diff process.
  #
  # source://diff-lcs//lib/diff/lcs/callbacks.rb#305
  def diffs; end

  # source://diff-lcs//lib/diff/lcs/callbacks.rb#316
  def discard_a(event); end

  # source://diff-lcs//lib/diff/lcs/callbacks.rb#320
  def discard_b(event); end

  # source://diff-lcs//lib/diff/lcs/callbacks.rb#312
  def match(event); end
end

# An alias for DefaultCallbacks that is used in
# Diff::LCS#traverse_sequences.
#
#     Diff::LCS.LCS(seq1, seq2, Diff::LCS::SequenceCallbacks)
#
# source://diff-lcs//lib/diff/lcs/callbacks.rb#44
Diff::LCS::SequenceCallbacks = Diff::LCS::DefaultCallbacks

# source://diff-lcs//lib/diff/lcs.rb#52
Diff::LCS::VERSION = T.let(T.unsafe(nil), String)
