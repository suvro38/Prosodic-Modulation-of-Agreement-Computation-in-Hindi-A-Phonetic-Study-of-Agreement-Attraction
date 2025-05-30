# Prosodic-Modulation-of-Agreement-Computation-in-Hindi-A-Phonetic-Study-of-Agreement-Attraction
Mini Project for the course Acoustic Phonetics

## Abstract
This project explores the role of prosody in agreement attraction—a syntactic error where a verb mistakenly agrees with a structurally irrelevant noun—in Hindi. Agreement attraction errors, such as “The key to the cabinets were missing,” reflect interference from a nearby distractor noun. In Hindi, such errors are particularly susceptible to morphological transparency (e.g., feminine plural forms). Prior work (e.g., Royer, 2021; Frazier et al., 2006) has shown that prosodic phrasing influences memory retrieval, but it's unclear where in the sentence agreement computation is completed. This project investigates whether prosodic cues signal the point of agreement resolution in Hindi verb complexes. We analyse whether prosodic boundaries modulate the retrieval domain during agreement computation by tracking pitch, intensity, and duration across verb complexes. Findings suggest that prosodic cues, particularly increased pitch on the verb, may serve as temporal markers for syntactic repair or resolution.

## Methodology
### Data Acquisition
Recordings from a preamble repitition task (for a different experiment) with match/mismatch stimuli from 8 participants were used (N = 38).
Conditions: 2x3 design. Agreement condition (match/mismatch) × Region (verb, aux1, aux2)

### Annotation
TextGrids were created for each recording in Praat, manually time-aligned to isolate target regions (verb, aux1, aux2).

### Feature Extraction
Extracted features per region using Praat script: Mean pitch (Hz), Mean intensity (dB), Duration (ms)

### Analysis
Linear Mixed-effects Modelling was used to analyse the effect of the two predictors (condition, region) on the three outcomes (pitch, intensity, duration) separately using the lme4 package in R. Random effects were considered for speakers, and items.

## Results
Significantly higher average pitch over the main verb in mismatch conditions (t = 2.25), suggesting pitch as a cue to agreement resolution.
Mismatch verbs slightly shorter on average (~60ms), but not statistically significant.
Weak positive correlation of intensity with pitch; no consistent pattern across conditions.
The main verb region likely hosts the agreement computation process, marked prosodically by increased pitch—even in the absence of robust duration/intensity changes.
