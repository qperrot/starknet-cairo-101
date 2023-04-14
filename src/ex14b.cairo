////////////////////////////////
// Exercise 14
// All in one exercise -It's your time to shine.
////////////////////////////////
// TODO (omar) - improve description
// - This exercise is a bit different from the others. It is a bit more open-ended and you will have to use your creativity to solve it.
// - Deploy a contract that validates various exercises in a single transaction to get 2 points
// - Do you want to agregate your points in a single account? Use this https://github.com/starknet-edu/points-migrator
////////////////////////////////
use starknet::ContractAddress;
use array::ArrayTrait;
use traits::Into;
use option::OptionTrait;
use traits::TryInto;
use starknet::contract_address::contract_address_try_from_felt252;

#[abi]
trait Iex01 {
    fn claim_points();
}

#[abi]
trait Iex02 {
    fn my_secret_value() -> u128;
    fn claim_points(my_value: u128);
}

#[abi]
trait Iex03 {
    fn increment_counter();
    fn decrement_counter();
    fn claim_points();
}

#[abi]
trait Iex04 {
    fn assign_user_slot();
    fn get_user_slots(account: ContractAddress) -> u128;
    fn get_values_mapped(slot: u128) -> u128;
    fn claim_points(expected_value: u128);
}

#[abi]
trait Iex05 {
    fn assign_user_slot();
    fn copy_secret_value_to_readable_mapping();
    fn get_user_slots(account: ContractAddress) -> u128;
    fn get_user_values(account: ContractAddress) -> u128;
    fn claim_points(expected_value: u128);
}

#[abi]
trait Iex06 {
    fn assign_user_slot();
    fn external_handler_for_internal_function(a_value: u128);
    fn get_user_slots(account: ContractAddress) -> u128;
    fn get_user_values(account: ContractAddress)-> u128;
    fn claim_points(expected_value: u128);
}

#[abi]
trait Iex07 {
    fn claim_points(value_a: u128, value_b: u128);
}

#[abi]
trait Iex08 {
    fn set_user_values(account: ContractAddress, values: Array::<u128>);
    fn claim_points();
}

#[abi]
trait Iex09 {
    fn claim_points(array: Array::<u128>);
}

#[abi]
trait Iex10 {
    fn get_ex10b_address() -> ContractAddress;
    fn claim_points(secret_value_i_guess: u128, next_secret_value_i_chose: u128);
}

#[abi]
trait Iex14 {
    fn claim_points();
}

#[contract]
mod Ex14b {
    ////////////////////////////////
    // Core Library imports
    // These are syscalls and functionalities that allow you to write Starknet contracts
    ////////////////////////////////
    use starknet::get_caller_address;
    use starknet::get_contract_address;
    use starknet::ContractAddress;
    use array::ArrayTrait;
    use option::OptionTrait;
    use traits::TryInto;
    use starknet::contract_address::Felt252TryIntoContractAddress;
    use starknet::contract_address::contract_address_try_from_felt252;


    ////////////////////////////////
    // Internal imports
    // These functions become part of the set of functions of the contract
    ////////////////////////////////
    use starknet_cairo_101::utils::helper::get_token_in_decimals;
    use starknet_cairo_101::utils::ex00_base::Ex00Base::tderc20_address;
    use starknet_cairo_101::utils::ex00_base::Ex00Base::distribute_points;
    use starknet_cairo_101::utils::ex00_base::Ex00Base::validate_exercise;
    use starknet_cairo_101::utils::ex00_base::Ex00Base::ex_initializer;
    use starknet_cairo_101::utils::ex00_base::Ex00Base::update_class_hash_by_admin;
    use starknet_cairo_101::token::IERC20::IERC20Dispatcher;
    use starknet_cairo_101::token::IERC20::IERC20DispatcherTrait;
    use super::Iex01Dispatcher;
    use super::Iex01DispatcherTrait;
    use super::Iex02Dispatcher;
    use super::Iex02DispatcherTrait;
    use super::Iex03Dispatcher;
    use super::Iex03DispatcherTrait;
    use super::Iex04Dispatcher;
    use super::Iex04DispatcherTrait;
    use super::Iex05Dispatcher;
    use super::Iex05DispatcherTrait;
    use super::Iex06Dispatcher;
    use super::Iex06DispatcherTrait;
    use super::Iex07Dispatcher;
    use super::Iex07DispatcherTrait;
    use super::Iex08Dispatcher;
    use super::Iex08DispatcherTrait;
    use super::Iex09Dispatcher;
    use super::Iex09DispatcherTrait;
    use super::Iex10Dispatcher;
    use super::Iex10DispatcherTrait;
    use super::Iex14Dispatcher;
    use super::Iex14DispatcherTrait;
    use starknet_cairo_101::utils::Iex10b::Iex10bDispatcher;
    use starknet_cairo_101::utils::Iex10b::Iex10bDispatcherTrait;
   
    struct Storage {
      sender_address: ContractAddress,     
    }
  
    ////////////////////////////////
    // Constructor
    // This function (indicated with #[constructor]) is called when the contract is deployed and is used to initialize the contract's state
    ////////////////////////////////
    #[constructor]
    fn constructor() {
    }

