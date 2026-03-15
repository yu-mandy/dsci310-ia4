# author: Jordan Bourak & Tiffany Timbers
# date: 2021-11-22

all: results/horse_pop_plot_largest_sd.png \
	results/horse_pops_plot.png \
	results/horses_spread.csv \
	docs/index.html \
	reports/index.pdf



# generate figures and objects for report
results/horse_pop_plot_largest_sd.png results/horse_pops_plot.png results/horses_spread.csv: source/generate_figures.R
	Rscript source/generate_figures.R --input_dir="data/00030067-eng.csv" \
		--out_dir="results"

# render quarto report in HTML and PDF
docs/index.html: results reports/index.qmd
	quarto render reports/index.qmd --to html --output-dir ../docs

reports/index.pdf: results reports/index.qmd
	quarto render reports/index.qmd --to pdf

# clean
clean:
	rm -rf results
	rm -rf reports/index.html\
		reports/index.pdf \
		reports/index_files \
		reports/index.tex \
		reports/index.log \
	rm -rf docs/index.html\
		docs/index_files
