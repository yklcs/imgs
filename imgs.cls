\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imgs}[imgs standalone]

\newlength\margin
\setlength{\margin}{5mm}
\newlength\marginbottom
\setlength{\marginbottom}{1.5mm}
\newlength\margindiff
\setlength{\margindiff}{\margin}
\addtolength{\margindiff}{-\marginbottom}

\LoadClass[
  crop,
  varwidth,
  margin={\margin, \marginbottom, \margin, \margin}
]{standalone}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{kotex}
\RequirePackage{amsmath,amssymb,amsthm,mathtools}
\RequirePackage{physics}
\RequirePackage{algorithm,algpseudocode}
\RequirePackage[inline]{enumitem}
\RequirePackage{microtype}
\RequirePackage{tcolorbox}
\RequirePackage{parskip}
\RequirePackage{listings}
\RequirePackage{xspace}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{tikz}
\RequirePackage{tabularx}
\RequirePackage{fancyvrb}
\RequirePackage{lmodern}
\RequirePackage{datetime2}
\RequirePackage{qrcode}
\RequirePackage{currfile}

\theoremstyle{definition}
\newtheorem*{definition}{Definition}

\theoremstyle{plain}
\newtheorem*{theorem}{Theorem}

\newlength{\savedparskip}
\setlength{\savedparskip}{.3\baselineskip plus 1pt}

\makeatletter
\g@addto@macro{\sa@boxit}{\parskip=\savedparskip}
\makeatother

\makeatletter
\def\imgs@footer{
  \textcolor{lightgray}{\footnotesize\texttt{yklcs/imgs -- \DTMnow}}
  \hspace{1em}\hfill
  \raisebox{\depth}{\qrcode*[height=6mm]{https://github.com/yklcs/imgs/\currfilename}}
  \hspace{-\margindiff}
}
\makeatother

\makeatletter
\edef\sa@cls@beforeenddocument{
  \unexpanded\expandafter{\imgs@footer}
  \unexpanded\expandafter{\sa@cls@beforeenddocument}
}
\makeatother

\DeclarePairedDelimiter{\cbk}{\{}{\}}
\DeclarePairedDelimiter{\rbk}{(}{)}
\DeclarePairedDelimiter{\sbk}{[}{]}
\DeclarePairedDelimiter{\abk}{\langle}{\rangle}
