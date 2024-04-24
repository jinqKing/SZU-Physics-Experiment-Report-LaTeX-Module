\ProvidesClass{phyreport}[2024/03/22 v3]
\LoadClassWithOptions{ctexart}
% 基础宏包引用
\RequirePackage{amsmath}
\RequirePackage{array}\RequirePackage{float}\RequirePackage{framed}\RequirePackage{xparse}
\RequirePackage{fancybox}\RequirePackage{fancyhdr}\RequirePackage[margin=1in]{geometry}
\RequirePackage{graphicx}\RequirePackage{tikz}
\RequirePackage{caption}\RequirePackage{booktabs}\RequirePackage{multirow}\RequirePackage{comment}
% section 的字体设置
\RequirePackage{titlesec}
\titleformat{\section}[block]{\normalfont\bfseries\large}{\thesection}{0em}{}
\titleformat{\subsection}[block]{\normalfont\bfseries\normalsize}{\thesubsection}{1ex}{}
\RequirePackage{zhnumber} 
\renewcommand{\thesection}{\zhnum{section}、}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\hspace{2em}\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
% 版面设置
\pagestyle{fancy}
\lhead{}\chead{}\rhead{}\lfoot{}\cfoot{}
\rfoot{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\headwidth}{\textwidth}
\renewcommand{\footrulewidth}{0pt}
\newcolumntype{C}{>{\centering\arraybackslash}m{1.0cm}} % 表格列格式设置
\captionsetup{font={small}} % 图表标题字样小一号
% 实验报告信息设置
\newcommand{\expName}[1]{\newcommand{\phyExpName}{#1}}
\newcommand{\expDate}[3]{
  \IfValueTF{#1}{\newcommand{\syear}{#1}}{\newcommand{\syear}{2024}}
  \IfValueTF{#2}{\newcommand{\smonth}{#2}}{\newcommand{\smonth}{}}
  \IfValueTF{#3}{\newcommand{\sday}{#3}}{\newcommand{\sday}{}}
}
\newcommand{\subDate}[3]{
  \IfValueTF{#1}{\newcommand{\fyear}{#1}}{\newcommand{\fyear}{2024}}
  \IfValueTF{#2}{\newcommand{\fmonth}{#2}}{\newcommand{\fmonth}{}}
  \IfValueTF{#3}{\newcommand{\fday}{#3}}{\newcommand{\fday}{}}
}
% \newcommand{\expAddr}[1]{
%   \IfValueTF{#1}{\newcommand{\phyExpAddr}{#1}}
%                 {\newcommand{\phyExpAddr}{致原楼}}
% }
% 绘制实验报告第一页封面
\NewDocumentCommand\phyExpCover{}{
  \newpage
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture, overlay, inner sep=0pt,every node/.style={right, font=\fontsize{11}{11}\selectfont}]
    \node at (0.48,0.5)
      {课程编号：\underline{　　　　　　}};
    \node at (0.48,-0.2)
      {实验类型：\underline{　　  实训实验　　　　　}};
    \draw (8.45,1.2) rectangle (14.75,-0.8);
    \draw (8.45,0.6) -- (14.75,0.6);
    \draw (9.9,1.2) rectangle (9.9,-0.8);
    \draw (12.5,1.2) rectangle (12.5,-0.8);
    \node[above] at (9.175,0.7){得分};
    \node[above] at (11.175,0.7){教师签名};
    \node[above] at (13.625,0.7){批改日期};
    \filldraw[white] (12.9, -4) rectangle  (21, -20);
  \end{tikzpicture}
  \begin{tikzpicture}[remember picture, overlay, inner sep=0pt,every node/.style={font=\fontsize{14}{14}\selectfont\bfseries}]
    \node[above] at (8.5,-7.9){\phyExpName};
    \node[above] at (8.5,-10.0)
      {高等研究院};
    \node[above] at (11,-12.1)
      {}; % 指导教师
    \node[above] at (5.75,-14.2)
      {}; % 姓名
    \node[above] at (11,-14.2)
      {}; % 学号
    \node[above] at (4.87,-12.1)
      {}; % 组号
    % \node[above] at (5.75,-16.3){\phyExpAddr};
    \node[above] at (5.75,-16.3){致原楼};
    \node[above, font=\fontsize{23}{20}] at (7.13,-3.33)
      {深　圳　大　学　实　验　报　告};
    \node[right] at (1.8,-5.6)
      {课程名称：\underline{\qquad\qquad\quad 大学物理实验（三）\quad\qquad\qquad}};
    \node[right] at (1.8,-7.7)
      {实验名称：\underline{　　　　　　　　　　　　　　　　　　}};
    \node[right] at (1.8,-9.8)
      {学　　院：\underline{　　　　　　　　　　　　　　　　　　}};
    \node[right] at (1.8,-11.9)
      {组号：\rule[-5pt]{3.72cm}{1pt}指导教师：\rule[-5pt]{3.7cm}{1pt}};
    \node[right] at (1.8,-14.0)
      {报告人：\rule[-5pt]{4cm}{1pt}学号：\rule[-5pt]{4.4cm}{1pt}};
    \node[right] at (1.8,-16.1)
      {实验地点：\underline{　　　　　　}};
    \node[right] at (1.8,-18)
      {实验时间：\underline{\qquad\quad\syear\qquad}年\underline{\quad\smonth\quad}月\underline{\quad\sday\quad}日};
    \node[right] at (1.8,-20.1)
      {提交时间：\underline{\qquad\quad\fyear\qquad}年\underline{\quad\fmonth\quad}月\underline{\quad\fday\quad}日};
  \end{tikzpicture}
  \newpage
  \fancypage{\fbox}{} % 绘制实验报告边框
}
% 分割节 section
\NewDocumentCommand\longLine{}{
  \par
  \begin{tikzpicture}[overlay]
    \draw (-0.85, -0.65) -- (15.29, -0.65);
  \end{tikzpicture}
}
% 绘制实验报告结束部分教师评价和打分表
\NewDocumentCommand\endBox{}{
  \longLine
  \section*{指导教师批阅意见}
    \quad\\[2cm]
    \longLine
    \section*{成绩评定}
    \begin{table}[h]
      \begin{tabular}{|l|l|l|l|}
        \hline
        \begin{tabular}[c]{@{}l@{}}实验设计方案\\ （40分）\end{tabular} & \begin{tabular}[c]{@{}l@{}}实验过程与数据记录\\ （30分）\end{tabular} & \begin{tabular}[c]{@{}l@{}}数据处理与结果陈述\\ （30分）\end{tabular} & 总分 \\ \hline
        \begin{tabular}[c]{@{}l@{}}　\\　\end{tabular} & & & \\ \hline
      \end{tabular}
    \end{table}
}