met_palettes <- list(
 kill = c("#da8186","#d50d0a","#8F0106","#474747","#370c0a", "#050404","#000000"),
 kill10 = c("#000000", "#E4E6D8", "#A8A8A8", "#CE0000", "#FF0204",
            "#7D0109", "#DCFFFE", "#EEE2E4", "#E9ACA7", "#F83634"),
 lightning = c("#a9aec0","#869CCB","#8294b7","#39497d","#232455", "#0f0d1e","#000000"),
 lightning10 = c("#030305", "#1D1638", "#090712", "#1E183C", "#FBFFFF",
                 "#20255F", "#233776", "#3A5A93", "#9CAAC7", "#6A84B7"),
 puppets = c("#c3ae95","#9c9996","#D28E01","#b3480a","#582017", "#8C031F","#000000"),
 puppets10 = c("#000000", "#FFFFFF", "#8C031F", "#CDC6B3", "#330B09",
               "#9895A0", "#AD4000", "#55311B", "#6F6F6F", "#9D8D74"),
 justice = c("#9E9987","#e3e3d1","#33454D","#628c94","#3d4645", "#868d7e","#919c9b"),
 justice10 = c("#FFFFEC", "#F3F2DE", "#D7D9CC", "#000200", "#D2D4C7", 
               "#BDBEB0", "#A1A7A3", "#7E8985", "#535E5A", "#2B3F46"),
 metallica = c("#515659","#1b2423","#0b1413","#181b1d","#040404", "#050404","#000000"),
 metallica10 = c("#000000", "#000002", "#030303", "#050608", "#1D2122",
                 "#1E2223", "#0B0B0B", "#111516", "#303136", "#484F55"),
 load = c("#AEAEAE","#ddcbbd","#a1a09f","#de5646","#934841", "#0f0c0c","#000000"),
 load10 = c("#000000", "#101010", "#B1B1B1", "#FFFFFF", "#717171", 
            "#393939", "#B30020", "#FF5C4E", "#ED4D3F", "#E89466"),
 reload = c("#080606","#484848","#9d9c9c","#f0c43e","#fba104", "#e43609","#AD0215"),
 reload10 = c("#000000", "#A8A8A8", "#AE0115", "#FFFFFF", "#FDC101", 
              "#FD8900", "#808080", "#CF0010", "#FA4500", "#2D1219"),
 anger = c("#8E837F","#d5ada2","#782920","#f24108","#e4041f","#240b0a", "#000000"),
 anger10 = c("#E3001E", "#FE4002", "#000600", "#E70024", "#F3ABB9", 
             "#1B0000", "#FF0025", "#4B0000", "#882600", "#AE3000"),
 magnetic = c("#2d2520","#e8e6e4","#837F7C","#625c58","#7f7c7a","#9a9693", "#000000"),
 magnetic10 = c("#FFFFFD", "#030000", "#F3F2F0", "#E0DCD9", "#231C16",
                "#B9B5B2", "#9C9895", "#8D8986", "#54504D", "#484441"),
 hardwired = c("#C8C8C8","#61a28b","#e7cd9b","#7E4611","#a93119", "#2c2625","#000000"),
 hardwired10 = c("#FFFFFF", "#000000", "#440000", "#353535", "#ACACAC" ,
              "#7B0000", "#585858" , "#6D450A" ,"#C19824", "#C05A41"),
 combo = c("#9a9693","#e3e3d1", "#a9aec0", "#39497d", "#61a28b",
           "#fba104", "#f24108", "#582017", "#8C031F", "#000000"),
 
 whiplash = c("#E10A07", "#D4D3C3", "#070505","#443C2C"),
 bells = c("#171732", "#B0B4C8", "#8394BA","#5F74A6"),
 orion = c("#381712", "#C4A88B", "#9B9A97","#92818D"),
 blackened = c("#D6D8C7", "#363F3E", "#6D6B66","#6E7A4A"),
 roam = c("#040405", "#242C2C", "#2C2C2C","#4C4C54"),
 bleeding = c("#2D1917", "#E16A5C", "#A9A9A8","#948494"),
 fuel = c("#090707", "#E5590B", "#ABA7A7","#ECD492"),
 frantic = c("#1D0A09", "#DD2414", "#D3B1A2","#928281"),
 scarred = c("#CBC9C7", "#251E19", "#554D48","#686661"),
 revenge = c("#372421", "#E2B29B", "#7CA896","#6C8C8C")
 
 )


#' Color Palettes based on Metallica album covers
#'
#' R package that contains color palettes based on colours on Metallica studio album covers.
#' 
#' Yep, even the black album.
#'
#' This package is based on the nycpalettes package: https://github.com/kellycotton/nycpalettes
#'
#' @param name Name of palette. Select one:
#' \code{kill}, \code{kill10}, \code{lightning}, \code{lightning10}, 
#' \code{puppets}, \code{puppets10},\code{justice}, \code{justice10},
#' \code{metallica}, \code{metallica10}, \code{load},\code{load10},
#' \code{reload}, \code{reload10}, \code{anger}, \code{anger10}, 
#' \code{magnetic}, \code{magnetic10}, \code{hardwired}, \code{hardwired10}, 
#' \code{combo}
#'
#' @param n Number of colors desired. 
#' 
#' Some palettes contain 7 colors which were picked 'by hand'
#' The \code{combo} palette and those ending with '10' have 10 colours.
#' Apart from \code{combo} palette, these were produced with the
#' aid of the \code{colorfindr} package :
#' https://CRAN.R-project.org/package=colorfindr
#'
#' @param type Either continuous or discrete.
#'
#' @return A vector of colors.
#' @export
#'
#' @examples
#' metalli_palette("anger")
#'
metalli_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  
  pal <- met_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found")
  
  if (missing(n)) {
    n = length(pal)
  }
  
  if (type == "discrete" && n > length(pal)) {
    stop(paste("You have requested", n, "colors, but this palette only contains", length(pal), "colors."))
  }
  
  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))
  
  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  rect(0, 0.95, n + 1, 1.05, col = rgb(1, 1, 1, 0.7), border = NA)
  text((n + 1) / 2, 1, labels = attr(x,"name"), cex = 1, family = "serif")
  for (i in 1:n) {
    rect(i - .5, .65, i + .5, .75, col = rgb(1, 1, 1, 0.7), border = NA)
    text(i, .7, labels = x[i], cex = 1, family = "serif")
  }
}
