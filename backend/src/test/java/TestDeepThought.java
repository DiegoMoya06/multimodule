import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class TestDeepThought {

  @Test
  @DisplayName("Test the answer to everything")
  void testAnswerToAll(){
    DeepThought computer = new DeepThought();
    assertThat(computer.getAnswerToEverything()).isEqualTo(5);
  }

  static class DeepThought{

    DeepThought(){
      answerToEverything = 5;
    }
    private int answerToEverything;

    public int getAnswerToEverything() {
      return answerToEverything;
    }
  }
}
