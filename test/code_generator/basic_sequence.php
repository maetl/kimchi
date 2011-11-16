<?php

class BasicMethodSequence
{

	public function basicMethodFunction()
	{
		$this->callInternalProcess();
		$this->assertCanDoSomething();
		$this->assertCanDoAnotherThing();
	}

}