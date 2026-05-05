{
  driver: {
    cpp: 'generate_layers',
    layers: {
      event: { parent: 'job', total: 100, starting_number: 0 },
    },
  },
  sources: {
    form_standard_and_offset_source: {
      cpp: 'form_source',
      input_file: 'form_gaussian_write_test.root',
      creator: 'add_standard_and_offset_wires',
      products: ['sums'],
    },
    form_standard_and_wider_source: {
      cpp: 'form_source',
      input_file: 'form_gaussian_write_test.root',
      creator: 'add_standard_and_wider_wires',
      products: ['sums'],
    },
  },
  modules: {
    add_sums_of_wires: {
      cpp: 'generate_vector',
      lhs_creator: 'add_standard_and_offset_wires',
      rhs_creator: 'add_standard_and_wider_wires',
    },
    output: {
      cpp: 'form_module',
      output_file: 'form_gaussian_read_test.root',
      products: ['sums'],
    },
  },
}
