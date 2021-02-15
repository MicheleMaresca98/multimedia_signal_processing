function h = partitioned_histogram(x, BLOCK_SIZE)
%PARTITIONED_HISTOGRAM get a partioned histogram of image x dived in
% severals blocks
	h = blockproc(x, BLOCK_SIZE, @(t) hist(t.data(:), 0:255));
	h = h(:)';
end