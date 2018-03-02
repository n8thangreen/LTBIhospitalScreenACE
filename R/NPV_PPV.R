#' PPV
#'
#' @param sens
#' @param spec
#' @param prev
#'
#' @return
#' @export
#'
#' @examples
PPV <- function(sens,
                spec,
                prev) {

(sens*prev)/(sens*prev + (1 - spec)*(1 - prev))

}


#' NPV
#'
#' @param sens
#' @param spec
#' @param prev
#'
#' @return
#' @export
#'
#' @examples
NPV <- function(sens,
                spec,
                prev) {


(spec*(1 - prev))/((1 - sens)*prev + spec*(1 - prev))
}
