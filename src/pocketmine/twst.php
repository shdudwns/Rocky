	public function about(){
		$string = '

 §bRocky§b is a custom version of §bpmmp§b, modified by §bRockySoftware-eng§b
 Version §b §b$version §bCodename §b$code
 §bTarget client version §b$mcpe §bProtocol §b$protocol §b
 §bSource code §bhttps://github.com/RockyTeam-eng/Rocky§b
	';
	
		$this->getLogger()->info($string);
	}