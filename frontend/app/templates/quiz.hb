<div class="multiple-choice-question">
  <div class="units-row">
    <div class="multiple-choice-question-nerd-image unit-centered unit-40">
      <img class="gravatar" {{bindAttr src="answerImage"}} />
    </div>
  </div>

  {{#each pair in answerChoices}}
    <div class="units-row multiple-choice-question-nerd-answers">
      {{#each nerd in pair}}
      <div class="unit-centered unit-60">
        <a href="#" class="btn answer-centered unit-50">
            {{nerd.name}}
          </a>
        </div>
      {{/each}}
    </div>
  {{/each}}
</div>
