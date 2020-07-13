# Baseline code for paper "Gestures in-the-wild: detecting conversational hand gestures in crowded scenes using a multimodal fusion of bags of video trajectories and body worn acceleration"

This method is based on dense trajectories and multiple instance learning. See more details in the [paper](https://ieeexplore.ieee.org/document/8734888).

**NOTE:** This code is optimized to function as baseline for the [No-Audio Speech Detection](https://multimediaeval.github.io/editions/2020/) task at the MediaEval workshop. Changes would be needed to adapt it for other tasks or projects. Nevertheless, the functionality remains.

[Dense trajectories](https://ieeexplore.ieee.org/abstract/document/5995407), proposed by Wang et. al., is a descriptor based on motion boundary histograms, which is robust to camera motion. This descriptor has showned to be promising and it is widely used for human activity recognition.

The original code for the dense trajectories can be downloaded [here](https://lear.inrialpes.fr/people/wang/dense_trajectories). We include a modified code in this repository which stores the trajectories as separated files for computation efficiency. 

The trajectories are later used by a multiples instance approach called Multiple-Instance Learning via Embedded Instance Selection or [MILES](https://ieeexplore.ieee.org/document/1717454). This method gives every instance, or trajectory in our case, a weight of contribution towards classifying a given bag as a positive (gesture or speaking segment).

### MILES implementation with PRTOOLS

The code provided use the MILES implementations in the [PRTools](http://prtools.tudelft.nl/). Before running the code, test that this tool for MATLAB is operating properly.

### Using SLEP optimizer

Currently, the code uses an embedded MATLAB optimizer. Nonehteless, better results can be achieved using a more specialized optimizer. We recommended [SLEP](https://github.com/jiayuzhou/SLEP). The code to run the miles algorithm with this optimizer is also provided.

### parameter optimization

The code provides default parameters for the MILES algorithm. These are not yet tuned.

## Usage

1. **Extract Dense Trajectories**  A python wrapper is included (*extract_DT_from_sequence.py*) to extract the dense trajectories for the video. This file is optimized for the videos provided for the [No-Audio Speech Detection](https://multimediaeval.github.io/editions/2020/) task at the MediaEval workshop, but can be used with any other video. We do recommend to separate the video into participants for optimal memory use.

2. **MILES training and testing** Once the Dense Trajectories are extracted and stored, *the run_baseline_video.m* script can be run. This would randomly divide the training and test set, would train the MILES classifier and test it. Since the PRTools are only available in MATLAB so far, this solution is not available for Python yet. A Python version of the PRTools is ongoing.
