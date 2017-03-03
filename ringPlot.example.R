## Pac-Man example for the ring plot.

source('ringPlot.R');
graphics.off();
par(cex = 1, mar=c(4, 4, 1, 1));
plot(1:10, asp=1);
ringPlot(x = 2, y = 2, r1 = 0, r2 = 2, angle1 = pi / 4 + pi /  6, angle2 = 2 * pi + pi / 4 - pi / 6, col="orange", new.plot = F);

dev.new();
#svg(filename="example.svg", width = 28, height = 10); 
par(cex = 3, mar=c(0, 0, 0, 0));
plot(x=c(-3.5, 3.5), y = c(-1.5, 1), asp=1, type="n", axes = F);
ringPlot(v = c(0.38, 0.62), col=c('#9a12b3', '#bfbfbf80'), x = 0, y = 0, r1 = 0.7, r2 = 1, asp = 1, xlab="", ylab="", n = 50, axes = F, caption = "38%", captionColor="#404040", new.plot = F);
ringPlot(v = c(0.71, 0.29), col=c('#16a085', '#bfbfbf80'), x = -2.25, y = 0, r1 = 0.7, r2 = 1, asp = 1, xlab="", ylab="", n = 50, axes = F, caption = "71%", captionColor="#404040", new.plot = F);
ringPlot(v = c(0.44, 0.56), col=c('#22a7f0', '#bfbfbf80'), x = 2.25, y = 0, r1 = 0.7, r2 = 1, asp = 1, xlab="", ylab="", n = 50, axes = F, caption = "44%", captionColor="#404040", new.plot = F);
par(cex = 1, mar=c(0, 0, 0, 0));
text(x = -2.25, y = -1.25, labels = "Sales goals");
text(x = 0, y = -1.25, labels = "Tasks");
text(x = 2.25, y = -1.25, labels = "This week");
#dev.off();