    ////////////////////////////////
    // External functions
    // These functions are callable by other contracts or external calls such as DAPP, which are indicated with #[external] (similar to "public" in Solidity)
    ////////////////////////////////
    #[external]
    fn claim_points() {
        let ex14_address = 1411009848897823750141826191293400092975117490709919388953246126411290627679;
        Iex14Dispatcher{contract_address: ex14_address.try_into().unwrap()}.claim_points();
    }

    #[external]
    fn validate_various_exercises() {
        let contract_address: ContractAddress = get_contract_address();

        let ex1_address = 1408345523887329191309781239411821629797434000000682254538718946615748726405;
        Iex01Dispatcher{contract_address: ex1_address.try_into().unwrap()}.claim_points();

        let ex2_address = 2715595573191343678794004298826256955537140993861506458690168694067275209526;
        let my_value = Iex02Dispatcher{contract_address: ex2_address.try_into().unwrap()}.my_secret_value();
        Iex02Dispatcher{contract_address: ex2_address.try_into().unwrap()}.claim_points(my_value);

        let ex3_address = 1465377168023340542907882545499624342247465940364708353312213402937067817425;
        Iex03Dispatcher{contract_address: ex3_address.try_into().unwrap()}.increment_counter();
        Iex03Dispatcher{contract_address: ex3_address.try_into().unwrap()}.increment_counter();
        Iex03Dispatcher{contract_address: ex3_address.try_into().unwrap()}.decrement_counter();
        Iex03Dispatcher{contract_address: ex3_address.try_into().unwrap()}.claim_points();

        let ex4_address = 2979765662676103700486555039332582472392294497878009479996706734967121864842;
        Iex04Dispatcher{contract_address: ex4_address.try_into().unwrap()}.assign_user_slot();
        let mut user_slots = Iex04Dispatcher{contract_address: ex4_address.try_into().unwrap()}.get_user_slots(contract_address);
        let mut value_mapped = Iex04Dispatcher{contract_address: ex4_address.try_into().unwrap()}.get_values_mapped(user_slots);
        let mut expected_value = value_mapped - 32_u128;
        Iex04Dispatcher{contract_address: ex4_address.try_into().unwrap()}.claim_points(expected_value);

        let ex5_address = 3357360549525960666209945298662518525049666553230065087248073660478049566259;
        Iex05Dispatcher{contract_address: ex5_address.try_into().unwrap()}.assign_user_slot();
        Iex05Dispatcher{contract_address: ex5_address.try_into().unwrap()}.copy_secret_value_to_readable_mapping();
        value_mapped = Iex05Dispatcher{contract_address: ex5_address.try_into().unwrap()}.get_user_values(contract_address);
        expected_value = value_mapped + 9_u128;
        Iex05Dispatcher{contract_address: ex5_address.try_into().unwrap()}.claim_points(expected_value);

        let ex6_address = 2730715159050360468015548934325978752006324086438611896731867352557696622613;
        Iex06Dispatcher{contract_address: ex6_address.try_into().unwrap()}.assign_user_slot();
        Iex06Dispatcher{contract_address: ex6_address.try_into().unwrap()}.external_handler_for_internal_function(1_u128);
        value_mapped = Iex06Dispatcher{contract_address: ex6_address.try_into().unwrap()}.get_user_values(contract_address);
        Iex06Dispatcher{contract_address: ex6_address.try_into().unwrap()}.claim_points(value_mapped);

        let ex7_address = 170176612896611472084981501849820261947717125407637845558089744216943394032;
        Iex07Dispatcher{contract_address: ex7_address.try_into().unwrap()}.claim_points(69_u128, 0_u128);

        let ex8_address = 870272904618812841070019297600294417855522962939128016030209383902687551658;
        let mut arr = ArrayTrait::new();
        arr.append(0_u128);
        arr.append(1_u128);
        arr.append(2_u128);
        arr.append(3_u128);
        arr.append(4_u128);
        arr.append(5_u128);
        arr.append(6_u128);
        arr.append(7_u128);
        arr.append(8_u128);
        arr.append(9_u128);
        arr.append(10_u128);
        Iex08Dispatcher{contract_address: ex8_address.try_into().unwrap()}.set_user_values(contract_address, arr);
        Iex08Dispatcher{contract_address: ex8_address.try_into().unwrap()}.claim_points();

        let ex9_address = 2366848790905169919855424476738546392940371714704925039203561749175273135708;
        let mut arr2 = ArrayTrait::new();
        arr2.append(20_u128);
        arr2.append(10_u128);
        arr2.append(10_u128);
        arr2.append(10_u128);
        Iex09Dispatcher{contract_address: ex9_address.try_into().unwrap()}.claim_points(arr2);

        let ex10_address = 3342713030269991040584484223265528139924454971606731554726983918040612468448;
        let ex10b_address = Iex10Dispatcher{contract_address: ex10_address.try_into().unwrap()}.get_ex10b_address();
        let secret_value = Iex10bDispatcher{contract_address: ex10b_address}.get_secret_value();
        Iex10Dispatcher{contract_address: ex10_address.try_into().unwrap()}.claim_points(secret_value, 12345_u128);
    }

    #[external]
    fn update_class_hash(class_hash: felt252) {
        update_class_hash_by_admin(class_hash);
    }
}