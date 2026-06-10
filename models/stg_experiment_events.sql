{{ config(materialized='view') }}

with simulated_experiment_data as (
    -- This sets up clean baseline columns for your Product Experimentation Pipeline
    select 
        1 as event_id,
        101 as user_id,
        'new_checkout_flow' as experiment_name,
        'treatment' as variant_assigned,
        current_timestamp() as event_timestamp,
        1 as has_converted

    union all

    select 
        2 as event_id,
        102 as user_id,
        'new_checkout_flow' as experiment_name,
        'control' as variant_assigned,
        current_timestamp() as event_timestamp,
        0 as has_converted
)

select 
    event_id,
    user_id,
    experiment_name,
    variant_assigned,
    event_timestamp,
    has_converted
from simulated_experiment_data