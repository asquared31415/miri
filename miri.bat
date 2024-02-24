:: This makes execution of ./miri on Linux and Windows the same.
:: Windows will not execute the bash script, and select this.
@echo off
set MIRI_SCRIPT_TARGET_DIR=%0\..\miri-script\target
cargo build %CARGO_EXTRA_FLAGS% -q --target-dir %MIRI_SCRIPT_TARGET_DIR% --manifest-path %0\..\miri-script\Cargo.toml

:: Forwards all arguments to this file to the executable.
:: We invoke the binary directly to avoid going through rustup, which would set some extra
:: env vars that we do not want.
%MIRI_SCRIPT_TARGET_DIR%\debug\miri-script %*