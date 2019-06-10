<?php namespace Controllers;

use System\Core\Controller;
use Models\Measure;
use Models\Entry;

class MeasureController extends Controller {

    public function index(){}

    public function update($entry_id = null)
    {
        $model_entry = new Entry;
        if( ! $entry = $model_entry->find($entry_id) )
            return back();

        $model = new Measure;
        $measures_stored = $model->where('entrada_id', '=', $entry->id);
        $measures_entry = $this->getMeasuresEntryArray($measures_stored);

        $updated_fails = [];
        $measures_posts = $this->request->all();
        foreach($measures_posts as $stage => $measures_post)
        {   
            if( ! $this->validateToUpdate($measures_entry[ $stage ], $measures_post) ) continue;

            $data = [
                'peso'           => $measures_post['peso'],
                'medida_peso'    => $measures_post['medida_peso'],
                'ancho'          => $measures_post['ancho'],
                'altura'         => $measures_post['altura'],
                'profundidad'    => $measures_post['profundidad'],
                'medida_volumen' => $measures_post['medida_volumen'],
                'actualizado_by' => session_get('user','id'),
            ];

            if( ! $model->update($data, $measures_post['id']) )
            {
                $stage_fail = str_replace('_', ' ', $measures_post['etapa']);
                array_push($updated_fails, $stage_fail);
            }
        }

        $msg = count($updated_fails) === 0
            ? ['success', 'Medidas actualizadas']
            : ['warning', 'Algunas medidas no se actualizaron: '.implode(', ', $updated_fails)];
        $this->message($msg);
        return back();
    }

    private function getMeasuresEntryArray($measures)
    {
        $array = [];
        foreach($measures as $m)
        {
            $array[ $m->etapa ] = [
                'peso'           => $m->peso,
                'medida_peso'    => $m->medida_peso,
                'ancho'          => $m->ancho,
                'altura'         => $m->altura,
                'profundidad'    => $m->profundidad,
                'medida_volumen' => $m->medida_volumen,
            ];
        }
        return $array;
    }

    private function validateToUpdate($measures_stage, $measures_post)
    {
        if( $measures_post['peso'] + $measures_post['ancho'] + $measures_post['altura'] + $measures_post['profundidad'] == 0 )
            return false;
        
        return $measures_stage['peso']           <> $measures_post['peso']
            || $measures_stage['medida_peso']    <> $measures_post['medida_peso']
            || $measures_stage['ancho']          <> $measures_post['ancho']
            || $measures_stage['altura']         <> $measures_post['altura']
            || $measures_stage['profundidad']    <> $measures_post['profundidad']
            || $measures_stage['medida_volumen'] <> $measures_post['medida_volumen'];
    }
}