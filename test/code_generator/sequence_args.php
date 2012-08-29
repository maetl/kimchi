<?php

class SequenceWithArguments
{

	public function basicMethodFunction()
	{
		$this->callInternalProcess();
		$this->canCheckInteger(200);
		$this->canCheckString("hello");
		$this->canCheckMultipleArgs(404, "not found");
	}

}