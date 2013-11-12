<div class="multiple-choice-question">
  <div class="row">
    <div class="mcq-nerd-image large-12 columns">
      <img class="mcq-gravatar" {{bindAttr src="answerImage"}} />
    </div>
  </div>

  {{#each pair in answerChoices}}
    <div class="row multiple-choice-question-nerd-answers">
      <div class="columns large-8 large-centered">
        <div class="row">

          {{#each nerd in pair}}
            <div class="columns large-6">
              <a href="#" class="button mcq-answer centered-text">
                {{nerd.name}}
              </a>
            </div>
          {{/each}}
        </div>
      </div>
    </div>
  {{/each}}
</div>
