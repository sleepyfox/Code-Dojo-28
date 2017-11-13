"A test suite for a Three Men's Morris game"

import unittest

class Game():
    def thing(self):
        return False


class ThreeMensMorrisTests(unittest.TestCase):
    def test_thing(self):
        "test thing is True"
        self.game = Game()
        self.assertTrue(self.game.thing())
        
if __name__ == "__main__":
    unittest.main()
