{% macro union_all_stg_tables() %}
    {% set models_to_union = [] %}
    
    {% for node in graph.nodes.values() %}
        {% if node.resource_type == 'model' and node.config.schema == 'staging' and node.name.startswith('stg_log') %}
            {% do models_to_union.append(node.name) %}
        {% endif %}
    {% endfor %}

    {% for model in models_to_union %}
        SELECT * FROM {{ ref(model) }}
        
        {% if not loop.last %}
        UNION ALL
        {% endif %}
    {% endfor %}

    {% if models_to_union | length == 0 %}
    SELECT NULL AS placeholder_col WHERE 1=0
    {% endif %}
{% endmacro %}




-- function unionAllStgTables(graph, refFormatter = name => `{{ ref('${name}') }}`) {
--   if (!graph || !graph.nodes) {
--     throw new Error('graph with nodes is required');
--   }

--   // Collect candidate models
--   const modelsToUnion = Object.values(graph.nodes)
--     .filter(node =>
--       node &&
--       node.resource_type === 'model' &&
--       node.config &&
--       node.config.schema === 'staging' &&
--       typeof node.name === 'string' &&
--       node.name.startsWith('stg_log')
--     )
--     .map(node => node.name);

--   // If none found, return the placeholder no-rows SQL (same as your macro)
--   if (modelsToUnion.length === 0) {
--     return 'SELECT NULL AS placeholder_col WHERE 1=0';
--   }

--   // Build the SQL blocks and join with UNION ALL
--   const blocks = modelsToUnion.map(name => `SELECT * FROM ${refFormatter(name)}`);
--   return blocks.join('\n\nUNION ALL\n\n');
-- }

-- /* ---------------------------
--    Example usage
--    --------------------------- */
-- const exampleGraph = {
--   nodes: {
--     a: { resource_type: 'model', config: { schema: 'staging' }, name: 'stg_log_events' },
--     b: { resource_type: 'model', config: { schema: 'staging' }, name: 'stg_log_users' },
--     c: { resource_type: 'model', config: { schema: 'analytics' }, name: 'analytics_events' },
--   }
-- };


