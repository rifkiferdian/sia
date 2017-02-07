<?php

class RefOption extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $nama;

    /**
     *
     * @var string
     */
    public $opsi;

    /**
     *
     * @var string
     */
    public $aktif;

    /**
     *
     * @var string
     */
    public $hapus;
 

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'ref_option';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return RefOption[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return RefOption
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
