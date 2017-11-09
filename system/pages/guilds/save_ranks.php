<?php
/**
 * Save ranks
 *
 * @package   MyAAC
 * @author    Gesior <jerzyskalski@wp.pl>
 * @author    Slawkens <slawkens@gmail.com>
 * @copyright 2017 MyAAC
 * @link      http://my-aac.org
 */
defined('MYAAC') or die('Direct access not allowed!');

$guild_name = $_REQUEST['guild'];
if(!Validator::guildName($guild_name)) {
	$errors[] = Validator::get;
}

if(empty($errors)) {
	$guild = $ots->createObject('Guild');
	$guild->find($guild_name);
	if(!$guild->isLoaded()) {
		$errors[] = 'Guild with name <b>'.$guild_name.'</b> doesn\'t exist.';
	}
}

if(empty($errors)) {
	if($logged) {
		$guild_leader_char = $guild->getOwner();
		$rank_list = $guild->getGuildRanksList();
		$rank_list->orderBy('level', POT::ORDER_DESC);
		$guild_leader = false;
		$account_players = $account_logged->getPlayers();
		
		foreach($account_players as $player) {
			if($guild_leader_char->getId() == $player->getId()) {
				$guild_vice = true;
				$guild_leader = true;
				$level_in_guild = 3;
			}
		}
		
		if($guild_leader) {
			foreach($rank_list as $rank) {
				$rank_id = $rank->getId();
				$name = $_REQUEST[$rank_id.'_name'];
				$level = (int) $_REQUEST[$rank_id.'_level'];
				if(Validator::rankName($name)) {
					$rank->setName($name);
				}
				else {
					$errors[] = 'Invalid rank name. Please use only a-Z, 0-9 and spaces. Rank ID <b>'.$rank_id.'</b>.';
				}
				if($level > 0 && $level < 4) {
					$rank->setLevel($level);
				}
				else {
					$errors[] = 'Invalid rank level. Contact with admin. Rank ID <b>'.$rank_id.'</b>.';
				}
				
				$rank->save();
			}
			//show errors or redirect
			if(!empty($errors)) {
				echo $twig->render('error_box.html.twig', array('errors' => $errors));
			}
			else
			{
				header("Location: ?subtopic=guilds&action=manager&guild=".$guild->getName());
			}
		}
		else
		{
			$errors[] = 'You are not a leader of guild!';
		}
	}
	else
	{
		$errors[] = 'You are not logged. You can\'t manage guild.';
	}
}
if(!empty($errors)) {
	echo $twig->render('error_box.html.twig', array('errors' => $errors));
}

?>