#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <filesystem>
#include <optional>
#include <vector>
#include <cctype> // for isalpha, isdigit, isspace

enum class TokenType {
    _return,
    int_lit,
    semi
};

struct Token {
    TokenType type;
    std::optional<std::string> value;
};

std::vector<Token> tokenize(const std::string& str) {
    std::vector<Token> tokens;
    std::string buf;

    for (size_t i = 0; i < str.length(); i++) {
        char c = str.at(i);

        if (std::isalpha(c)) {
            buf.push_back(c);
            i++;
            while (i < str.length() && std::isalpha(str.at(i))) {
                buf.push_back(str.at(i));
                i++;
            }
            i--;  // Step back to adjust for the outer loop's increment

            if (buf == "return") {
                tokens.push_back({TokenType::_return});
            } else {
                std::cerr << "Unexpected identifier: " << buf << std::endl;
                exit(EXIT_FAILURE);
            }
            buf.clear();

        } else if (std::isdigit(c)) {
            buf.push_back(c);
            i++;
            while (i < str.length() && std::isdigit(str.at(i))) {
                buf.push_back(str.at(i));
                i++;
            }
            i--;  // Adjust for the outer loop's increment
            tokens.push_back({TokenType::int_lit, buf});
            buf.clear();

        } else if (c == ';') {
            tokens.push_back({TokenType::semi});

        } else if (std::isspace(c)) {
            // Ignore whitespaces
            continue;

        } else {
            std::cerr << "Unexpected character: " << c << std::endl;
            exit(EXIT_FAILURE);
        }
    }
    return tokens;
}

std::string tokens_to_asm(const std::vector<Token>& tokens) {
    std::stringstream output;
    output << "global _start\n_start:\n";
    for (size_t i = 0; i < tokens.size(); i++) {
        const Token& token = tokens.at(i);
        if (token.type == TokenType::_return) {
            if (i + 1 < tokens.size() && tokens.at(i + 1).type == TokenType::int_lit) {
                if (i + 2 < tokens.size() && tokens.at(i + 2).type == TokenType::semi) {
                    output << "     mov rax, 60\n";
                    output << "     mov rdi, " << tokens.at(i + 1).value.value() << "\n";
                    output << "     syscall\n";
                }
            }
        }
    }
    return output.str();
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cerr << "Incorrect usage. Correct usage is:" << std::endl;
        std::cerr << "prism <input.pm>" << std::endl;
        return EXIT_FAILURE;
    }

    // Print the absolute path for debugging
    std::cout << "Attempting to open file: " << std::filesystem::absolute(argv[1]) << std::endl;

    // Read file content
    std::ifstream input(argv[1]);
    if (!input.is_open()) {
        std::cerr << "Failed to open the file: " << argv[1] << std::endl;
        return EXIT_FAILURE;
    }

    std::stringstream content_stream;
    content_stream << input.rdbuf();  // Read file content into stringstream
    input.close();

    std::string contents = content_stream.str();
    std::cout << "File contents:\n" << contents << std::endl;

    // Tokenize the file contents
    std::vector<Token> tokens = tokenize(contents);

    // Display tokens (optional, for debugging)
    std::cout << "Tokens:\n";
    for (const auto& token : tokens) {
        switch (token.type) {
            case TokenType::_return:
                std::cout << "Token: return" << std::endl;
                break;
            case TokenType::int_lit:
                std::cout << "Token: int_lit, value: " << token.value.value_or("null") << std::endl;
                break;
            case TokenType::semi:
                std::cout << "Token: semi" << std::endl;
                break;
        }
    }

    // Convert tokens to assembly and write to file
    std::string asm_code = tokens_to_asm(tokens);
    std::cout << asm_code << std::endl;

    std::ofstream file("out.asm");
    if (!file.is_open()) {
        std::cerr << "Failed to open out.asm for writing" << std::endl;
        return EXIT_FAILURE;
    }
    file << asm_code;
    file.close();

    // Assemble and link the assembly file
    system("nasm -f elf64 out.asm -o out.o");
    system("ld -o out out.o");

    return EXIT_SUCCESS;
}
