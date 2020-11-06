<?php

use think\migration\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run Method.
     *
     * Write your database seeder using this method.
     *
     * More information on writing seeders is available here:
     * http://docs.phinx.org/en/latest/seeding.html
     */
    public function run()
    {
        $data = [
            'username' => 'super',
            'admin' => 2,
            'active' => 1,
            'email' => '376767089@qq.com',
            'group_id' => null,
            'password' => md5('yuxiang'),
            'create_time' => date('Y-m-d H:i:s', time()),
            'update_time' => date('Y-m-d H:i:s', time())
        ];
        $this->table('lin_user')->insert($data)->save();

    }
}