/*
  Copyright (C) 2012 John McCutchan <john@johnmccutchan.com>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

part of game_loop;

class GameLoopPointerLock {
  final GameLoop gameLoop;

  GameLoopPointerLock(this.gameLoop) {
    gameLoop.element.on.click.add(_onClick);
    document.on.pointerLockChange.add(_onPointerLockChange);
  }

  void requestLock() {
    gameLoop.element.webkitRequestPointerLock();
  }

  void _onClick(Event event) {
    if (lockOnClick) {
      requestLock();
    }
  }

  // Does clicking on the element trigger a pointer lock?
  bool lockOnClick = true;

  bool get locked => document.webkitPointerLockElement == gameLoop.element;

  void _onPointerLockChange(Event event) {
    if (gameLoop.onPointerLockChange != null) {
      gameLoop.onPointerLockChange(gameLoop);
    }
  }
}