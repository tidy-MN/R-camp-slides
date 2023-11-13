
<ul class="nav nav-pills" id="myTab" role="tablist" style="margin-top: 18px;">
<li class="nav-item active">
<a class="nav-link" id="monsters-tab" data-toggle="tab" href="#monsters" role="tab" aria-controls="monsters" aria-selected="true"> `monsters` </a>
</li>
<li class="nav-item">
<a class="nav-link" id="filter3-tab" data-toggle="tab" href="#filter3" role="tab" aria-controls="filter3" aria-selected="false"> `filter`</a>
</li>
<li class="nav-item">
<a class="nav-link" id="select-tab" data-toggle="tab" href="#select" role="tab" aria-controls="select" aria-selected="false"> `select` </a>
</li>
<li class="nav-item">
<a class="nav-link" id="arrange-tab" data-toggle="tab" href="#arrange" role="tab" aria-controls="arrange" aria-selected="false"> `arrange`</a>
</li>
<li class="nav-item">
<a class="nav-link" id="mutate3-tab" data-toggle="tab" href="#mutate3" role="tab" aria-controls="mutate3" aria-selected="false"> `mutate`</a>
</li>
</ul>

<div class="well tab-content monsters" id="myTabContent" style="background-color: white;">
<div class="tab-pane fade active in" id="monsters" role="tabpanel" aria-labelledby="monsters-tab">

![](images/monster_data.png){style="width: 85%;"}

<br><br>

</div>

<div class="tab-pane fade" id="filter3" role="tabpanel" aria-labelledby="filter3-tab">

<p>
Filter with a single condition / test
</p>

![](images/filter_monsters.png){style="width: 95%; margin-top: 12px;"}


<p style="margin-top: 20px;">
Filter with multiple conditions / tests
</p>

![](images/filter_monsters_multiple.png){style="width: 95%;"}
<br><br>
</div>


<div class="tab-pane fade" id="select" role="tabpanel" aria-labelledby="select-tab">

![](images/select_monsters.png){style="width: 90%;"}

<br><br>
![](images/select_monsters_drop.png){style="width: 82%;"}
<br><br>

</div>

<div class="tab-pane fade" id="arrange" role="tabpanel" aria-labelledby="arrange-tab">

![](images/arrange_monsters.png){style="width: 98%; margin-top: 12px;"}

<br><br>
![](images/arrange_monsters_desc.png){style="width: 98%;"}
<br><br>

</div>


<div class="tab-pane fade" id="mutate3" role="tabpanel" aria-labelledby="mutate3-tab">

![](images/mutate_monsters_new.png){style="width: 98%; margin-top: 12px;"}

<br><br>

![](images/mutate_monsters_update.png){style="width: 98%;"}
<br><br>

</div>
</div>

<details style="margin-top: 32px;">
<summary class="btn_code"><i> Show the R code</i></summary>
<p>

```{r, eval=F}
# Create monsters
monsters <- data.frame(id = 1:5,
                       color = c("pink", "green",  "pink", "green", "green"),
                       age = c(8,2,7,3,1),
                       hat = c(T,T,F,T,F) )

# Filter ----

## Single condition/test
monsters %>% filter(color == "pink")

## Multiple conditions
monsters %>% filter(color == "pink", age > 7)


# Select ----

## Keep only 2 columns
monsters %>% select(id, age)

## Drop columns with a '-' in front
monsters %>% select(-hat)


# Arrange ----

## From low to high
monsters %>% arrange(age)

## Descend from high to low
monsters %>% arrange(desc(age))


# Mutate ----

## Create a new column
monsters %>% mutate(is_baby = age < 3)

## Update an existing column
monsters %>% mutate(age = age + 2)

```
</p>
</details>

