### Agriculture Victoria branding ggplot2 theme

# Loads font VIC, plot headings in AgVic green, plot theme "nice". For more information on branding guidelines check intranet here: 
# https://intranet.djpr.vic.gov.au/policies-forms-and-templates/agriculture-victoria-entity-brand-style-guide-and-templates

# using this theme will require the download and installation of font family "VIC", more information here: https://www.vic.gov.au/brand-victoria-fonts


#load dependencies
library(extrafont)
library(ggplot2)
library(jtools)
loadfonts("win")


## change global theme settings (for all following plots)
theme_set(theme_nice(base_size= 12, base_family= "VIC"))


## modify plot elements globally (for all following plots)
theme_update(
  axis.ticks= element_line(color = "grey92"),
  axis.ticks.length= unit(.5, "lines"),
  panel.grid.minor= element_blank(),
  legend.title= element_text(size = 12, color = "grey30"), 
  legend.text= element_text(color = "grey30"),
  plot.title= element_text(hjust = 0, size = 18, face = "bold", color = '#00573F'),
  plot.subtitle= element_text(size = 11, color = "grey30"),
  plot.caption= element_text(size = 9, margin = margin(t = 15)), 
  plot.margin= margin(25, 25, 10, 25), 
  plot.title.position= 'plot', plot.caption.position= 'plot'
)

## example plot
box <- ggplot(data=iris, aes(x=Species, y=Sepal.Length))
box + geom_boxplot(aes(fill=Species)) + 
  ylab("Sepal Length") + ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4) +
  labs(    caption = "Agriculture Victoria ggplot2 theme")



## AgVic HEX colour codes.
# Ag Vic Greens: 67823A, 698749, 759157
# Supporting greens: 00573F, 4A773C, 719949, 7A9A01
# Supporting greys: 53565A, BBBCBC


agvic_colours <- c("#67823A", "#698749", "#759157", "#00573F", "#4A773C", "#719949", "#7A9A01", "#53565A", "#BBBCBC")

agvic <- data.frame(agvic_colours)

pallette <- qplot(x=1:nrow(agvic), y = 1, fill=factor(1:nrow(agvic)), geom="tile") +
  scale_fill_manual(values = agvic_colours) +
  theme_void()+
  theme(legend.position="none")
