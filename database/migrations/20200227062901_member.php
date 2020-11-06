<?php

use think\migration\Migrator;
use think\migration\db\Column;

class Member extends Migrator
{
    /**
     * Change Method.
     *
     * Write your reversible migrations using this method.
     *
     * More information on writing migrations is available here:
     * http://docs.phinx.org/en/latest/migrations.html#the-abstractmigration-class
     *
     * The following commands can be used in this method and Phinx will
     * automatically reverse them when rolling back:
     *
     *    createTable
     *    renameTable
     *    addColumn
     *    renameColumn
     *    addIndex
     *    addForeignKey
     *
     * Remember to call "create()" or "update()" and NOT "save()" when working
     * with the Table class.
     */
    public function change()
    {
        $table = $this->table('member', array('engine' => 'InnoDB'));
        $table->addColumn('nick_name', 'string', array('limit' => 30,'default'=>'','comment'=>'用户昵称'))
            ->addColumn('minipro_openid','string',array('limit' => 150,'default'=>'','comment'=>'小程序openid'))
            ->addColumn('mp_openid','string',array('limit' => 150,'default'=>'','comment'=>'公众号openid'))
            ->addColumn('mobile', 'string', array('limit' => 11,'default'=>'','comment'=>'手机号'))
            ->addColumn('is_parent','boolean',array('limit'=>1,'default'=>0,'comment'=>'是否家长'))
            ->addTimestamps('create_time', 'update_time')
            ->addSoftDelete()
            ->addIndex(array('nick_name','mobile'))
            ->create();
    }
}
