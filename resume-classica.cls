\ProvidesClass{resume-classica}[2019/05/09 v1.0.0 Resume Classica Class]
\LoadClass[10.5pt,letterpaper]{article}

\usepackage[left=1.5cm, top=1cm, right=1.5cm, bottom=1.0cm, footskip=.5cm]{geometry}
\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}
\usepackage[T1]{fontenc}
\usepackage{hyperref}
\usepackage{changepage}
\usepackage{multirow}
\usepackage{fontawesome}
\pagestyle{empty}

% User-Specified Format Characteristics.
\def\Bullet{$\diamond$}
\def\NameSize{\LARGE}
\def\AddressSize{\large}
\def\SocialSize{\large}
\def\NameSkip{\vspace{1.5mm}}
\def\AddressSkip{\smallskip}

\def\SectionHeaderSkip{\smallskip}
\def\SectionSkip{\medskip}
\def\SectionListIndent{1.5em}
\def\SubSectionSkip{\vspace{1mm}}
\def\SubSectionListHeaderSkip{\smallskip}
\def\SubSectionListIndent{1.3em}
\def\SubSectionParagraphHeaderSkip{\vspace{-0.4em}}
\def\SubSectionParagraphIndent{1em}
\def\LabeledListSkip{2ex}
\def\IconSeparator{\space}
\def\SocialSeparator{\IconSeparator\Bullet\IconSeparator}

% Header. Usage: \printheader
\newcommand*{\name}[1]{\def\@name{#1}}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

\def \printaddress {
    \begingroup
        \centerline{\AddressSize\@address}
    \endgroup
    \par
    \AddressSkip
}

\def \printname {
  \begingroup
    \hfil{\NameSize\bf \textsc{\@name}}\hfil
    \NameSkip\break
  \endgroup
}

% Improvement: Enable these to be inserted in any order (use the isStart flag in AwesomeCV)
\def \printsocial {
        \begingroup \centerline{
            \ifthenelse{\isundefined{\@mobile}}{}
            {\faMobile\IconSeparator\@mobile}
            \ifthenelse{\isundefined{\@email}}{}
            {\SocialSeparator{} \href{mailto:\@email}{\faEnvelope\IconSeparator\texttt{\@email}}}
            \ifthenelse{\isundefined{\@linkedin}}{}
            {\SocialSeparator{} \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedinSquare\IconSeparator\@linkedin}}
        }
        \endgroup
    \par
    \AddressSkip
}

\newcommand{\printheader}{
    \printname
    \printaddress
    \printsocial
}

% Section. Usage: \begin{rSection}{section-name}
\newenvironment{rSection}[1]{
    \SectionSkip
    \MakeUppercase{\bf #1}
    \SectionHeaderSkip
    \hrule
    \begin{list}{}{
        \setlength{\leftmargin}{\SectionListIndent}
    }
        \item[]
    }{
    \end{list}
}

% Subsection (Primitive).
\newcommand{\rSubsection}[4]{
    {\bf #1} \hfill {\em #2}
    \ifthenelse{\equal{#3}{}}{}{
    \\ {\em #3} \hfill #4}
}

% Subsection (List). Usage: \begin{rSubsection}{bold-title}{date}{sub-title}{location}
\newenvironment{rSubsectionList}[4]{
    \rSubsection{#1}{#2}{#3}{#4}
    \SubSectionListHeaderSkip
    \begin{list}{\Bullet}{\leftmargin=\SubSectionListIndent}
    \itemsep -0.5em \vspace{-0.5em}
}{
    \end{list}
    \SubSectionSkip
}

% Subsection (Paragraph). Usage: \begin{rSubsection}{bold-title}{date}{sub-title}{location}
\newenvironment{rSubsectionParagraph}[4]{
    \rSubsection{#1}{#2}{#3}{#4}
    \SubSectionParagraphHeaderSkip
    \begin{list}{}{
        \setlength{\leftmargin}{\SubSectionParagraphIndent}}
        \item[]
}{
    \end{list}
    \SubSectionSkip
}

% Labeled List. Usage: \begin{rLabeledList}{style-macro}
% Improvement: Logic to determine if we need a line break (and so need a double-row label); do not require the user to provide this information in command nitem (arg 3).
\newenvironment{rLabeledList}[1]{
    \renewcommand{\item}[3]{\multirow{##3}{*}{##1} & \multicolumn{1}{p{14cm}}{##2} \vspace{0.6ex}\\}
    \begin{tabular}{ @{} >{#1}l @{\hspace{\LabeledListSkip}}l }
}{
    \end{tabular}
}