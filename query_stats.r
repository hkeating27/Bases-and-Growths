library(DBI)
library(RSQLite)
library(ggplot2)

# Connect to the database
# TODO: make this a server anyone can access
con <- dbConnect(SQLite(), "characters.db")

# Stat progression for each character levels 1-40
get_stat_progression <- function(name) {
    # Check if character exists
    query <- paste0("SELECT name FROM characters WHERE name = '", name, "'")
    character <- dbGetQuery(con, query)
    
    if (nrow(character) == 0) {
        stop("Character not found.")
    }
    
    # Query the specific character's stats table
    stats_query <- paste0("SELECT * FROM stats_", name, " WHERE level = 1")  # Get base stats from level 1
    base_stats <- dbGetQuery(con, stats_query)
    
    if (nrow(base_stats) == 0) {
        stop("No data found for character.")
    }
    
    # Generate all levels from 1 to 40 dynamically
    levels <- 1:40
    
    # Compute total stats for each level using the base + growth*level formula
    total <- base_stats$base_hp + levels * base_stats$hp_growth +
             base_stats$base_strength + levels * base_stats$strength_growth +
             base_stats$base_magic + levels * base_stats$magic_growth +
             base_stats$base_skill + levels * base_stats$skill_growth +
             base_stats$base_speed + levels * base_stats$speed_growth +
             base_stats$base_luck + levels * base_stats$luck_growth +
             base_stats$base_defense + levels * base_stats$defense_growth +
             base_stats$base_resistance + levels * base_stats$resistance_growth
    
    data.frame(level = levels, Total = total, Character = name)
}

# User input
characters <- c("Astrid", "Rolf")

# Get data
data_list <- lapply(characters, get_stat_progression)
plot_data <- do.call(rbind, data_list)

# Make the plot graph
ggplot(plot_data, aes(x = level, y = Total, color = Character)) +
    geom_line(size = 1) +
    labs(title = "Total Stat Progression (Including HP)", x = "Level", y = "Total Stats") +
    scale_y_continuous(limits = c(0, max(plot_data$Total)), breaks = seq(0, max(plot_data$Total), by = 10)) +
    scale_x_continuous(breaks = seq(1, 40, by = 1)) + # Ensures X-axis shows only whole numbers from 1 to 40
    theme_minimal()
	
# Close database connection
dbDisconnect(con)