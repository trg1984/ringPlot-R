require('plotrix');

ringPlot <- function(v = NULL, x = 0, y = 0, r1 = 0.7, r2 = 1, angle1 = 0, angle2 = 1, col = "black", n = 50, new.plot = T, ..., caption = NULL, captionColor = 'black') {
	if (new.plot) {
		plot(
			x = c(x - max(abs(r1), abs(r2)), x + max(abs(r1), abs(r2))),
			y = c(y - max(abs(r1), abs(r2)), y + max(abs(r1), abs(r2))),
			type = "n",
			...
		);
	}

	if (is.null(v)) {
	
		innerX <- c();
		outerX <- c();
		innerY <- c();
		outerY <- c();
		
		for ( i in 0:(n - 1) ) {
			t0 <- i / n * (angle2 - angle1) + angle1;
			t1 <- (i + 1) / n * (angle2 - angle1) + angle1;
			
			x1 <- x + r1 * cos(t0);
			x2 <- x + r2 * cos(t0);
			x4 <- x + r1 * cos(t1);
			x3 <- x + r2 * cos(t1);
			
			y1 <- y + r1 * sin(t0);
			y2 <- y + r2 * sin(t0);
			y4 <- y + r1 * sin(t1);
			y3 <- y + r2 * sin(t1);
			
			innerX <- c(innerX, x1, x4);
			outerX <- c(outerX, x2, x3);
			
			innerY <- c(innerY, y1, y4);
			outerY <- c(outerY, y2, y3);
		}
		
		polygon(c(innerX, outerX[length(outerX):1]), c(innerY, outerY[length(outerY):1]), col = col, border = NA);
		
		if (!is.null(caption)) {
			text(labels = caption, x = x, y = y, col = captionColor);
		}
	} else {
		total <- sum(v, na.rm = T);
		alpha0 <- 0;
		for (i in 1:length(v)) {
			alpha1 <- v[i] / total * 2 * pi;
			ringPlot(x = x, y = y, r1 = r1, r2 = r2, angle1 = alpha0, angle2 = alpha0 + alpha1, col = col[(i - 1) %% length(col) + 1], n = n, new.plot = F, caption = caption, captionColor = captionColor);
			alpha0 <- alpha0 + alpha1;
		}
	}
}
