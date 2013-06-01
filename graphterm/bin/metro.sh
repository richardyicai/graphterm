#!/bin/bash
# metro.sh: "Metro" style demo of GraphTerm features

# Create 3x3 frames, with borders, each row 300px tall, to display terminals
gframe -c 3 -b -r 40% -t tweetwin weatherwin slidewin cloudwin matplotwin notewin
sleep 5

# Tweet stream, fullscreen, search for keyword "science"
gsh -c tweetwin gtweet -f -s science

# Display weather for Austin (using Yahoo weather API)
gsh -c weatherwin yweather -f austin

# Looping slide show using reveal.js
gsh -c slidewin greveal -l -t 2500 '$GTERM_DIR/bin/landslide/landslides.md' '|' gframe -f

# Generate and display wordcloud using d3.js
gsh -c cloudwin d3cloud '$GTERM_DIR/bin/d3cloud' '|' gframe -f

# Draw snowflakes using inline SVG
gsh -c matplotwin sleep 4
gsh matplotwin gsnowflake.py
gsh matplotwin sleep 4

# Animate inline matplotlib graph in the same window
gsh matplotwin gmatplot.py --animate

# Start a notebook
gsh -c notewin python -i '$GTERM_DIR/bin/gpylab.py' '$GTERM_DIR/notebooks/SineWave.ipynb'
