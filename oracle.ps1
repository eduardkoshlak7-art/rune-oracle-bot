# Bot Configuration
$Token = "8321634422:AAFoOLCEdW9nW9ocZ7jjGkKtewqpFyY8knU"
$ChatID = "-1003257715779"

# Runes Database
$Runes = @(
    @{Name="Fehu"; Symbol="ᚠ"; Meaning="Богатство, скот, изобилие"},
    @{Name="Uruz"; Symbol="ᚢ"; Meaning="Сила, здоровье, дикая мощь"},
    @{Name="Thurisaz"; Symbol="ᚦ"; Meaning="Защита, врата, конфликт"},
    @{Name="Ansuz"; Symbol="ᚬ"; Meaning="Сигналы, сообщения, общение"},
    @{Name="Raidho"; Symbol="ᚱ"; Meaning="Путешествие, путь, движение"},
    @{Name="Kenaz"; Symbol="ᚲ"; Meaning="Огонь, знание, просветление"},
    @{Name="Gebo"; Symbol="ᚷ"; Meaning="Партнерство, дар, баланс"},
    @{Name="Wunjo"; Symbol="ᚹ"; Meaning="Радость, свет, гармония"},
    @{Name="Hagalaz"; Symbol="ᚺ"; Meaning="Разрушение, стихии, изменение"},
    @{Name="Nauthiz"; Symbol="ᚾ"; Meaning="Нужда, сопротивление, ограничения"},
    @{Name="Isa"; Symbol="ᛁ"; Meaning="Лед, застой, неподвижность"},
    @{Name="Jera"; Symbol="ᛃ"; Meaning="Урожай, цикл, награда"},
    @{Name="Eihwaz"; Symbol="ᛇ"; Meaning="Защита, тис, выносливость"},
    @{Name="Perthro"; Symbol="ᛈ"; Meaning="Тайна, судьба, случай"},
    @{Name="Algiz"; Symbol="ᛉ"; Meaning="Защита, связь, убежище"},
    @{Name="Sowilo"; Symbol="ᛊ"; Meaning="Солнце, победа, успех"},
    @{Name="Tiwaz"; Symbol="ᛏ"; Meaning="Война, мужество, справедливость"},
    @{Name="Berkano"; Symbol="ᛒ"; Meaning="Рождение, рост, новые начала"},
    @{Name="Ehwaz"; Symbol="ᛖ"; Meaning="Движение, прогресс, партнерство"},
    @{Name="Mannaz"; Symbol="ᛗ"; Meaning="Человечество, самость, осознание"}
)

# Bot logic
while ($true) {
    $rune = Get-Random $Runes
    $message = "Руна дня: $($rune.Symbol) - $($rune.Name)`nЗначение: $($rune.Meaning)"
    
    # Send to Telegram
    $url = "https://api.telegram.org/bot$Token/sendMessage"
    $body = @{
        chat_id = $ChatID
        text = $message
    }
    
    try {
        Invoke-RestMethod -Uri $url -Method Post -Body $body
        Write-Host "Rune sent: $($rune.Name)"
    }
    catch {
        Write-Host "Error sending rune: $_"
    }
    
    Start-Sleep -Seconds 86400  # Wait 24 hours
}




