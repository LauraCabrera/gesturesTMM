function[] = run_baseline_video(stratified,NumBags,subjects_train,subjects_test)

	path(pathdef);
	addpath(genpath('/*MYDIR*/MATLAB/code/prtools'));
	addpath(genpath('/*MYDIR*/MATLAB/code/dd_tools'));
	addpath(genpath('/*MYDIR*/MATLAB/code/mil'));
	addpath(genpath('/*MYDIR*/code/SLEP_package_4.1'));

	input_dir='/*MYDIR*/bags/';
	output_dir='/*MYDIR*/results/decision_fusion/';
	mkdir(output_dir);

	%these are random values, optimization is required for better performance 
	l=0.007;
	KPAR=20;
	
	
	[x,z] = get_train_test_noaccel(input_dir,subjects_train,subjects_test);
	[bags,lab] = getbags(z);
	[Ip_test,In_test] = find_positive(lab);
	
	if ~isempty(Ip_test)	
		
		disp('Performing training using different random sampligs in a stratified manner...');
		
        %now, from training data randomly select only k bags									
		[x_]=do_bags_sampling_noaccel(x,stratified,NumBags);
		
		disp('Classifying...')
		w_miles=miles_SLEP(x_,l,'r',KPAR);
		disp('Done!');
		
		disp('Getting miles predictions on train set...')
		out_miles_train=x_*w_miles;
		p_miles_train=out_miles_train*classc;		
		p_miles_train=+p_miles_train(:,2);
		est_lab_miles_train =out_miles_train*labeld;
		disp('Done!')
		
		disp('Obtaining test results from miles')
		out_miles_test=z*w_miles;
		p_miles_test=out_miles_test*classc;
		p_miles_test=+p_miles_test(:,2); %probability of class positive
		auc_miles=dd_auc(out_miles_test*milroc)
		y_est_miles_test=out_miles_test*labeld;		
		disp('Done!')
		
	end

end
